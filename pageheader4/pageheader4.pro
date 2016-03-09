TEMPLATE = app
TARGET = pageheader4

load(ubuntu-click)

QT += qml quick

SOURCES += main.cpp

RESOURCES += pageheader4.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  pageheader4.apparmor \
               pageheader4.png

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)

#show all the files in QtCreator
OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
               pageheader4.desktop

#specify where the config files are installed to
config_files.path = /pageheader4
config_files.files += $${CONF_FILES}
INSTALLS+=config_files

#install the desktop file, a translated version is 
#automatically created in the build directory
desktop_file.path = /pageheader4
desktop_file.files = $$OUT_PWD/pageheader4.desktop
desktop_file.CONFIG += no_check_exist
INSTALLS+=desktop_file

# Default rules for deployment.
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target

