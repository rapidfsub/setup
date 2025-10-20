hs.hotkey.bind({"ctrl", "shift"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)
