import QtQuick
import QtQuick.Controls

TextField {
    id: root
    required property var theme
    signal moveSelection(int delta)
    signal launchSelected()
    signal closeRequested()
    placeholderText: "Search apps..."
    placeholderTextColor: theme.textMuted
    focus: true

    leftPadding: theme.spacingMd
    rightPadding: theme.spacingMd
    color: theme.textPrimary
    selectionColor: theme.accent
    font.pixelSize: theme.fontMd

    background: Rectangle {
        color: root.theme.surfaceElevated

        radius: root.theme.radiusLg

        border {
            width: root.activeFocus ? 1 : 0
            color: root.theme.accent
        }

        Behavior on color {
            ColorAnimation {
                duration: root.theme.motionFast
            }
        }
    }
    Keys.onPressed: event => {
        switch (event.key) {
            case Qt.Key_Down:
                root.moveSelection(1)
                event.accepted = true
                break

            case Qt.Key_Up:
                root.moveSelection(-1)
                event.accepted = true
                break

            case Qt.Key_Escape:
                root.closeRequested()
                event.accepted = true
                break
        }
    }

    onAccepted: root.launchSelected()
}