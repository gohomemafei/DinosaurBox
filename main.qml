import QtQuick 2.4
import Qt.labs.controls 1.0
import "qrc:/DinosaurUi/Interface/"

ApplicationWindow
{
    id: root
    visible: true
    width: 400
    height: 600
    title: qsTr("DinosaurBox")
    color: "#fafafa"

    DinosaurButton
    {
        anchors.centerIn: parent
    }
}
