CMAKE_MINIMUM_REQUIRED(VERSION 2.6 FATAL_ERROR)
CMAKE_POLICY(VERSION 2.6)
#FIND_PACKAGE(Torch REQUIRED)
FIND_PACKAGE(PythonLibs REQUIRED)
set(lualibdir d:/tools/luajit-rocks/dist)
FIND_LIBRARY(LUA_LIBRARY NAMES luajit libluajit PATHS ${lualibdir})
FIND_PATH(LUA_INCLUDE_DIR lua.h PATHS ${lualibdir}/include)
MESSAGE(STATUS "Found Python headers in ${PYTHON_INCLUDE_DIRS}")
MESSAGE(STATUS "Found LUA headers in ${LUA_INCLUDE_DIR}")
MESSAGE(STATUS "Found LUA libs: ${LUA_LIBRARY}")
INCLUDE_DIRECTORIES(
    ${PROJECT_SOURCE_DIR} 
    ${PYTHON_INCLUDE_DIRS}
	${LUA_INCLUDE_DIR}	
)

SET(src pythoninlua.c luainpython.c)
SET(luasrc init.lua)

add_library(python SHARED ${src} ${luasrc} )
#ADD_TORCH_PACKAGE(python "${src}" "${luasrc}" "System/Interfaces")
TARGET_LINK_LIBRARIES(python ${PYTHON_LIBRARIES} ${LUA_LIBRARY})
