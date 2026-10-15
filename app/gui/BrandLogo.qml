import QtQuick 2.9

// Lossless crop of the original wordmark, displayed at its original aspect ratio.
Image {
    implicitWidth: 86
    implicitHeight: 28
    source: "qrc:/res/brand/ydet-wordmark.png"
    fillMode: Image.PreserveAspectFit
    smooth: true
}
