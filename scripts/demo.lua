
function playDigits( digits )
    for i = 1, #digits do
        local n = digits:sub(i,i)
        session:execute("playback", "number_" .. n .. ".wav")
    end
end

function run()

    session:execute("playback", "record_intro.wav")

    freeswitch.consoleLog("info", "DEMO LUA :: Making Recording.\n")

    session:execute("set", "playback_terminators=#")

    session:execute("record", "/transient/message.wav 30")

    session:execute("playback", "replay_intro.wav")

    freeswitch.consoleLog("info", "DEMO LUA :: Playing Recording.\n")

    session:execute("playback", "/transient/message.wav")

    freeswitch.consoleLog("info", "DEMO LUA :: Collecting DTMF.\n")

    local dtmf = session:playAndGetDigits(1, 30, 1, 10000, "#", "dtmf_intro.wav", "","\\d+|\\*")

    freeswitch.consoleLog("info", "DEMO LUA :: Got DTMF[" .. dtmf .. "].\n")

    session:execute("playback", "dtmf_playback.wav")

    playDigits( dtmf )

    session:execute("playback", "tones_intro.wav")

    session:execute("gentones", dtmf);

    local response = session:playAndGetDigits(1, 1, 1, 3000, "#", "repeat_demo.wav", "","\\d+|\\*")

    if("*" == response) then
        freeswitch.consoleLog("info", "DEMO LUA :: Repeating Test.\n")
        run()
    end
end

session:answer()

local dest = session:getVariable("destination_number")

freeswitch.consoleLog("info", "DEMO LUA :: Handling call to destination [" .. dest .. "]\n")

session:execute("playback", "intro.wav")

playDigits(dest)

run()

session:execute("playback", "goodbye.wav")

freeswitch.consoleLog("info", "DEMO LUA :: Terminating Call.\n")

session:hangup()
