--local SCore = exports["score"]:getCore()
--local clipboard = exports["clipboard"]

getStoredPeds = function(freemode)
    local pedKey = (freemode) and "mp_ped_" or "ped_"
    local handle = StartFindKvp(pedKey)
    local savedPeds = {}
    while true do
        Citizen.Wait(0)
        local pedId = FindKvp(handle)
        if(not pedId or pedId == "") then
            break
        end
        savedPeds[pedId] = json.decode(GetResourceKvpString(pedId))
    end
    return savedPeds
end

exports("getStoredPeds", getStoredPeds)