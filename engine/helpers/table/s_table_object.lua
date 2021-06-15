Table = Table or {}

local _directory = "game_engine/helpers/table"
local _directory_type = "lua54"

local function Table:Proxy(pTable, newindex, pBase)
    return setmetatable(pBase or {}, {
      __index = pTable,
      __newindex = function (_, k, v) return newindex(pTable, k, v) end,
      __len = function () return #pTable end,
      __pairs = function () return next, pTable, nil end,
    })
end

function Table:IndexOf(pTable, pValue)
    for i, v in ipairs(pTable) do
        if v == pValue then
            return i
        end
    end
    return 0
end

local function Table:ImmutableProxy(pTable)
    return proxy(copy(pTable), function (pTable, k, v)
      error("CANT_IMMUTE_PROXY")
    end)
end

function Table:Find(pTable, pValue)
    for i,v in ipairs(pTable) do
      if (v == pValue) then
        return i
      end
    end
end

function Table:GetLength(pTable)
    local counter = 0

    for k, v in pairs(pTable) do
        counter = counter + 1
    end

    return counter
end

function Table:GetSimilarityLevel(pTable, pTarget)
    if table.size(pTable) == table.size(pTarget) then
        for k, v in pairs(pTable) do
          if v ~= pTarget[k] then
              return false
          end
        end

        return true
    else
        return false
    end
end

function Table:Clone(pTable)
    local result = {}

    table.copy(pTable, result)
    return result
end

function Table:Copy(pSource, pDestiny)
    for k, v in pairs(pSource) do
        pDestiny[k] = v
    end
end

function Table:CheckIfContainsValue(pTable, pValue)
    for k, v in pairs(pTable) do
        if pValue == v then
          return true
        end
    end

    return false
end

function Table:CheckIfTableIsEmpty(pTable)
    return table.size(pTable) == 0
end

function Table:Append(pTable, pTarget)
    for _, v in pairs(pTarget) do
      table.insert(pTable, v)
    end

    return pTable
end

function Table:Distinct(pTable)
    local tmp = {}
    local v_tmp = {}

    for _, v in pairs(pTable) do
        if not v_tmp[v] then
            table.insert(tmp, v)
            v_tmp[v] = true
        end
    end

    return tmp
end

function Table:Keys(pTable)
    local tmp = {}

    for k, v in pairs(pTable) do
      table.insert(tmp, k)
    end

    return tmp
end

function Table:Flat(pTable, pLevel)
    local tmp = {}
    pLevel = pLevel or 1

    for k, v in pairs(pTable) do
      if type(v) == 'table' and pLevel > 0 then
        append(tmp, flat(v, pLevel-1))
      else tmp[k] = v end
    end

    return tmp
end

function Table:Sorted(pTable, pFine)
    local tmp = copy(pTable)

    table.sort(tmp, pFine)

    return tmp
end

function Table:Slice(pTable, _i, _e)
    local tmp = {}
    _i = math.max(_i, 1)
    _e = math.min(_e or #pTable, #pTable)

    for i=_i, _e do
      table.insert(tmp, pTable[i])
    end

    return tmp
end

function Table:Same(pTable, pToCheck)
    if #pTable ~= #pToCheck then return false end

    for _, key in pairs(distinct(append(keys(pTable), keys(pToCheck)))) do
      if type(pTable[key]) ~= type(pToCheck[key]) then
        return false
      end

      if type(pTable[key]) == 'table' then
        if not same(pTable[key], pToCheck[key]) then
          return false
        end

      elseif pTable[key] ~= pToCheck[key] then
        return false
      end
    end

    return true
end

function Table:Union(pTable, pArguement)
    local tmp = {}

    for _, v in pairs(pTable) do
      table.insert(tmp, v)
    end

    for _, v in pairs(pArguement) do
      table.insert(tmp, v)
    end

    return tmp
end

function Table:Values(pTable)
    local tmp = {}

    for k, v in pairs(pTable) do
      table.insert(tmp, v)
    end

    return tmp
  end

  function Table:ForEach(pTable, fn)
    for k, v in pairs(pTable) do
      fn(k, v)
    end
end

function Table:Join(pTable, pValue)
    local tmp = {}

    for k, v in pairs(pTable) do
      tmp[k] = v
    end

    for k, v in pairs(pValue) do
      tmp[k] = v
    end

    return tmp
end

function Table:Random(pInput, pCount)
    local temp = {}

    for k,v in pairs(pInput) do
        table.insert(temp, v)
    end

    local selected={}

    math.randomseed(os.time())

    if #pInput<=pCount then return temp end

    while #selected < pCount do
        local bingo = math.random(#temp)
        table.insert(selected,table.remove(temp, bingo))
    end

    return selected
end

function Table:Merge(pTable, pTarget)
    for k, v in pairs(pTarget) do
      pTable[k] = v
    end

    return pTable
end

function Table:Set(pTable)
    local rev = {} 
    local tmp = distinct(pTable) or {}

    for _, v in pairs(tmp) do rev[v] = true end

    return proxy(tmp, function (_, k, v)
      if v == nil then 
        rev[v], tmp[k] = nil, nil
      elseif rev[v] == nil then 
        rev[v], tmp[k] = true, v
      end
    end, {
      has = function (_, v)
        return rev[v] == true
      end
    })
end

function Table:Patch(pTable, pTarget, rename, only, exclude)
    only = only or keys(pTable)
    exclude = set(exclude or {})
    rename = rename or {}

    for _, key in pairs(only) do
      if not exclude:has(key) then
        local name = rename[key] or key

        if pTable[name] then error('key collision on patch') end

        pTable[name] = pTable[key]
      end
    end
end

function Table:LongerThan(pTable, pLength)
    local len = 0
    for i, v in pairs(pTable) do
      if len > number then
        return pLength
      end
    end
    return false
end

function Table:GetFirstIndex(pTable)
    local k, v = next(pTable)
    return k
end

function Table:Reverse(pTable)
	local len, half_len = #pTable, math.ceil(#pTable/2)
	for i, val in ipairs(pTable) do
		if i > half_len then break end
		pTable[i], pTable[len+1-i] = pTable[len+1-i], pTable[i]
	end
	return pTable
end
