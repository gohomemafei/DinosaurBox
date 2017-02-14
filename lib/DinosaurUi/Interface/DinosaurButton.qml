import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../Element"

Button
{
    id: button
    width: 200
    height: 60

    FontLoader
    {
        id: localFont
        source: "../fonts/Material-Design-Iconic-Font.ttf"
    }

    Label
    {
        text: qsTr("Button按钮")
        font.family: localFont.name
        font.pixelSize: 20
        anchors.centerIn: parent
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            console.log(localFont.name)
        }
    }
}
