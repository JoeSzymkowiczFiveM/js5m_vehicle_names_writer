lib.callback.register('js5m_vehicle_names:generateVehicleNames', function()
    local models = GetAllVehicleModels()
    return models
end)