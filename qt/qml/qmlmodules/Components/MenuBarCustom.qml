import QtQuick 2.15

MenuBarCustomDesign {
    id: root

    signal searchFieldHasCleaned
    signal searchPressed(string searchText)

    inputField.searchButton.onPressed: searchPressed(inputField.searchField.text)
    inputField.searchField.onTextChanged: {
        if (inputField.searchField.text.length === 0) {
            root.searchFieldHasCleaned();
        }
    }
}
