if SERVER then
    local files = file.Find( 'server/*.lua', 'LUA' )
    table.foreach (files, function ( key, gui )
        include ( 'server/' .. gui )
    end)
    local files = file.Find( 'client/*.lua', 'LUA' )
    table.foreach (files, function ( key, gui )
        AddCSLuaFile ('client/' .. gui )
    end)
    resource.AddSingleFile("materials/f4menu/cancel2.png")
    resource.AddSingleFile("materials/f4menu/bomj.png")
    resource.AddSingleFile("materials/f4menu/store.png")
    resource.AddSingleFile("materials/f4menu/donatewallet.png")
    resource.AddSingleFile("materials/f4menu/settings.png")
    resource.AddSingleFile("materials/f4menu/jobcase.png")
    resource.AddSingleFile("materials/f4menu/left-arrow.png")
end
if CLIENT then
    local files = file.Find( 'client/*.lua', 'LUA' )
    table.foreach (files, function ( key, gui )
        include ('client/' .. gui )
    end)
end

