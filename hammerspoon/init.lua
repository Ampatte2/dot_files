Critty="Alacritty"
Browser=os.getenv("HAMMERSPOON-BROWSER") or "Google Chrome"
ITerm="iTerm"
VSCode="Visual Studio Code"

function createLayoutBinding (keyCode, reference)
    hs.hotkey.bind({"cmd", "ctrl", "shift"}, keyCode, function()
        hs.alert(reference == nil)
        if (reference == nil) then reference = hs.window.frontmostWindow() else reference = nil end
    end)

    hs.hotkey.bind({"cmd", "ctrl"}, keyCode, function()
        if not (reference == nil) then reference:focus() else hs.alert.show("No Cached Window") end
    end)
end    

CachedWindowK=nil
createLayoutBinding("K", CachedWindowK)

CachedWindowL=nil
createLayoutBinding("L", CachedWindowL)

CachedWindowH=nil
createLayoutBinding("H", CachedWindowH)

CachedWindowJ=nil
createLayoutBinding("J", CachedWindowJ)

CachedWindowO=nil
createLayoutBinding("O", CachedWindowO)

CachedWindowE=nil
createLayoutBinding("E", CachedWindowE)

CachedWindowG=nil
createLayoutBinding("G", CachedWindowG)

local laptopScreen = os.getenv("HAMMERSPOON-DISPLAY-NAME") or "C32R50x";
local windowLayout = {
    {Browser,  nil, laptopScreen, hs.layout.left50,    nil, nil},
    {Critty,   nil, laptopScreen, hs.layout.right50,   nil, nil},
}

hs.hotkey.bind({"cmd", "ctrl"}, "I", function()
    hs.layout.apply(windowLayout)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
  hs.reload()
end)

hs.alert.show("Config loaded")
