import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../Element"

Button
{
    id: button
    width: 88
    height: 36

    property int elevation: 1
    property color backgroundColor: elevation > 0 ? "white" : "transparent"
    property color textColor: lightDark(button.backgroundColor,"#d8000000", "#ffffff")
    property string textFontFamily: "微软雅黑";
    property int textSize: 16
    property int textVerticalAlignment: Text.AlignVCenter
    property int textHorizontalAlignment: Text.AlignHCenter
    property bool textFontBold: false
    property string context: "default" // or "dialog" or "snackbar"
    property int labelWidth
    property var itemForLabel: null
    property bool iconVisible: false
    property int iconSize: 40
    property string iconFontFamily: ""
    property string iconText: ""

    function lightDark(background, lightColor, darkColor) {
        return isDarkColor(background) ? darkColor : lightColor
    }

    function isDarkColor(background) {
        var temp = Qt.darker(background, 1)
        var a = 1 - ( 0.299 * temp.r + 0.587 * temp.g + 0.114 * temp.b);
        return temp.a > 0 && a >= 0.3
    }

    style: ButtonStyle
    {
        padding
        {
            left: 0
            right: 0
            top: 0
            bottom: 0
        }

        background: View
        {
            radius: 2

            elevation: {
                var elevation = button.elevation

                if (elevation > 0 && (control.focus || mouseArea.currentCircle))
                    elevation++;

                return elevation;
            }
            backgroundColor: button.backgroundColor

            tintColor: mouseArea.currentCircle || control.focus || ((isSmartPhone()) ? (false) : (control.hovered))
                    ? Qt.rgba(0,0,0, mouseArea.currentCircle
                           ? 0.1 : button.elevation > 0 ? 0.03 : 0.05)
                    : "transparent"

            function isSmartPhone() {
                return (Qt.platform.os === "ios") || (Qt.platform.os === "android");
            }

            Ink {
                id: mouseArea

                anchors.fill: parent
                focused: control.focus && button.context != "dialog" && button.context != "snackbar"
                focusWidth: parent.width - (30)
                focusColor: Qt.darker(button.backgroundColor, 1.05)

                Connections {
                    target: control.__behavior
                    onPressed: mouseArea.onPressed(mouse)
                    onCanceled: mouseArea.onCanceled()
                    onReleased: mouseArea.onReleased(mouse)
                }
            }
        }

        label: Item
        {
            implicitHeight: Math.max( 36, label.height+16)
            implicitWidth: button.context == "dialog" ? Math.max( 64, label.width + 16) : button.context == "snackbar" ? label.width+16 : Math.max( 88, label.width+32)

            Label
            {
                id: label
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenterOffset: (iconVisible) ? (iconSize / 2) : (0)
                font.pixelSize: textSize
                text: control.text
                font.family: textFontFamily
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: (control.enabled) ? (button.textColor) : (alpha(button.textColor, 0.4))
                renderType: Text.QtRendering

                function alpha(color, alpha) {
                    var realColor = Qt.darker(color, 1)
                    realColor.a = alpha
                    return realColor
                }

                onWidthChanged: {
                    labelWidth = width;
                }

                Component.onCompleted:
                {
                    button.itemForLabel = this;
                }

                Label
                {
                    anchors.right: parent.left
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: iconSize
                    font.family: iconFontFamily
                    visible: iconVisible
                    color: parent.color
                    text: iconText
                }
            }
        }
    }
}
