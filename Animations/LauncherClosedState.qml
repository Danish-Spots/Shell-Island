import QtQuick

State {
    name: "pill"

    required property Item island
    required property Item launcherContent

    required property real pillWidth
    required property real pillHeight

    PropertyChanges {
        target: island

        width: pillWidth
        height: pillHeight
    }

    PropertyChanges {
        target: launcherContent

        opacity: 0
    }
}