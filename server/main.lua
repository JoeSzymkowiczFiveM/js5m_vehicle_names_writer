lib.addCommand('vehiclenames', {
    help = 'Generate vehicle names file',
    restricted = 'group.admin'
}, function(source, args)
    local vehicleData = lib.callback.await('js5m_vehicle_names:generateVehicleNames', source)

    PerformHttpRequest("https://raw.githubusercontent.com/JoeSzymkowiczFiveM/fivem_vehicle_names/main/vehicles.json", function (errorCode, resultData, resultHeaders)
        local new_vehs = json.decode(resultData)
        local text = 'CreateThread(function()' .. '\n'
        for i = 1, #vehicleData do
            local v = vehicleData[i]
            if new_vehs[v] then
                text = text .. '\t' .. "AddTextEntry('" .. v .. "', '" .. new_vehs[v] .. "')" .. '\n'
            end
        end
        local text = text .. 'end)'
        SaveResourceFile(GetCurrentResourceName(), 'vehicle_names.txt', text, -1)
    end)
end)