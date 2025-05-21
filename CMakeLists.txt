cmake_minimum_required(VERSION 3.16)

project(qml_vs_cpp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Sql)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appqml_vs_cpp
    main.cpp
)

qt_add_qml_module(appqml_vs_cpp
    URI qml_vs_cpp
    VERSION 1.0
    QML_FILES
        Main.qml
        SOURCES
    RESOURCES res.qrc
    SOURCES
    QML_FILES Login.qml
    QML_FILES Register.qml
    QML_FILES NekoLibro.qml
    #QML_FILES AccountPage.qml
    #QML_FILES ProductPage.qml
    #QML_FILES SellPage.qml
    #QML_FILES StaffPage.qml
    #QML_FILES HomePage.qml
    #QML_FILES SettingPage.qml
    SOURCES
    SOURCES login.h login.cpp
    SOURCES database.h database.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appqml_vs_cpp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqml_vs_cpp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqml_vs_cpp
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appqml_vs_cpp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
