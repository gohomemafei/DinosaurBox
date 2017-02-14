import QtQuick 2.5
import QtGraphicalEffects 1.0

Item {
    id: item
    width: 100
    height: 62

    property int elevation: 0
    property real radius: 0

    property string style: "default"

    property color backgroundColor: elevation > 0 ? "white" : "transparent"
    property color tintColor: "transparent"

    property alias border: rect.border

    property bool fullWidth
    property bool fullHeight

    property alias clipContent: rect.clip

    default property alias data: rect.data

    property bool elevationInverted: false

    property var bottomShadowData: [
        {
            "opacity": 0,
            "offset": 0,
            "blur": 0
        },

        {
            "opacity": 0.24,
            "offset": 1,
            "blur": 1
        },

        {
            "opacity": 0.23,
            "offset": 3,
            "blur": 3
        },

        {
            "opacity": 0.23,
            "offset": 6,
            "blur": 6
        },

        {
            "opacity": 0.22,
            "offset": 10,
            "blur": 10
        },

        {
            "opacity": 0.22,
            "offset": 15,
            "blur": 6
        }
    ]

    property var topShadowData: [
        {
            "opacity": 0,
            "offset": 0,
            "blur": 0
        },

        {
            "opacity": 0.12,
            "offset": 1,
            "blur": 1.5
        },

        {
            "opacity": 0.16,
            "offset": 3,
            "blur": 3
        },

        {
            "opacity": 0.19,
            "offset": 10,
            "blur": 10
        },

        {
            "opacity": 0.25,
            "offset": 14,
            "blur": 14
        },

        {
            "opacity": 0.30,
            "offset": 19,
            "blur": 19
        }
    ]

    Connections {
        onElevationChanged: {
            bottomShadowBlurAnimation.to = bottomShadowData[Math.min(elevation, 5)]["blur"];
            topShadowBlurAnimation.to = topShadowData[Math.min(elevation, 5)]["blur"];

            bottomShadowBlurAnimation.restart();
            topShadowBlurAnimation.restart();
        }

        Component.onCompleted: {
            bottomShadow.blur = bottomShadowData[Math.min(elevation, 5)]["blur"];
            topShadow.blur = topShadowData[Math.min(elevation, 5)]["blur"];
        }
    }

    NumberAnimation {
        id: bottomShadowBlurAnimation
        target: bottomShadow
        property: "blur"
        duration: 150
        easing.type: Easing.OutQuad
    }

    NumberAnimation {
        id: topShadowBlurAnimation
        target: topShadow
        property: "blur"
        duration: 150
        easing.type: Easing.OutQuad
    }

    RectangularGlow {
        id: bottomShadow
        property var elevationInfo: bottomShadowData[Math.min(elevation, 5)]
        property int blur: bottomShadowData[1]["blur"];
        property real horizontalShadowOffset: elevationInfo.offset * Math.sin((2 * Math.PI) * (parent.rotation / 360.0))
        property real verticalShadowOffset: elevationInfo.offset * Math.cos((2 * Math.PI) * (parent.rotation / 360.0))

        anchors.centerIn: parent
        width: parent.width + (fullWidth ? 10 : 0)
        height: parent.height + (fullHeight ? 20 : 0)
        anchors.horizontalCenterOffset: horizontalShadowOffset * (elevationInverted ? -1 : 1)
        anchors.verticalCenterOffset: verticalShadowOffset * (elevationInverted ? -1 : 1)
        glowRadius: blur
        opacity: elevationInfo.opacity
        spread: 0.05
        color: "black"
        cornerRadius: item.radius + glowRadius * 2.5
    }

    RectangularGlow {
        id: topShadow
        property var elevationInfo: topShadowData[Math.min(elevation, 5)]
        property int blur: topShadowData[1]["blur"];
        property real horizontalShadowOffset: elevationInfo.offset * Math.sin((2 * Math.PI) * (parent.rotation / 360.0))
        property real verticalShadowOffset: elevationInfo.offset * Math.cos((2 * Math.PI) * (parent.rotation / 360.0))

        anchors.centerIn: parent
        width: parent.width + (fullWidth ? 10 : 0)
        height: parent.height + (fullHeight ? 20 : 0)
        anchors.horizontalCenterOffset: horizontalShadowOffset * (elevationInverted ? -1 : 1)
        anchors.verticalCenterOffset: verticalShadowOffset * (elevationInverted ? -1 : 1)
        glowRadius: blur
        opacity: elevationInfo.opacity
        spread: 0.05
        color: "black"
        cornerRadius: item.radius + glowRadius * 2.5
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: Qt.tint(backgroundColor, tintColor)
        radius: item.radius
        antialiasing: parent.rotation || radius > 0 ? true : false
        clip: true

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }
}
