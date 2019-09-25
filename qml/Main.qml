import QtQuick 2.0
import Felgo 3.0

App {
  id: app

  onInitTheme: {
    Theme.iconFont = iconFont

    Theme.colors.tintColor = "#3e96f1"

    Theme.colors.textColor = "#40464d"
    Theme.colors.backgroundColor = "#f5f7f9"

    Theme.navigationBar.backgroundColor = "#ffffff"
    Theme.navigationBar.shadowHeight = 0
    Theme.navigationBar.dividerColor = "transparent"
    Theme.navigationBar.titleColor = "#40464d"
  }

  FontLoader{
    id: iconFont
    source: "../assets/fa-light-300.ttf"
  }

  NavigationStack {

    Page {
      title: qsTr("Temperature Control")

      AppPaper {
        width: parent.width
        height: dp(10)
        y: -height
        shadowColor: "#15000000"
        shadowSizeDefault: dp(5)
      }
      Row {
        width: parent.width

        ButtonRound {
          labelIcon: IconType.poweroff
        }
        ButtonRound {
          label: "Auto"
        }
        ButtonRound {
          labelIcon: "\uf186"
          active: false
        }
      }

      HeatDial {
        anchors.centerIn: parent
      }

      Row {
        width: parent.width
        anchors.bottom: parent.bottom

        ButtonRound {
          labelIcon: "\uf800"
          active: false
        }
        ButtonRound {
          labelIcon: IconType.tint
        }
        ButtonRound {
          labelIcon: "\uf773"
          active: false
        }
      }
    }
  }
}
