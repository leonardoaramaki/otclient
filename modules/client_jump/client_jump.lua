local jumpWindow
local button
local buttonSize
local pos
local windowPos
local moveEvent
local speed = 1

-- Randomize button position.
local function randomizePosition(button)
    if windowPos and pos and jumpWindow and button then
        pos.x = windowPos.x + jumpWindow:getSize().width - button:getSize().width
        pos.y = math.random(
                windowPos.y + button:getSize().height,
                windowPos.y + windowSize.height - button:getSize().height
        )
    end
end

local function onButtonClick(self)
    randomizePosition(self)
end

function init()
    jumpWindow = g_ui.displayUI('client_jump.otui')
    windowSize = jumpWindow:getSize()
    windowPos = jumpWindow:getPosition()
    jumpWindow:show()
    -- Shallow copy the window position to pos, so we can keep track of the button position
    pos = {}
    for key, value in pairs(windowPos) do
        pos[key] = value
    end
    randomizePosition()
    button = g_ui.createWidget('ModalButton', jumpWindow)
    button:setText('Jump!')
    button.onClick = onButtonClick
    button:show()
    -- Move the button left every 10 ms
    moveEvent = cycleEvent(function()
        windowPos = jumpWindow:getPosition()
        button:setPosition(pos)
        pos.x = pos.x - speed
        if pos.x <= windowPos.x then
            randomizePosition(button)
        end
    end, 10)
end

function terminate()
    if moveEvent then
        moveEvent:cancel()
        moveEvent = nil
    end
    jumpWindow:destroy()
    jumpWindow = nil
    button = nil
end
