--[[ A simple script to delete the MediaItem before the currently selected
    MediaItem.  If the selected MediaItem is the first in the track, that
    one is deleted insted.]]--

numSelItems = reaper.CountSelectedMediaItems(0)
if (numSelItems == 1) then
  item = reaper.GetSelectedMediaItem(0, 0)
  index = reaper.GetMediaItemInfo_Value(item, 'IP_ITEMNUMBER')
  if (index == 0.0) then
    reaper.DeleteTrackMediaItem(reaper.GetMediaItemTrack(item), item)
  else
    prevItem = reaper.GetMediaItem(0, index - 1.0)
    reaper.DeleteTrackMediaItem(reaper.GetMediaItemTrack(prevItem), prevItem)
  end
  reaper.UpdateArrange()
end
