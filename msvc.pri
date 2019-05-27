!build_pass:message("msvc.pri")

CONFIG(debug,debug | release){
    QT_BIN_FILES += \
    $$[QT_INSTALL_BINS]/Qt5Cored.dll \
    $$[QT_INSTALL_BINS]/Qt5Guid.dll \
    $$[QT_INSTALL_BINS]/Qt5Widgetsd.dll \
    $$[QT_INSTALL_BINS]/Qt5Networkd.dll \
    $$[QT_INSTALL_BINS]/Qt5Sqld.dll \
    $$[QT_INSTALL_BINS]/Qt5SerialPortd.dll
    QT_BIN_PATH = $$OUT_PWD/debug/
    win32 {
        for(var, QT_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cmd /c copy /y $$shell_path($$var) $$shell_path($$QT_BIN_PATH) $$escape_expand(\\n\\t))
        }
    }
    unix {
        for(var, QT_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cp $$var $$QT_BIN_PATH $$escape_expand(\\n\\t))
        }
    }
    QT_PLATFORMS_BIN_FILES += \
    $$[QT_INSTALL_PLUGINS]/platforms/qwindowsd.dll
    QT_PLATFORMS_BIN_PATH = $$OUT_PWD/debug/platforms/
    win32 {
        for(var, QT_PLATFORMS_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cmd /c xcopy /y $$shell_path($$var) $$shell_path($$QT_PLATFORMS_BIN_PATH) $$escape_expand(\\n\\t))
        }
    }
    unix {
        for(var, QT_PLATFORMS_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cp $$var $$QT_PLATFORMS_BIN_PATH $$escape_expand(\\n\\t))
        }
    }

    QT_IMAGEPLUGINS_BIN_FILES += \
    $$[QT_INSTALL_PLUGINS]/imageformats/qicod.dll \
    $$[QT_INSTALL_PLUGINS]/imageformats/qjpegd.dll
    QT_PLATFORMS_BIN_PATH = $$OUT_PWD/debug/imageformats/
    win32 {
        for(var, QT_IMAGEPLUGINS_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cmd /c xcopy /y $$shell_path($$var) $$shell_path($$QT_PLATFORMS_BIN_PATH) $$escape_expand(\\n\\t))
        }
    }
    unix {
        for(var, QT_PLATFORMS_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cp $$var $$QT_PLATFORMS_BIN_PATH $$escape_expand(\\n\\t))
        }
    }
}else{
    QT_BIN_FILES += \
    $$[QT_INSTALL_BINS]/Qt5Core.dll \
    $$[QT_INSTALL_BINS]/Qt5Gui.dll \
    $$[QT_INSTALL_BINS]/Qt5Widgets.dll \
    $$[QT_INSTALL_BINS]/Qt5Network.dll \
    $$[QT_INSTALL_BINS]/Qt5Sql.dll \
    $$[QT_INSTALL_BINS]/Qt5SerialPort.dll
    QT_BIN_PATH = $$OUT_PWD/release/
    win32 {
        for(var, QT_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cmd /c copy /y $$shell_path($$var) $$shell_path($$QT_BIN_PATH) $$escape_expand(\\n\\t))
        }
    }
    unix {
        for(var, QT_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cp $$var $$QT_BIN_PATH $$escape_expand(\\n\\t))
        }
    }
    QT_PLATFORMS_BIN_FILES += \
    $$[QT_INSTALL_PLUGINS]/platforms/qwindows.dll
    QT_PLATFORMS_BIN_PATH = $$OUT_PWD/release/platforms/
    win32 {
        for(var, QT_PLATFORMS_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cmd /c xcopy /y $$shell_path($$var) $$shell_path($$QT_PLATFORMS_BIN_PATH) $$escape_expand(\\n\\t))
        }
    }
    unix {
        for(var, QT_PLATFORMS_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cp $$var $$QT_PLATFORMS_BIN_PATH $$escape_expand(\\n\\t))
        }
    }

    QT_IMAGEPLUGINS_BIN_FILES += \
    $$[QT_INSTALL_PLUGINS]/imageformats/qico.dll \
    $$[QT_INSTALL_PLUGINS]/imageformats/qjpeg.dll
    QT_PLATFORMS_BIN_PATH = $$OUT_PWD/debug/imageformats/
    win32 {
        for(var, QT_IMAGEPLUGINS_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cmd /c xcopy /y $$shell_path($$var) $$shell_path($$QT_PLATFORMS_BIN_PATH) $$escape_expand(\\n\\t))
        }
    }
    unix {
        for(var, QT_PLATFORMS_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cp $$var $$QT_PLATFORMS_BIN_PATH $$escape_expand(\\n\\t))
        }
    }
}
