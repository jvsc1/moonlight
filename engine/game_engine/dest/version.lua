_G.MOONLIGHT_VERSION_MAJOR = 0
_G.MOONLIGHT_VERSION_MINOR = 2
_G.MOONLIGHT_VERSION_PATCH = 0

_G.MOONLIGHT_VERSION = MOONLIGHT_VERSION_MAJOR .. '.' .. MOONLIGHT_VERSION_MINOR .. '.' .. MOONLIGHT_VERSION_PATCH 

_G.REQUIRE_VERSION = function(pMajor, pMin, pPatch)
	pPatch = pPatch or 0
	if type(pMajor) == 'string' then
		local v = pMajor:split('.', true)
		pMajor = tonumber(v[1])
		pMin = tonumber(v[2])
		if (#v >= 3) then
			pPatch = tonumber(v[3])
		end
	end
	if (pMajor > MOONLIGHT_VERSION_MAJOR or
			(pMajor == MOONLIGHT_VERSION_MAJOR and pMin > MOONLIGHT_VERSION_MINOR) or
			(pMajor == MOONLIGHT_VERSION_MAJOR and pMin == MOONLIGHT_VERSION_MINOR and pPatch > MOONLIGHT_VERSION_PATCH)) then
		error("Moonlight GE version " .. MOONLIGHT_VERSION ..
			' is lower than required version ' .. pMajor ..'.' .. pMin .. '.' .. pPatch
		)
	end
end
