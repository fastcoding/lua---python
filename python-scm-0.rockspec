package = "python"
version = "scm-0"

source = {
   url = "git://github.com/fastcoding/lua---python",
}

description = {
   summary = "A wrapper to Python",
   detailed = [[
Load a Python env into Lua.
   ]],
   homepage = "https://github.com/fastcoding/lua---python",
   license = "GPL"
}

dependencies = {
   "torch >= 7.0",
}

build = {
   type = "cmake",
   variables={
	CMAKE_PREFIX_PATH="$(LUA_BINDIR)/..", 
	LUA_INCLUDE_DIR="$(LUA_INCDIR)",
	LUA_LIBRARY="$(LUA_LIBDIR)" ,
    CMAKE_INSTALL_PREFIX="$(PREFIX)"

	}
--[[
   build_command = [[
cmake -E make_directory build;
cd build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)"; 
$(MAKE)
   ]],
   --install_command = "cd build && $(MAKE) install"
--]]
}
