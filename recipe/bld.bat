setlocal EnableDelayedExpansion

cmake -B build ^
  -G "NMake Makefiles" ^
  -DSUITESPARSE_ENABLE_PROJECTS="suitesparse_config;amd;btf;camd;ccolamd;colamd;cholmod;cxsparse;ldl;klu;umfpack;paru;rbio;spqr;spex" ^
  -DBUILD_SHARED_LIBS=ON ^
  -DBUILD_STATIC_LIBS=OFF ^
  -DCMAKE_BUILD_TYPE:STRING=Release ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
  %CMAKE_ARGS%
if errorlevel 1 exit 1

cmake --build build --verbose
if errorlevel 1 exit 1

cmake --install build --verbose
if errorlevel 1 exit 1
