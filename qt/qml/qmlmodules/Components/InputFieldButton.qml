import QtQuick 2.15

InputFieldButtonDesign {
    id: root

    property string exPlaceHolderText: qsTr("Type a show to search")
    property string exSearchButtonText: qsTr("Search")

    searchButton.text: exSearchButtonText
    searchField.placeholderText: exPlaceHolderText
}
