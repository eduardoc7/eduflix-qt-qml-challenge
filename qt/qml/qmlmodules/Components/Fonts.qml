pragma Singleton
import QtQuick 2.15

QtObject {
    readonly property font body100: Qt.font({
            "family": fontFamily,
            "normal": true,
            "pixelSize": 12
        })
    readonly property font body200: Qt.font({
            "family": fontFamily,
            "normal": true,
            "pixelSize": 14
        })
    readonly property font body300: Qt.font({
            "family": fontFamily,
            "normal": true,
            "pixelSize": 16
        })
    readonly property string fontFamily: "Roboto"
    readonly property font heading100: Qt.font({
            "family": fontFamily,
            "bold": true,
            "pixelSize": 24
        })
    readonly property font heading200: Qt.font({
            "family": fontFamily,
            "bold": true,
            "pixelSize": 32
        })
    readonly property font heading300: Qt.font({
            "family": fontFamily,
            "bold": true,
            "pixelSize": 48
        })
    readonly property font heading400: Qt.font({
            "family": fontFamily,
            "bold": true,
            "pixelSize": 64
        })
    readonly property font title100: Qt.font({
            "family": fontFamily,
            "bold": true,
            "pixelSize": 12
        })
    readonly property font title200: Qt.font({
            "family": fontFamily,
            "bold": true,
            "pixelSize": 14
        })
    readonly property font title300: Qt.font({
            "family": fontFamily,
            "bold": true,
            "pixelSize": 16
        })
    readonly property font title400: Qt.font({
            "family": fontFamily,
            "bold": true,
            "pixelSize": 20
        })
}
