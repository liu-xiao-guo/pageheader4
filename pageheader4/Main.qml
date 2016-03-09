import QtQuick 2.4
import Ubuntu.Components 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "pageheader4.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)

    Page {
        id: page
        header: standardHeader
        Label {
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: page.header.bottom
                topMargin: units.gu(5)
            }
            text: "Use the icons in the header."
            visible: standardHeader.visible
        }
        PageHeader {
            id: standardHeader
            visible: page.header === standardHeader
            title: "Default title"
            trailingActionBar.actions: [
                Action {
                    iconName: "search"
                    text: "Search"
                    onTriggered: page.header = searchHeader
                },
                Action {
                    iconName: "edit"
                    text: "Edit"
                    onTriggered: page.header = editHeader
                }
            ]
        }
        PageHeader {
            id: searchHeader
            visible: page.header === searchHeader
            leadingActionBar.actions: [
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: page.header = standardHeader
                }
            ]
            contents: TextField {
                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                placeholderText: "Search..."
            }
        }
        PageHeader {
            id: editHeader
            visible: page.header === editHeader
            property Component delegate: Component {
                AbstractButton {
                    id: button
                    action: modelData
                    width: label.width + units.gu(4)
                    height: parent.height
                    Rectangle {
                        color: UbuntuColors.blue
                        opacity: 0.1
                        anchors.fill: parent
                        visible: button.pressed
                    }
                    Label {
                        anchors.centerIn: parent
                        id: label
                        text: action.text
                        font.weight: text === "Confirm"
                                     ? Font.Normal
                                     : Font.Light
                    }
                }
            }
            leadingActionBar {
                anchors.leftMargin: 0
                actions: Action {
                    text: "Cancel"
                    iconName: "close"
                    onTriggered: page.header = standardHeader
                }
                delegate: editHeader.delegate
            }
            trailingActionBar {
                anchors.rightMargin: 0
                actions: Action {
                    text: "Confirm"
                    iconName: "tick"
                    onTriggered: page.header = standardHeader
                }
                delegate: editHeader.delegate
            }
            extension: Toolbar {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                trailingActionBar.actions: [
                    Action { iconName: "bookmark-new" },
                    Action { iconName: "add" },
                    Action { iconName: "edit-select-all" },
                    Action { iconName: "edit-copy" },
                    Action { iconName: "select" }
                ]
                leadingActionBar.actions: Action {
                    iconName: "delete"
                    text: "delete"
                    onTriggered: print("Delete action triggered")
                }
            }
        }
    }
}

