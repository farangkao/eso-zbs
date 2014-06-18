eso-zbs
=======

# Please Read

Modifications for [ZeroBrane Studio](http://studio.zerobrane.com/) to support Addon Development on Elder Scrolls Online (ESO)

**ESO** = Elder Scrolls Online

**ZBS** = ZeroBranch Studio

## Project Directory

[Addon-Example/Addon-Example.lua](Addon-Example/Addon-Example.lua) -- Example of necessairy modification to ESO Addin to
support the Debugging and Compiling inside ZBS

[Addon-Example/ZBS/ESOStandards.lua](Addon-Example/ZBS/ESOStandards.lua)  -- Standard Definitions so the Addin can be tested.
This will be loaded at the start of the Addon (only if running inside ZBS)

**Note:** currently only the definitions so that my addon works are inside the ESOStandards.lua
I will try to capture all Functions later on. It's always possible to add missing definitons into that file by yourself.

[Addon-Example/ZBS/Addon-ExampleTest.lua](Addon-Example/ZBS/Addon-ExampleTest.lua)  -- Testing of functionality only used within ZBS

This lua will be loaded with dofile at the End of the Addon, because the **OnLoad Event** will not be triggered automatically.
```lua
-- Testing with ZBS --------------------------
if GetWorldName() == "ZBS" then -- ESO Function GetWorldName returns only "ZBS" if run inside ZBS
    dofile [[Addon-Example\ZBS\Addon-ExampleTests.lua]] -- Run the Tests to confirm your Code works
end
```

[lualibs/LuaESO/LuaESO.lua](lualibs/LuaESO/LuaESO.lua) -- Supports reading an ESO GuiXML and converts them into Lua Objects.
This is necessairy to avoid compile errors for objects created by ESO during reading of the XML.

**Work-To-Do:** Currently Virtual Controls with Sub-Controls are not yet supported - working on it.

```lua
  require [[LuaESO]] -- required to Convert ESO GuiXML to Lua Objects
  LuaESO:GetXML([[Addon-Example\Addon-Example.xml]]) 
  ```

[lualibs/LuaXML/LuaXML.lua](lualibs/LuaXML/LuaXML.lua)  -- Library to read XML Files by Gerald Franz [http://viremo.eludi.net/LuaXML/](http://viremo.eludi.net/LuaXML/)  -- download for binary .dll file necessairy in the same folder.

## ZBS Installation Directory

[interpreters/luaeso.lua](interpreters/luaeso.lua) -- To be able to Choose Project->Lua Interpreters->Lua 5.1 Elder Scrolls Online

[api/lua/esolib.lua](api/lua/esolib.lua) -- For Syntax Support (incl. AutoComplete and ToolTips)
**Note:** This is just an example, need to be completed with all functions and variables.

