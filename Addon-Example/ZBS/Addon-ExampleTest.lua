-- Testing inside Zebrane Studio

function ZBS_load(path)
    dofile ([[MobileBank\]] .. path)
end
-- load other lua files:
ZBS_load [[MobileBankOptions.lua]]

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

-- Event AddonLoaded:
MB.OnLoad(0, "MobileBank")
-- Testing commandHandler
MB.commandHandler("g")
MB.commandHandler("p")
MB.commandHandler("i")
