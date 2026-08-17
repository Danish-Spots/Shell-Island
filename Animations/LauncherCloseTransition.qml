import QtQuick

Transition {
    from: "launcher"
    to: "pill"

    required property Item island
    required property Item launcherContent

    ParallelAnimation {
        SpringAnimation {
            target: island
            property: "width"

            spring: 3.0
            damping: 0.33
            mass: 1.0
            epsilon: 0.5
        }

        SpringAnimation {
            target: island
            property: "height"

            spring: 3.0
            damping: 0.30
            mass: 1.0
            epsilon: 0.5
        }

        NumberAnimation {
            target: launcherContent
            property: "opacity"

            duration: 70
            easing.type: Easing.OutCubic
        }
    }
}