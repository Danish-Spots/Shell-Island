import QtQuick
import QtQuick.Controls
import Quickshell

ListView {
    id: root
    required property var theme
    property string query: ""

    signal appLaunched()
    spacing: theme.spacingSm
    currentIndex: 0

    function moveSelection(delta) {
        if (count <= 0)
            return

        currentIndex = Math.max(
            0,
            Math.min(currentIndex + delta, count - 1)
        )
    }

    function launchSelected() {
        if (currentItem)
            currentItem.launch()
    }

    clip: true

    model: ScriptModel {
        values: DesktopEntries.applications.values.filter(app => {
            const value = root.query.toLowerCase()

            if (!value.length)
                return true

            const matchesName =
                app.name.toLowerCase().includes(value)

            const matchesKeywords =
                app.keywords.some(keyword =>
                    keyword.toLowerCase().includes(value)
                )

            return matchesName || matchesKeywords
        })
    }

    delegate: ItemDelegate {
        id: app
        required property var modelData

        width: root.width
        height: 64
        highlighted: ListView.isCurrentItem

        background: Rectangle {
            radius: root.theme.radiusLg

            color: app.highlighted
                ? root.theme.surfaceSelected
                : app.hovered
                    ? root.theme.surfaceHover
                    : "transparent"

            Behavior on color {
                ColorAnimation {
                    duration: root.theme.motionFast
                }
            }
        }

        function launch() {
            modelData.execute()
            root.appLaunched()
        }

        onClicked: launch()

        // icon + text...
        contentItem: Row { 
            spacing: root.theme.spacingMd
            Image { 
                source: Quickshell.iconPath(modelData.icon) 
                width: 44
                height: 44
                anchors.verticalCenter: parent.verticalCenter 
                fillMode: Image.PreserveAspectFit 
            } 
            Text { 
                anchors.verticalCenter: parent.verticalCenter 
                text: modelData.name 
                color: root.theme.textPrimary

                font.pixelSize: root.theme.fontMd
            } 
        }
    }
    onQueryChanged: currentIndex = 0
}