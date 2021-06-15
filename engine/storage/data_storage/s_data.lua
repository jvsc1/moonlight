Data = Data or {}

local _directory = "storage/data_storage"
local _directory_type = "lua54"

function Data:Save(pKey, pValue)
	local app
	local path = "|D|app.txt"
	local file = io.open(path, "r")

	if file then
		local contents = file:read("*a")

		app = json.decode(contents)
		io.close(file)

		if(not app.data) then
			app.data = {}
		end

		app.data[pKey] = pValue
		contents = json.encode(app)

		local file = io.open(path, "w")

		file:write(contents)
		io.close(file)
	else
		app = {data = {}}
		app.data[pKey] = pValue

		local contents = json.encode(app)
		local file = io.open(path, "w")

		file:write(contents)
		io.close(file)
	end
end

function Data:Load(pKey)
	local app
	local path = "|D|app.txt"
	local file = io.open(path, "r")

	if file then
		local contents = file:read("*a")

		app = json.decode(contents)
		if(not app.data) then app.data = {}; end
		return app.data[pKey]
	end

	return nil
end

function Data:SaveAs(pFile, pData)
	local path = pFile..".json"
	local jsonstring = json.encode(pData)
	local file = io.open(path, "w")

	if file then
	   file:write(jsonstring)
	   io.close(file)
	end
end

function Data:LoadFile(pFile)
	local path = pFile..".json"
	local contents
	local file = io.open(path, "r")

	if file then
		contents = file:read("*a")
		io.close(file)
		return json.decode(contents)
	else
		return nil
	end
end

