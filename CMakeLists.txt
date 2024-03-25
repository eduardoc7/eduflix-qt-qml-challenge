cmake_minimum_required(VERSION 3.16)

project(eduflix-qt-qml-challenge VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC True)
set(CMAKE_AUTOUIC True)
set(CMAKE_AUTORCC True)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CORE_LIBRARY eduflix-qt-qml-core)
set(CORE_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/core/src)

add_compile_definitions(APP_NAME="${CMAKE_PROJECT_NAME}")
add_compile_definitions(APP_VERSION="${CMAKE_PROJECT_VERSION}")

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Quick)

qt_standard_project_setup(REQUIRES 6.5)
qt_policy(SET QTP0001 NEW)

# Configuring QML files import paths for Qt Creator
list(APPEND QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}/qt/qml")
list(APPEND QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}/qt/qml/qmlmodules")
list(REMOVE_DUPLICATES QML_IMPORT_PATH)
set(QML_IMPORT_PATH ${QML_IMPORT_PATH}
    CACHE STRING "Qt Creator extra qml import paths"
    FORCE
)
set(QML_IMPORT_PATH ${QML_IMPORT_PATH} "" INTERNAL)

add_subdirectory(core)
add_subdirectory(qt/qml)
add_subdirectory(qt/qml/models)
add_subdirectory(qt/qml/qmlmodules/Screens)
add_subdirectory(qt/qml/qmlmodules/Components)


