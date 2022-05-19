--[[Useful for automatically stopping the recording when recording many takes
    while in time selection auto-punch mode. Starts recording at the play cursor
    position and stops recording at a user defined number of seconds after the
    end of the time selection.  Maybe it's not THAT useful.  I don't know.  I'm lazy.]]--

-- Get the locations of the beginning and end of the time selection
start_time, end_time = reaper.GetSet_LoopTimeRange2(0, false, false, 0, 0, false)

-- Set the number of seconds after end_time to wait before stopping
stop_offset = 1

function stop_after_time_sel()
  if reaper.GetPlayPosition() < (end_time + stop_offset) then
    reaper.defer(stop_after_time_sel)
  else
    reaper.Main_OnCommand(1016, 0, 0)
    return
  end
end

-- Start recording
reaper.Main_OnCommand(1013, 0, 0)

stop_after_time_sel()
