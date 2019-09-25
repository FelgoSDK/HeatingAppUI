import QtQuick.Controls 2.5 as QQC2
import QtQuick 2.0
import Felgo 3.0

Item {
  id: item

  width: dp(250)
  height: width

  property real heat: control.value
  property color coldColor: "#4682e0"
  property color hotColor: "#bd2233"
  property color heatColor: Qt.rgba(
    coldColor.r*(1-control.position) + hotColor.r*control.position,
    coldColor.g*(1-control.position) + hotColor.g*control.position,
    coldColor.b*(1-control.position) + hotColor.b*control.position,
    1
  )

  AppImage {
    id: gradient
    source: "../assets/gradient.png"
    anchors.fill: parent
  }

  AppPaper {
    width: gradient.width - dp(60)
    height: width
    radius: width/2
    anchors.centerIn: parent

    background.color: "#ffffff"
    shadowColor: "#15000000"//mouseArea.pressed ? "#00000000" : "#15000000"
    Behavior on shadowColor {ColorAnimation {duration: 100}}
    shadowSizeDefault: dp(5)
    shadowOffsetDefault: dp(5)
  }

  QQC2.Dial {
    id: control
    anchors.centerIn: parent
    width: parent.width
    height: width
    from: 10
    to: 30
    stepSize: 0.1
    value: 21
    snapMode: QQC2.Dial.SnapAlways
    background: Item {}
    handle: AppPaper {
      id: handleItem
      width: dp(30)
      height: width
      radius: width/2
      background.color: "#ffffff"
      shadowColor: "#20000000"
      shadowSizeDefault: dp(5)
      x: control.x + control.width / 2 - width / 2
      y: control.y + control.height / 2 - height / 2

      transform: [
        Translate {
          y: -Math.min(control.width, control.height) * 0.54 + handleItem.height / 2
        },
        Rotation {
          angle: control.angle
          origin.x: handleItem.width / 2
          origin.y: handleItem.height / 2
        }
      ]
    }
  }

  IconButton {
    icon: IconType.chevronup
    anchors.centerIn: parent
    anchors.verticalCenterOffset: -dp(70)
    color: heatColor
    onClicked: {
      control.increase()
    }
  }

  IconButton {
    icon: IconType.chevrondown
    anchors.centerIn: parent
    anchors.verticalCenterOffset: dp(70)
    color: heatColor
    onClicked: {
      control.decrease()
    }
  }

  AppText {
    anchors.centerIn: parent
    text: heat.toFixed(1) + "°"
    color: heatColor
    font.pixelSize: sp(36)
  }
}
