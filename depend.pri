# 依赖复制脚本
# http://landcareweb.com/questions/10235/qmake-ru-he-jiang-wen-jian-fu-zhi-dao-shu-chu

defineReplace(nativePath) {
    OUT_NATIVE_PATH = $$1
    # Replace slashes in paths with backslashes for Windows
    win32:OUT_NATIVE_PATH ~= s,/,\\,g
    return($$OUT_NATIVE_PATH)
}

# Copies the given files to the destination directory
defineReplace(copyToDestDirCommands) {
    variable_files = $$1
    files = $$eval($$variable_files)
    DDIR = $$nativePath($$2)
    win32:DDIR ~= s,/,\\,g
    POST_LINK = echo "Copying files to $$DDIR" $$escape_expand(\\n\\t)

    win32 {
        POST_LINK += $$QMAKE_MKDIR $$quote($$DDIR) 2>&1 & set errorlevel=0 $$escape_expand(\\n\\t)
    }
    !win32 {
        POST_LINK += $$QMAKE_MKDIR -p $$quote($$DDIR) $$escape_expand(\\n\\t)
    }

    for(ORIGINAL_FILE, files) {
        FILE = $$nativePath($$ORIGINAL_FILE)
        POST_LINK += $$QMAKE_COPY $$quote($$FILE) $$quote($$DDIR) $$escape_expand(\\n\\t)
    }

    return ($$POST_LINK)
}

#使用示例如下所示
#BATOS_FILES = \
#    $$BATOS_BIN_ROOT/batos-core.dll \
#    $$BATOS_BIN_ROOT/batos-pfw.dll \
#    $$BATOS_BIN_ROOT/dre.dll \
#    $$BATOS_BIN_ROOT/log4qt.dll
#
#QMAKE_POST_LINK += $$copyToDestDirCommands(BATOS_FILES, $$DESTDIR)
#
#BATOS_PLUGINS_FILES = \
#    $$BATOS_BIN_ROOT/plugins/com.xaf.plugin-manager.dll \
#    $$BATOS_BIN_ROOT/plugins/org.commontk.eventadmin.dll
#
#QMAKE_POST_LINK += $$copyToDestDirCommands(BATOS_PLUGINS_FILES, $$DESTDIR/plugins)
