# 依赖复制脚本
defineReplace(copyToDestCommands){
    input_files = $$1
    output_dir = $$2
    win32{
        for(var,input_files){
            QMAKE_POST_LINK += $$quote(cmd /c copy /y $$shell_path($$var) $$shell_path($$output_dir) $$escape_expand(\\n\\t))
        }
    }
    !win32{
        for(var,input_files){
            QMAKE_POST_LINK += $$quote(cp -f $$shell_path($$var) $$shell_path($$output_dir) $$escape_expand(\\n\\t))
        }
    }
}

#使用示例如下所示
#BATOS_PLUGINS_FILES = \
#    $$BATOS_BIN_ROOT/plugins/com.xaf.plugin-manager.dll \
#    $$BATOS_BIN_ROOT/plugins/org.commontk.eventadmin.dll
#
#QMAKE_POST_LINK += $$copyToDestDirCommands(BATOS_PLUGINS_FILES, $$DESTDIR/plugins)
