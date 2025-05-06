Critty="Alacritty"
Browser=os.getenv("HAMMERSPOON-BROWSER") or "Google Chrome"
ITerm="iTerm"
CachedWindow=nil

hs.hotkey.bind({"cmd", "ctrl"}, "K", function()
    hs.application.open(ITerm)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "L", function()
    hs.application.open(Critty)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "H", function()
    hs.application.open(Browser)
end)

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "J", function()
    if (CachedWindow == nil) then CachedWindow = hs.window.frontmostWindow() else CachedWindow = nil end
end)

hs.hotkey.bind({"cmd", "ctrl"}, "J", function()
    if not (CachedWindow == nil) then CachedWindow:focus() else hs.alert.show("No Cached Window") end
end)

local laptopScreen = os.getenv("HAMMERSPOON-DISPLAY-NAME") or "C32R50x";
local windowLayout = {
    {Browser,  nil, laptopScreen, hs.layout.left50,    nil, nil},
    {Critty,   nil,          laptopScreen, hs.layout.right50,   nil, nil},
}

hs.hotkey.bind({"cmd", "ctrl"}, "I", function()
    hs.layout.apply(windowLayout)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
  hs.reload()
end)

hs.alert.show("Config loaded")
