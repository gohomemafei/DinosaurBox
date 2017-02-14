import QtQuick 2.5

QtObject {
    id: palette

    property bool light

    readonly property color textColor: light ? shade(0.85) : shade(1)
    readonly property color subTextColor: light ? shade(0.54) : shade(0.70)
    readonly property color iconColor: light ? subTextColor : textColor
    readonly property color hintColor: light ? shade(0.26) : shade(0.30)
    readonly property color dividerColor: shade(0.12)


    property color accentColor: "#2196f3"

    function shade(alpha) {
        if (light) {
            return Qt.rgba(0,0,0,alpha)
        } else {
            return Qt.rgba(1,1,1,alpha)
        }
    }
}
