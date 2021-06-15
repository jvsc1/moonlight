Time = Time or {}

Time.Format = function(pTime)
    local fmt = string.format

    if pTime > 60*60*24*365*2 then
        return fmt("%d years ago", pTime/60/60/24/365)
    elseif pTime > 60*60*24*(365/12)*2 then
        return fmt("%d months ago", pTime/60/60/24/(365/12))
    elseif pTime > 60*60*24*7*2 then
        return fmt("%d weeks ago", pTime/60/60/24/7)
    elseif pTime > 60*60*24*2 then   
        return fmt("%d days ago", pTime/60/60/24)
    elseif pTime > 60*60*2 then
        return fmt("%d hours ago", pTime/60/60)
    elseif pTime > 60*2 then
        return fmt("%d min ago", pTime/60)
    elseif pTime > 2 then
        return fmt("%d sec ago", pTime)
    else
        return "MOMENT"
    end
end