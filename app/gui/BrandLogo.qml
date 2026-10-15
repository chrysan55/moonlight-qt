import QtQuick 2.9

// The original transparent image is preserved. Only the YDET wordmark is shown.
Item {
    implicitWidth: 86
    implicitHeight: 28
    clip: true

    Image {
        width: parent.width * 960 / 174
        height: parent.height * 100 / 50
        x: -parent.width * 8 / 174
        y: -parent.height * 25 / 50
        source: "qrc:/res/brand/ydet-original.png"
        smooth: true
    }
}
