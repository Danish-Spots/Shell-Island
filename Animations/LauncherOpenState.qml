import QtQuick

State {
    name: "launcher"

    required property Item island
    required property Item launcherContent

    required property real launcherWidth
    required property real launcherHeight

    PropertyChanges {
        target: island

        width: launcherWidth
        height: launcherHeight
    }

    PropertyChanges {
        target: launcherContent

        opacity: 1
    }
}