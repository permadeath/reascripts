--[[ A simple script to toggle selected tracks between
"record armed and muted" and "unarmed and unmuted" ]]--

tracks = reaper.CountTracks(0)
track_count = 0
selected_count = 0

while(track_count <= (tracks-1))
do
  is_selected = reaper.GetTrack(0, track_count)
  if (reaper.IsTrackSelected(is_selected))
  then
    recarmed = reaper.GetMediaTrackInfo_Value(is_selected, 'I_RECARM', 1)
    muted = reaper.GetMediaTrackInfo_Value(is_selected, 'B_MUTE', 1)
    if ( recarmed == 1 and  muted == 1)
    then
      reaper.SetMediaTrackInfo_Value(is_selected, 'I_RECARM', 0)
      reaper.SetMediaTrackInfo_Value(is_selected, 'B_MUTE', 0)
    elseif ( recarmed == 0 and  muted == 0)
    then
      reaper.SetMediaTrackInfo_Value(is_selected, 'B_MUTE', 1)
      reaper.SetMediaTrackInfo_Value(is_selected, 'I_RECARM', 1)
    end
  end
  track_count = track_count + 1
end
