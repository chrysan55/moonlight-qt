import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.2
import "Brand.js" as Brand

Dialog {
    id: brandedDialog
    modal: true
    padding: 24
    background: Rectangle { color: Brand.surface; radius: 16; border.color: Brand.border }
    Overlay.modal: Rectangle { color: "#B3090C11" }
    footer: DialogButtonBox {
        standardButtons: brandedDialog.standardButtons
        background: Item {}
        leftPadding: 16
        rightPadding: 16
        bottomPadding: 12
        delegate: Button {
            flat: true
            Material.accent: Brand.text
        }
    }
    anchors.centerIn: Overlay.overlay

    onClosed: {
        // We must force focus back to the last item. If we don't,
        // gamepad and keyboard navigation will break after a
        // dialog appears.
        stackView.forceActiveFocus()
    }
}
