import QtQuick

Item {
    id: launcher

    required property var theme

    signal closeRequested()

    function focusSearch() {
        search.forceActiveFocus()
    }

    function clearSearch() {
        search.text = ""
    }

    Column {
        anchors.fill: parent

        spacing: launcher.theme.spacingMd

        LauncherSearch {
            id: search

            width: parent.width

            theme: launcher.theme

            onMoveSelection: delta => {
                appList.moveSelection(delta)
            }

            onLaunchSelected: {
                appList.launchSelected()
            }

            onCloseRequested: {
                launcher.closeRequested()
            }
        }

        LauncherAppList {
            id: appList

            width: parent.width
            height: parent.height - search.height - parent.spacing

            theme: launcher.theme
            query: search.text

            onAppLaunched: {
                launcher.closeRequested()
            }
        }
    }
}