local _directory = "game_engine/physics/positioner"
local _directory_type = "lua54"

Positioner = Positioner or {}
Positioner.Point = 1.70158

Positioner.IN_BACK = function(pRatio)
	return pRatio*pRatio*((Positioner.Point+1)*pRatio-Positioner.Point)
end

Positioner.OUT_BACK = function(pRatio)
	pRatio = pRatio - 1
	return pRatio*pRatio*((Positioner.Point+1)*pRatio+Positioner.Point)+1
end

Positioner.IN_OUT_BACK = function(pRatio)
	pRatio = pRatio * 2
	if pRatio < 1 then
		return 0.5*(pRatio*pRatio*((Positioner.Point*1.525+1)*pRatio-Positioner.Point*1.525))
	else 
		pRatio = pRatio - 2
		return 0.5*(pRatio*pRatio*((Positioner.Point*1.525+1)*pRatio+Positioner.Point*1.525)+2)
	end
end

Positioner.IN_BOUNCE = function(pRatio)
	return 1-Positioner.outBounce(1-pRatio,0,0,0)
end

Positioner.OUT_BOUNCE = function(pRatio)
	if pRatio < 1/2.75 then
		return 7.5625*pRatio*pRatio
	elseif pRatio < 2/2.75 then
		pRatio = pRatio - 1.5/2.75
		return 7.5625*pRatio*pRatio+0.75
	elseif pRatio < 2.5/2.75 then
		pRatio= pRatio - 2.25/2.75
		return 7.5625*pRatio*pRatio+0.9375
	else
		pRatio = pRatio - 2.625/2.75
		return 7.5625*pRatio*pRatio+0.984375
	end
end

Positioner.IN_OUT_BOUNCE = function(pRatio)
	pRatio = pRatio * 2
	if pRatio < 1 then 
		return 0.5*Positioner.inBounce(pRatio,0,0,0)
	else
		return 0.5*Positioner.outBounce(pRatio-1,0,0,0)+0.5
	end
end

Positioner.IN_CIRCULAR = function(pRatio)
	return -(math.sqrt(1-pRatio*pRatio)-1)
end

Positioner.OUT_CIRCULAR = function(pRatio)
	return math.sqrt(1-(pRatio-1)*(pRatio-1))
end

Positioner.IN_OUT_CIRCULAR = function(pRatio)
	pRatio = pRatio * 2
	if pRatio < 1 then
		return -0.5*(math.sqrt(1-pRatio*pRatio)-1)
	else
		pRatio = pRatio - 2
		return 0.5*(math.sqrt(1-pRatio*pRatio)+1)
	end
end

Positioner.IN_CU = function(pRatio)
	return pRatio*pRatio*pRatio
end
Positioner.OUT_CU = function(pRatio)
	pRatio = pRatio - 1
	return pRatio*pRatio*pRatio+1
end

Positioner.IN_OUT_CU = function(pRatio)
	if pRatio < 0.5 then
		return 4*pRatio*pRatio*pRatio
	else
		pRatio = pRatio - 1
		return 4*pRatio*pRatio*pRatio+1
	end
end

local elasticA = 1;
local elasticP = 0.3;
local elasticS = elasticP/4;

Positioner.IN_ELASTIC = function(pRatio)
	if pRatio == 0 or pRatio == 1 then
		return pRatio
	end
	pRatio = pRatio - 1
	return -(elasticA * math.pow(2, 10 * pRatio) * math.sin((pRatio - elasticS) * (2 * math.pi) / elasticP));
end

Positioner.OUT_ELASTIC = function(pRatio)
	if pRatio == 0 or pRatio == 1 then
		return pRatio
	end
	return elasticA * math.pow(2, -10 * pRatio) *  math.sin((pRatio - elasticS) * (2 * math.pi) / elasticP) + 1;
end

Positioner.IN_OUT_ELASTIC = function(pRatio)
	if pRatio == 0 or pRatio == 1 then
		return pRatio
	end
	pRatio = pRatio*2-1
	if pRatio < 0 then
		return -0.5 * (elasticA * math.pow(2, 10 * pRatio) * math.sin((pRatio - elasticS*1.5) * (2 * math.pi) /(elasticP*1.5)));
	end
	return 0.5 * elasticA * math.pow(2, -10 * pRatio) * math.sin((pRatio - elasticS*1.5) * (2 * math.pi) / (elasticP*1.5)) + 1;
end

Positioner.IN_EXPONENTIAL = function(pRatio)
	if pRatio == 0 then
		return 0
	end
	return math.pow(2, 10 * (pRatio - 1))
end

Positioner.OUT_EXPONENTIAL = function(pRatio)
	if pRatio == 1 then
		return 1
	end
	return 1-math.pow(2, -10 * pRatio)
end

Positioner.IN_OUT_EXPONENTIAL = function(pRatio)
	if pRatio == 0 or pRatio == 1 then 
		return pRatio
	end
	pRatio = pRatio*2-1
	if 0 > pRatio then
		return 0.5*math.pow(2, 10*pRatio)
	end
	return 1-0.5*math.pow(2, -10*pRatio)
end

Positioner.LINEAR = function(pRatio)
	return pRatio
end

Positioner.IN_QUADRATIC = function(pRatio)
	return pRatio*pRatio
end

Positioner.OUT_QUADRATIC = function(pRatio)
	return -pRatio*(pRatio-2)
end

Positioner.IN_OUT_QUADRATIC = function(pRatio)
	if pRatio < 0.5 then
		return 2*pRatio*pRatio
	end
	return -2*pRatio*(pRatio-2)-1
end

Positioner.IN_QUARTIC = function(pRatio)
	return pRatio*pRatio*pRatio*pRatio
end

Positioner.OUT_QUARTIC = function(pRatio)
	pRatio = pRatio - 1
	return 1-pRatio*pRatio*pRatio*pRatio
end

Positioner.IN_OUT_QUARTIC = function(pRatio)
	if pRatio < 0.5 then
		return 8*pRatio*pRatio*pRatio*pRatio
	end
	pRatio = pRatio - 1
	return -8*pRatio*pRatio*pRatio*pRatio+1
end

Positioner.IN_QUINTIC = function(pRatio)
	return pRatio*pRatio*pRatio*pRatio*pRatio
end

Positioner.OUT_QUINTIC = function(pRatio)
	pRatio = pRatio - 1
	return 1+pRatio*pRatio*pRatio*pRatio*pRatio
end

Positioner.IN_OUT_QUINTIC = function(pRatio)
	if pRatio < 0.5 then
		return 16*pRatio*pRatio*pRatio*pRatio*pRatio
	end
	pRatio = pRatio - 1
	return 16*pRatio*pRatio*pRatio*pRatio*pRatio+1
end

Positioner.IN_SINE = function(pRatio)
	return 1-math.cos(pRatio * (math.pi / 2))
end

Positioner.OUT_SINE = function(pRatio)
	return math.sin(pRatio * (math.pi / 2))
end

Positioner.IN_OUT_SINE = function(pRatio)
	return -0.5*(math.cos(pRatio*math.pi)-1)
end
