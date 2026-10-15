import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "Brand.js" as Brand

ToolButton {
    property string iconSource

    activeFocusOnTab: true

    icon.source: iconSource
    icon.width: 20
    icon.height: 20
    icon.color: hovered || visualFocus ? Brand.text : Brand.secondary
    Layout.preferredHeight: 34
    Layout.preferredWidth: 34
    background: Rectangle {
        radius: 8
        color: parent.hovered || parent.visualFocus ? "#2A323E" : "transparent"
        border.width: parent.visualFocus ? 1 : 0
        border.color: Brand.red
    }

    Keys.onReturnPressed: {
        clicked()
    }

    Keys.onEnterPressed: {
        clicked()
    }

    Keys.onRightPressed: {
        nextItemInFocusChain(true).forceActiveFocus(Qt.TabFocus)
    }

    Keys.onLeftPressed: {
        nextItemInFocusChain(false).forceActiveFocus(Qt.TabFocus)
    }
}
