Vehicle = {}

Vehicle.Create = function(pX, pY)
	local object = {
		x_pos = pX,
		y_pos = pY,
		angle = 0,
		x_vel = 0,
		y_vel = 0,
		radius = 14,
		turn_vel = 1.5,
		thrust = false,
		fuel_per_second = 50,
		speed_cap = true,
		max_vel = 500,
		turning_left = false,
		turning_right = false,
		fuel = 60,
		force_per_fuel = 1
	}
	
	setmetatable(object, { __index = Vehicle })
	return object
end

Vehicle.UpdateVC = function(pDT)
	if self.thrust and self.fuel > 0 then
		local x_vel = self.x_vel
		local y_vel = self.y_vel
		local thrust = pDT * self.fuel_per_second * self.force_per_fuel
		
		self.x_vel = x_vel + (thrust * math.sin(self.angle))
		self.y_vel = y_vel - (thrust * math.cos(self.angle))
		
		if self.speed_cap and self:past_max( ) then
			self.x_vel = x_vel
			self.y_vel = y_vel
		else
			self.fuel = self.fuel - pDT
		end
	end
end

Vehicle.UpdateAngle = function(pDT)
	if self.turning_right then
		self.angle = self.angle + (pDT * self.turn_vel)
	elseif player.turning_left then
		self.angle = self.angle - (pDT * self.turn_vel)
	end
end

Vehicle.UpdateLocation = function(pDT, pWidth, pHeight)
	self.x_pos = self.x_pos + (pDT * self.x_vel)
	self.y_pos = self.y_pos + (pDT * self.y_vel)
	
	if self.x_pos <= 0 then
		self.x_pos = self.x_pos + pWidth
	elseif self.x_pos >= pWidth then
		self.x_pos = self.x_pos - pWidth
	end
	
	if self.y_pos <= 0 then
		self.y_pos = self.y_pos + pHeight
	elseif self.y_pos >= pHeight then
		self.y_pos = self.y_pos - pHeight
	end
end

Vehicle.Post = function()
	local total_velocity = math.sqrt(self.x_vel^2 + self.y_vel^2)
	return total_velocity > self.max_vel
end

Vehicle.Refuel = function(pFuel)
	self.fuel = self.fuel + pFuel.fuel
end
