util.AddNetworkString("F4KeyPressed")
-- Обработчик нажатия клавиши F4 f4menu
hook.Add("PlayerButtonDown", "F4KeyHandler", function(ply, key)
    if key == KEY_F4 then
        net.Start("F4KeyPressed")
        net.Send(ply)
    end
end)
util.AddNetworkString("ToggleCursor")
hook.Add("PlayerButtonDown", "ToggleCursor", function(ply, key)
    -- Проверяем, является ли нажатая клавиша f4
    if key == KEY_F4 then
        -- Отправляем серверу сообщение о необходимости изменить состояние курсора
        net.Start("ToggleCursor")
        net.Send(ply)
    end
end)