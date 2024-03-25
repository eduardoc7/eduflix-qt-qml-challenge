set(MODLULE_NAME Components)

file(GLOB_RECURSE QML_FILES_LIST
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/*.qml"
)

file(GLOB SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
)

file(GLOB RESOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/resources/*.png"
)

set_source_files_properties(
    ${CMAKE_CURRENT_SOURCE_DIR}/Fonts.qml
    ${CMAKE_CURRENT_SOURCE_DIR}/Colors.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(${MODLULE_NAME}
    URI ${MODLULE_NAME}
    VERSION 1.0
    STATIC
    PLUGIN_TARGET ${MODLULE_NAME}Plugin
    QML_FILES ${QML_FILES_LIST}
    SOURCES ${SOURCES}
    RESOURCES ${RESOURCES}
)

target_compile_definitions(${MODLULE_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${MODLULE_NAME} PRIVATE ${QtModules})
set_target_properties(${MODLULE_NAME} PROPERTIES VERSION ${PROJECT_VERSION})
target_include_directories(${MODLULE_NAME} PUBLIC .)

