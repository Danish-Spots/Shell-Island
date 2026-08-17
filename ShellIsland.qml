import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

PanelWindow {
    id: root

    property bool launcherVisible: false

    property real pillWidth: 64
    property real pillHeight: 32

    property real launcherWidth: 700
    property real launcherHeight: 500

    implicitWidth: launcherWidth

    color: "transparent"

    exclusionMode: ExclusionMode.Ignore
    focusable: true

    anchors {
        top: true
        bottom: true
    }

    Theme {
        id: appTheme
    }

    mask: Region {
        item: island
    }

    WlrLayershell.keyboardFocus: launcherVisible
        ? WlrKeyboardFocus.Exclusive
        : WlrKeyboardFocus.None

    IpcHandler {
        target: "launcher"

        function toggle(): void {
            root.launcherVisible = !root.launcherVisible
        }
    }

    onLauncherVisibleChanged: {
        if (launcherVisible) {
            Qt.callLater(() => launcherContent.focusSearch())
        } else {
            launcherContent.clearSearch()
        }
    }

    Rectangle {
        id: island

        anchors.horizontalCenter: parent.horizontalCenter

        y: root.launcherVisible
            ? (root.height - root.launcherHeight) / 2
            : 8

        width: root.launcherVisible
            ? root.launcherWidth
            : root.pillWidth

        height: root.launcherVisible
            ? root.launcherHeight
            : root.pillHeight

        radius: appTheme.radiusXl
        color: appTheme.background

        clip: true

        border {
            width: root.launcherVisible ? 1 : 0
            color: appTheme.borderSubtle
        }

        Behavior on width {
            NumberAnimation {
                duration: appTheme.motionSlow
                easing.type: Easing.OutCubic
            }
        }

        Behavior on height {
            NumberAnimation {
                duration: appTheme.motionSlow
                easing.type: Easing.OutCubic
            }
        }

        Behavior on y {
            NumberAnimation {
                duration: appTheme.motionSlow
                easing.type: Easing.OutCubic
            }
        }

        Item {
            id: pillContent

            anchors.fill: parent

            visible: !root.launcherVisible

            SystemClock {
                id: clock
                precision: SystemClock.Minutes
            }

            Text {
                anchors.centerIn: parent

                text: Qt.formatDateTime(clock.date, "HH:mm")
                color: appTheme.textPrimary
                font.pixelSize: appTheme.fontSm
            }
        }

        Launcher {
            id: launcherContent

            anchors {
                fill: parent
                margins: appTheme.spacingLg
            }

            visible: root.launcherVisible

            theme: appTheme

            onCloseRequested: {
                root.launcherVisible = false
            }
        }
    }
}