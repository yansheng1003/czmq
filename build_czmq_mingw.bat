@echo off
setlocal

:: 设置路径变量（根据实际情况修改）
REM set LIBZMQ_DIR=D:\Sync\ATS\libzmq
set BUILD_DIR=build

:: 清理旧的构建目录
if exist %BUILD_DIR% (
    rmdir /s /q %BUILD_DIR%
)

mkdir %BUILD_DIR%
cd %BUILD_DIR%

:: 执行 CMake 配置
cmake .. -G "MinGW Makefiles" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCZMQ_BUILD_SHARED=ON ^
    -DCZMQ_BUILD_STATIC=ON ^
    -DCMAKE_C_FLAGS="-DCZMQ_EXPORTS"

:: 执行编译
mingw32-make

cd ..
echo.
echo Build complete.
pause
