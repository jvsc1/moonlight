local _directory = "game_engine/resource_manager"
local _directory_type = "lua54"

local resource = {
	base_directory = "",
	assets = {},
	structure = {},
	file_cache = {},

	_extensions = {
		["script"] = {nil or 'Lua', {}},
		["soundstream"] = {nil, {}},
		["soundeffect"] = {nil, {}},
		["font"] = {nil, {}},
		["stream_files"] = {nil, {}}
	},

	_types = {
		["lua"] = "script",
		["js"] = "script/web",
		["html"] = "web",
		["css"] = "web",
		["ogg"] = "soundeffect",
		["ttf"] = "font"
	},

	GET_FILE_TYPE = function(self, pPath)
		return self.types[pPath:match("%.(.-)$")]
	end,

	FETCH_FILE = function(self, pPath, pType)
		local preloaded = self.file_cache[pPath]

		if (preloaded) then
			return preloaded
		else
			local file_class = self.types[pType] or self:GET_FILE_TYPE(pPath)

			if (file_class) then
				local loader = self.extensions[file_class]

				if (loader) then
					local asset = loader[1](file_path, unpack(loader[2]))

					if (asset) then
						self.file_cache[pPath] = asset
						return asset
					end
				end
			end
		end
	end,

	LOAD_ASSETS = function(self, pAssets)
		local asset = self.assets[pAssets]

		if (asset) then
			return asset
		end
	end,

	FETCH_DIRECTORY = function(self, pPath, ...)
		return {pPath = pPath, ...}
	end,

	CLEAR_DIRECTORY = function(self, pPath)
		return {pPath = nil}
	end
}