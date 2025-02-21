git clone https://github.com/looooo/SMESH.git
cd SMESH
git checkout patch-4
git submodule update --init --recursive
python prepare.py

mkdir build
cd build

cmake -G "Ninja" ^
    -D CMAKE_BUILD_TYPE=Release ^
    -D CMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
    -D CMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    -D CMAKE_SYSTEM_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
    -D PTHREAD_INCLUDE_DIRS:FILEPATH="%LIBRARY_PREFIX%/include" ^
    -D PTHREAD_LIB_DIRS:FILEPATH="%LIBRARY_PREFIX%/lib" ^
    -D Boost_NO_BOOST_CMAKE:BOOL=ON ^
    -D ENABLE_LIB_NAMING:BOOL=OFF ^
    ..

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
