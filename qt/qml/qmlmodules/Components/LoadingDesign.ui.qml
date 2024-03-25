import QtQuick 2.15
import QtQuick.Controls 2.15
import Components

Rectangle {
    id: root

    anchors.fill: parent
    color: Colors.background500
    z: 2

    BusyIndicator {
        id: control

        anchors.centerIn: parent

        contentItem: Item {
            implicitHeight: 128
            implicitWidth: 128

            Item {
                id: item

                height: 128
                opacity: control.running ? 1 : 0
                width: 128
                x: parent.width / 2 - 32
                y: parent.height / 2 - 32

                // @disable-check M224
                Behavior on opacity  {
                    OpacityAnimator {
                        duration: 250
                    }
                }

                RotationAnimator {
                    duration: 1250
                    from: 0
                    loops: Animation.Infinite
                    running: control.visible && control.running
                    target: item
                    to: 360
                }

                Repeater {
                    id: repeater

                    model: 6

                    Rectangle {
                        color: Colors.primaryColor
                        implicitHeight: 10
                        implicitWidth: 10
                        radius: 5
                        x: item.width / 2 - width / 2
                        y: item.height / 2 - height / 2

                        transform: [
                            Translate {
                                y: -Math.min(item.width, item.height) * 0.5 + 5
                            },
                            Rotation {
                                angle: index / repeater.count * 360
                                origin.x: 5
                                origin.y: 5
                            }
                        ]
                    }
                }
            }
        }
    }
}
