import Felgo 3.0
import QtQuick 2.0

Item {
  width: parent.width/3
  height: width

  property alias label: text.text
  property alias labelIcon: icon.icon
  property bool active: true

  AppPaper {
    id: button

    anchors.centerIn: parent

    width: Math.min(dp(100),parent.width*0.6)
    height: width
    radius: width/2

    background.color: active ? "#ffffff" : "#f5f7f9"
    shadowColor: mouseArea.pressed ? "#00000000" : "#15000000"
    Behavior on shadowColor {ColorAnimation {duration: 100}}
    shadowSizeDefault: dp(5)
    shadowOffsetDefault: dp(5)

    AppText {
      id: text
      visible: label
      color: active ? Theme.colors.tintColor : "#ccc"
      anchors.centerIn: parent
      font.pixelSize: button.width/5
    }

    Icon {
      id: icon
      visible: labelIcon
      color: active ? Theme.colors.tintColor : "#ccc"
      anchors.centerIn: parent
      size: button.width/3
    }

    MouseArea {
      id: mouseArea
      anchors.fill: parent
      onClicked: {
        active = !active
      }
    }
  }
}
