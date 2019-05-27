
#https://doc.qt.io/qt-5/qmake-language.html#
#defineTest 自定义函数返回布尔结果
#defineReplace 自定义函数返回结果

# search an executable in PATH
defineReplace(findexeWin32) {
    return ( $$system(for %i in ($${1}.exe) do @echo. %~$PATH:i) )
}

defineReplace(findexeUnix) {
    return ( $$system(which $$1) )
}

# check for gcc
win32 {
    GCC=$$findexeWin32("gcc")
}

unix {
    GCC=$$findexeUnix("gcc")
}

isEmpty(GCC){
    include(./msvc.pri)
}else{
    include(./mingw.pri)
}
