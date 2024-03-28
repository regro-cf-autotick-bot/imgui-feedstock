rmdir /s /q build
mkdir build
cd build

cmake %CMAKE_ARGS% ^
    -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_TESTING:BOOL=ON ^
    -DBUILD_SHARED_LIBS:BOOL=ON ^
    -DIMGUI_BUILD_GLFW_BINDING=ON ^
    -DIMGUI_BUILD_GLUT_BINDING=OFF ^
    -DIMGUI_BUILD_METAL_BINDING=OFF ^
    -DIMGUI_BUILD_OPENGL2_BINDING=ON ^
    -DIMGUI_BUILD_OSX_BINDING=OFF ^
    -DIMGUI_BUILD_SDL2_BINDING=ON ^
    -DIMGUI_BUILD_SDL2_RENDERER_BINDING=OFF ^
    -DIMGUI_BUILD_VULKAN_BINDING=OFF ^
    -DIMGUI_FREETYPE=OFF ^
    -DIMGUI_FREETYPE_LUNASVG=OFF ^
    -DIMGUI_BUILD_ALLEGRO5_BINDING=OFF ^
    -DIMGUI_BUILD_WIN32_BINDING=ON ^
    -DIMGUI_BUILD_DX9_BINDING=ON ^
    -DIMGUI_BUILD_DX10_BINDING=ON ^
    -DIMGUI_BUILD_DX11_BINDING=ON ^
    -DIMGUI_BUILD_DX12_BINDING=ON ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1
