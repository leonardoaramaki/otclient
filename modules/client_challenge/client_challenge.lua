local OPCODE_PRINT_GUILD_MEMBERS = 2

function init()
    print('Challenge script init')
    
    -- Ctrl+Shift+G hotkey will print, server-side,  all the guild names with less than 4 members 
    g_keyboard.bindKeyDown('Ctrl+Shift+G', function() 
        print('G pressed') 
        local protocolGame = g_game.getProtocolGame()
        -- Message passed for debugging
        protocolGame:sendExtendedOpcode(OPCODE_PRINT_GUILD_MEMBERS, 'printSmallGuildMembers')
    end)
end

function terminate()
    g_keyboard.unbindKeyDown('Ctrl+Shift+G')
end
