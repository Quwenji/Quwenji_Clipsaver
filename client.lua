RegisterCommand('rse', function(source, args, rawCommand)
    local action = args[1]

    if action == 'start' then
        -- Beginnt die Aufnahme
        StartRecording(1)
        TriggerEvent('chat:addMessage', {
            color = { 0, 255, 0},
            multiline = true,
            args = {"Rockstar Editor", "Aufnahme gestartet."}
        })
    elseif action == 'stop' then
        -- Beendet die Aufnahme und speichert den Clip
        StopRecordingAndSaveClip()
        TriggerEvent('chat:addMessage', {
            color = { 0, 255, 0},
            multiline = true,
            args = {"Rockstar Editor", "Aufnahme gestoppt und gespeichert."}
        })
    elseif action == 'discard' then
        -- Beendet die Aufnahme und verwirft den Clip
        StopRecordingAndDiscardClip()
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"Rockstar Editor", "Aufnahme gestoppt und verworfen."}
        })
    elseif action == 'editor' then
        -- Öffnet den Rockstar Editor
        NetworkSessionLeaveSinglePlayer()
        ActivateRockstarEditor()
        TriggerEvent('chat:addMessage', {
            color = { 0, 255, 255},
            multiline = true,
            args = {"Rockstar Editor", "Editor geöffnet."}
        })
    else
        -- Zeigt die richtige Verwendung des Befehls an
        TriggerEvent('chat:addMessage', {
            color = { 255, 255, 0},
            multiline = true,
            args = {"Rockstar Editor", "Verwendung: /rse [start|stop|discard|editor]"}
        })
    end
end, false)