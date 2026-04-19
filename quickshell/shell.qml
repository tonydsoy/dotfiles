import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
    // Invisible root container to prevent repeater from spawning an empty window.
    visible:false
    Repeater {
        model: Quickshell.screens

        PanelWindow {
            screen:modelData

            anchors {
                top: true
                left: true
                right: true
            }

            color: "transparent"

            implicitHeight: 20

            Text {
                id: timeText
                anchors.centerIn: parent

                color: "#000000"

                HoverHandler {
                    id: textHover
                }

                property string time: "loading"
                property string timeExtended: "loading"

                text: textHover.hovered ? timeExtended : time

                Process {
                    id: timeProc
                    command: ["date", "+%I:%M %P"]
                    running: true
                    stdout: StdioCollector {
                        onStreamFinished: timeText.time = this.text
                    }
                }
                Process {
                    id: timeProcExtended
                    command: ["date", "+%I:%M:%S %P"]
                    running: true
                    stdout: StdioCollector {
                        onStreamFinished: timeText.timeExtended = this.text
                    }
                }


                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: timeProc.running = true
                }
                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: timeProcExtended.running = true
                }
            }
            Text {

                HoverHandler {
                    id: textHover2
                }

                height: 17
                anchors.leftMargin: 4
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                text: textHover2.hovered ? "Press Win+R for wofi, Win+L to logout" : "tonydsoy"
            }

            Text {
                id: volumeText

                height: 17
                anchors.rightMargin: 4
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                Process {
                    id: volumeProc
                    command: ["sh", "-c", "echo ☀ $(brightnessctl -m | cut -d, -f4) ♫ $(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}') ⏻ $(batteryalert -p)% "]
                    running: true
                    stdout: StdioCollector {
                        onStreamFinished: volumeText.text = this.text
                    }
                }

                Timer {
                    interval: 500
                    running: true
                    repeat: true
                    onTriggered: volumeProc.running = true
                }

                text: "you caught this in the 7 milliseconds it takes for date to run, congrats."
            }
        }
    }
}
