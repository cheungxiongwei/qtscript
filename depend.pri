# 依赖复制脚本
!build_pass:message("depend.pri")
defineReplace(copyToDestCommands){
    input_files = $$1
    output_dir = $$2
    POST_LINK = echo "Copying files to $$shell_path($$output_dir)" $$escape_expand(\\n\\t)
   for(var,input_files){
        POST_LINK += $$QMAKE_COPY $$quote($$shell_path($$var) $$shell_path($$output_dir) $$escape_expand(\\n\\t))
    }
    return ($$POST_LINK)
}

#使用示例如下所示
#    DEPEND_FILES = \
#    $$PWD/../3rdparty/opencv-4.1.0/32bit/bin/mf.dll \
#    $$PWD/../3rdparty/opencv-4.1.0/32bit/bin/mfplat.dll \
#    $$PWD/../3rdparty/opencv-4.1.0/32bit/bin/mfreadwrite.dll
#    QMAKE_POST_LINK += $$copyToDestCommands($$DEPEND_FILES, $$OUT_PWD/debug)
