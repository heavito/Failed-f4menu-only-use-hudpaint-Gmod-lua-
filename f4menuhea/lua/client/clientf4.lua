local shouldDrawRectangle = false -- открыт ли на данный момент прямоугольник
local rectangleX = ScrW() / 2 -- координата X нарисованного прямоугольника (фона синего)
local rectangleY = ScrH() / 2 -- координата Y прям-ка (фона синего)
local targetRectangleX = ScrW() / 2  -- Текущая позиция X нарисованного прям-ка (нужн)
local targetRectangleY = ScrH() / 2 
local isAnimating = false
local animationSpeed = 8
local xn = ScrW() / 2
local yn = ScrH() / 2
local targetyn = ScrH() / 2
local targetxn = ScrW() / 2
local cursorVisible = false
f4menuopenlol = false
glhpmenualpha = 255
glhpmenualpha1 = 155
local startTime = CurTime()
local image1 = Material("f4menu/store.png")
local image2 = Material("f4menu/bomj.png")
local image3 = Material("f4menu/cancel2.png")
local image4 = Material("f4menu/donatewallet.png")
local image5 = Material("f4menu/settings.png")
local image6 = Material("f4menu/jobcase.png")
local image7 = Material("f4menu/left-arrow.png")
function cancelbuttonlol()
    surface.SetMaterial(image3)
    glhpmenualpha = 0
    glhpmenualpha1 = 0
    local isHovered = false
    local x, y = rectangleX+28, rectangleY + 423 -- 432 y, 732 x
    local w, h = 128, 128
    local mouseX, mouseY = gui.MousePos()
    if mouseX >= x and mouseX <= x + w and mouseY >= y and mouseY <= y + h then
        isHovered = true
    end
    if isHovered and input.IsMouseDown(MOUSE_LEFT) then -- события после нажатия на кнопку
        glhpmenualpha = 255
        glhpmenualpha1 = 155
        isHovered = false
        cursorVisible = false
        gui.EnableScreenClicker(false)
        f4menucloselol()
        return
    end
    surface.SetDrawColor(255, 255, 255, isHovered and 200 or 255)
    surface.DrawTexturedRect(x, y, w, h)
end
function shopmoneybuttonlol()
        glhpmenualpha = 0
        glhpmenualpha1 = 0
        local isHovered1 = false
        local x1, y1 = rectangleX-75, rectangleY+455
        local w1, h1 = 64, 64
        local mouseX1, mouseY1 = gui.MousePos()
        if mouseX1 >= x1 and mouseX1 <= x1 + w1 and mouseY1 >= y1 and mouseY1 <= y1 + h1 then
            isHovered1 = true
            surface.SetDrawColor(0, 0, 0, 255) -- зеленый цвет
            surface.DrawLine(x1, y1 + h1, x1 + w1, y1 + h1) -- рисуем линию внизу картинки
        end
        if isHovered1 and input.IsMouseDown(MOUSE_LEFT) then
            hook.Remove("HUDPaint", "DrawRectangle")
            hook.Add("HUDPaint", "DrawRectangleS", function()
                draw.RoundedBox( 20, rectangleX-500, rectangleY+150, 1200, 700, Color( 25, 25, 25) )
                surface.SetMaterial(image7)
                surface.SetDrawColor(255, 255, 255, 255)
                surface.DrawTexturedRect(rectangleX-75, rectangleY+455, 64, 64)
                local isHovered2 = false
                local x2, y2 = rectangleX-75, rectangleY + 455 -- 432 y, 732 x
                local w2, h2 = 64, 64
                local mouseX2, mouseY2 = gui.MousePos()
                if mouseX2 >= x and mouseX2 <= x2 + w2 and mouseY2 >= y and mouseY2 <= y2 + h2 then
                    isHovered2 = true
                end
                if isHovered2 and input.IsMouseDown(MOUSE_LEFT) then -- события после нажатия на кнопку
                    hook.Remove("HUDPaint", "DrawRectangleS")
                end
                surface.SetMaterial(image1)
                surface.SetDrawColor(255, 255, 255, isHovered2 and 200 or 255)
                surface.DrawTexturedRect(x2, y2, w2, h2)
            end)
        end
end
function f4menunotcloselol()
end
function f4menucloselol()
    targetRectangleX = ScrW() / 2
    targetRectangleY = ScrH()
    isAnimating = true
    hook.Add("HUDPaint", "DrawRectangle", function()
        if isAnimating then
            rectangleX = Lerp(FrameTime() * animationSpeed, rectangleX, targetRectangleX)
            rectangleY = Lerp(FrameTime() * animationSpeed, rectangleY, targetRectangleY)
            xn = Lerp(FrameTime() * animationSpeed, xn, targetxn)
            yn = Lerp(FrameTime() * animationSpeed, yn, targetyn)
            if math.abs(rectangleX - targetRectangleX) < 7 and math.abs(rectangleY - targetRectangleY) < 7 then
                isAnimating = false
                hook.Remove("HUDPaint", "DrawRectangle")
            end
        end
            draw.RoundedBox( 360, rectangleX-128, rectangleY+260, 450, 450, Color( 25, 25, 25 ) )
            surface.SetMaterial(image3)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(rectangleX +28, rectangleY + 423, 128, 128)
            surface.SetMaterial(image1)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(rectangleX-75, rectangleY+455, 64, 64)
            glhpmenualpha = 255
            glhpmenualpha1 = 155
            if glhpmenualpha == 0 then
                hook.Remove("HUDPaint","DrawRectangle")
            end
    end)
end
net.Receive("F4KeyPressed", function()
    if shouldDrawRectangle then
        f4menucloselol()
    end
    shouldDrawRectangle = not shouldDrawRectangle
    if shouldDrawRectangle then
        targetRectangleX = ScrW() / 2 - 100
        targetRectangleY = ScrH() / 2 - 500
        isAnimating = true
        hook.Add("HUDPaint", "DrawRectangle", function()
            if isAnimating then
                rectangleX = Lerp(FrameTime() * animationSpeed, rectangleX, targetRectangleX)
                rectangleY = Lerp(FrameTime() * animationSpeed, rectangleY, targetRectangleY)
                xn = Lerp(FrameTime() * animationSpeed, xn, targetxn)
                yn = Lerp(FrameTime() * animationSpeed, yn, targetyn)
                if math.abs(rectangleX - targetRectangleX) < 4 and math.abs(rectangleY - targetRectangleY) < 4 then
                    isAnimating = false
                end
            end
                draw.RoundedBox( 360, rectangleX-128, rectangleY+260, 450, 450, Color( 25, 25, 25 ) )
                cancelbuttonlol()
                shopmoneybuttonlol()
                end)
            end 
        end)
local cursorVisible = false
net.Receive("ToggleCursor", function()
    cursorVisible = not cursorVisible
    if cursorVisible then 
        gui.EnableScreenClicker(true)
    else 
        gui.EnableScreenClicker(false)
    end
end)
--конец кода курсора