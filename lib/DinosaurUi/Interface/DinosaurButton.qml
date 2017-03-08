import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button
{
    id: button
    width: 88
    height: 36

    style: ButtonStyle
    {

    background: Rectangle {
                  implicitWidth: 100
                  implicitHeight: 25
                  border.width: control.activeFocus ? 2 : 1
                  border.color: "#888"
                  radius: 4
                  gradient: Gradient {
                      GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                      GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                  }
              }
    }
}
