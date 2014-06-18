-- Testing inside Zebrane Studio

function ZBS_load(path)  -- Helper Function to Add Directory if necessairy
    dofile ([[Addon-Example\]] .. path)
end
-- load other lua files (those are defined in the .TXT of your Addon):
ZBS_load [[Addon-ExampleOptions.lua]]

ZBS_load [[Libs\LibStub.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\LibAddonMenu-2.0.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\panel.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\submenu.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\button.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\checkbox.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\colorpicker.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\custom.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\description.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\dropdown.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\editbox.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\header.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\slider.lua]]
ZBS_load [[Libs\LibAddonMenu-2.0\controls\texture.lua]]

-- Event AddonLoaded:  Simulate the Event from ESO
AddonExample.OnLoad(0, "Addon-Example")
-- Testing commandHandler outside of ESO
AddonExample.commandHandler("test")

