import QtQuick
import Quickshell

PanelWindow {
    id: root

    implicitWidth: expandedWidth
    implicitHeight: expandedHeight

    color: "transparent"
    exclusionMode: ExclusionMode.Ignore

    margins.top: 4

    mask: Region {
        item: droplet
    }

    property bool expanded: false

    property real collapsedWidth: 64
    property real collapsedHeight: 32

    property real hoverWidth: collapsedWidth * 2

    property real expandedWidth: 128
    property real expandedHeight: 256

    property real radius: 24
    property string backgroundColor: "#030000"

    default property alias content: contentContainer.data

    anchors {
        top: true
    }

    signal leftClicked()
    signal rightClicked()

    Rectangle {
        id: droplet

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        width: root.expanded
            ? root.expandedWidth
            : hover.hovered
                ? root.hoverWidth
                : root.collapsedWidth

        height: root.expanded
            ? root.expandedHeight
            : root.collapsedHeight

        color: root.backgroundColor
        radius: root.radius

        HoverHandler {
            id: hover
        }

        Item {
            id: contentContainer
            anchors.fill: parent
        }

        Behavior on width {
            NumberAnimation {
                duration: 180
                easing.type: Easing.OutCubic
            }
        }

        Behavior on height {
            NumberAnimation {
                duration: 220
                easing.type: Easing.OutCubic
            }
        }
        TapHandler {
            acceptedButtons: Qt.LeftButton
            onTapped: root.leftClicked()
        }

        TapHandler {
            acceptedButtons: Qt.RightButton
            onTapped: root.rightClicked()
        }
    }
}