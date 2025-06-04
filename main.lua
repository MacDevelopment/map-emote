local wasPaused = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local isPaused = IsPauseMenuActive()

        if isPaused and not wasPaused then
            wasPaused = true
            ExecuteCommand("e map2") -- uses qbx_core's default emote system
        elseif not isPaused and wasPaused then
            wasPaused = false
            local ped = PlayerPedId()
            if DoesEntityExist(ped) then
                ClearPedTasks(ped)
            end
        end
    end
end)
