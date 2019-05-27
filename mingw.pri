!build_pass:message("mingw.pri")

#IMAGEPLUGINS = qico.dll qjpeg.dll
#QTLIBS = Qt5Core.dll Qt5Gui.dll Qt5Widgets.dll Qt5Network.dll Qt5Sql.dll Qt5SerialPort.dll
#MINGWLIBS = libwinpthread-1.dll libstdc++-6.dll libgcc_s_dw2-1.dll
#QTPLATFORMS = qwindows.dll

CONFIG(debug,debug | release){
    QT_BIN_FILES += \
    $$[QT_INSTALL_BINS]/Qt5Cored.dll \
    $$[QT_INSTALL_BINS]/Qt5Guid.dll \
    $$[QT_INSTALL_BINS]/Qt5Widgetsd.dll \
    $$[QT_INSTALL_BINS]/Qt5Networkd.dll \
    $$[QT_INSTALL_BINS]/Qt5Sqld.dll \
    $$[QT_INSTALL_BINS]/Qt5SerialPortd.dll \
    $$[QT_INSTALL_BINS]/libwinpthread-1.dll \
    $$[QT_INSTALL_BINS]/libstdc++-6.dll \
    $$[QT_INSTALL_BINS]/libgcc_s_dw2-1.dll
    QT_BIN_PATH = $$OUT_PWD/debug/
    win32 {
        for(var, QT_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cmd /c copy /y \"$$shell_path($$var)\" \"$$shell_path($$QT_BIN_PATH)\" $$escape_expand(\\n\\t))
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
    $$[QT_INSTALL_BINS]/Qt5SerialPort.dll \
    $$[QT_INSTALL_BINS]/libwinpthread-1.dll \
    $$[QT_INSTALL_BINS]/libstdc++-6.dll \
    $$[QT_INSTALL_BINS]/libgcc_s_dw2-1.dll
    QT_BIN_PATH = $$OUT_PWD/release/
    win32 {
        for(var, QT_BIN_FILES) {
            QMAKE_POST_LINK += $$quote(cmd /c copy /y \"$$shell_path($$var)\" \"$$shell_path($$QT_BIN_PATH)\" $$escape_expand(\\n\\t))
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
