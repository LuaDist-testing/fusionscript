package = "fusionscript"
version = "dev-1"

source = {
	url = "git://github.com/RyanSquared/fusionscript.git";
}

description = {
	summary = "A Lua compilable language based on C and Python";
	maintainer = "Ryan <ryan@github.com>";
	license = "MIT";
}

dependencies = {
	"lua >= 5.1";
	"lpeg >= 1.0";
	"luafilesystem";
	"serpent";
	"luaossl";
	"basexx";
}

local default = "source"

build = {
	type = "builtin";
	modules = {
		["fusion.stdlib.table"] = "fusion/stdlib/table.lua";
		["fusion.stdlib.ternary"] = "fusion/stdlib/ternary.lua";
		["fusion.stdlib.class"] = "fusion/stdlib/class.lua";
		["fusion.core.compilers.source"] = "fusion/core/compilers/source.lua";
		["fusion.core.parser"] = "fusion/core/parser.lua";
		["fusion.util"] = "fusion/util.lua";
	};
	install = {
		bin = {
			["fusion-ast"] = "bin/util/ast.lua";
			["fusion-lint"] = "bin/util/linter.lua";
			["fusion-pkg"] = "bin/util/pkg.lua";
			["fusion"] = ("bin/interpreter/%s.lua"):format(default);
			["fusionc"] = ("bin/compiler/%s.lua"):format(default);
			["fusion-source"] = "bin/interpreter//source.lua";
			["fusionc-source"] = "bin/compiler/source.lua";
		};
	};
}
