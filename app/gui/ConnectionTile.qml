import QtQuick 2.9
import QtQuick.Controls 2.2
import "Brand.js" as Brand

Item {
    id: tile
    property string title
    property string subtitle
    property string actionText
    property string statusText
    property color statusColor: Brand.muted
    property bool primaryAction: true
    property bool hovered: false
    property bool highlighted: false
    property bool saved: false

    Rectangle {
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.bottomMargin: -5
        radius: 20
        color: "#090B0F"
        opacity: 0.6
    }

    Rectangle {
        anchors.fill: parent
        radius: 20
        color: tile.hovered ? Brand.surfaceHover : Brand.surface
        border.width: tile.highlighted ? 2 : 1
        border.color: tile.highlighted ? Brand.red : Brand.border
        Behavior on color { ColorAnimation { duration: 120 } }
    }

    Row {
        x: 24
        y: 21
        spacing: 7
        Rectangle { width: 3; height: 12; radius: 1; color: Brand.red; anchors.verticalCenter: parent.verticalCenter }
        Text { text: "我的云电脑"; color: Brand.secondary; font.pixelSize: 12; font.letterSpacing: 1 }
    }

    Row {
        anchors.right: parent.right
        anchors.rightMargin: tile.saved ? 60 : 24
        y: 21
        spacing: 6
        Rectangle { width: 6; height: 6; radius: 3; color: tile.statusColor; anchors.verticalCenter: parent.verticalCenter }
        Text { text: tile.statusText; color: tile.statusColor; font.pixelSize: 11 }
    }

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 49
        width: 142
        height: 92
        source: "qrc:/res/brand/desktop.svg"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 146
        width: parent.width - 48
        text: tile.title
        color: Brand.text
        font.pixelSize: 21
        font.weight: Font.DemiBold
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 180
        width: parent.width - 48
        text: tile.subtitle
        color: Brand.secondary
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 22
        height: 40
        radius: 9
        color: tile.primaryAction ? (tile.hovered ? Brand.redHover : Brand.red) : "#2B3340"
        Behavior on color { ColorAnimation { duration: 120 } }

        Text {
            anchors.centerIn: parent
            text: tile.actionText
            color: Brand.text
            font.pixelSize: 14
            font.weight: Font.DemiBold
        }

        Image {
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.verticalCenter: parent.verticalCenter
            width: 17
            height: 17
            source: "qrc:/res/brand/arrow-up-right.svg"
        }
    }
}
