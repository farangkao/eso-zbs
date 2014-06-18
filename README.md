eso-zbs
=======

Modifications for ZeroBrane Studio to support Addon Development on Elder Scrolls Online (ESO)

ESO = Elder Scrolls Online

ZBS = ZeroBranch Studio

[Addon-Example/Addon-Example.lua](Addon-Example/Addon-Example.lua) -- Example of necessairy modification to ESO Addin to
support the Debugging and Compiling inside ZBS

[Addon-Example/ZBS/ESOStandards.lua](Addon-Example/ZBS/ESOStandards.lua)  -- Standard Definitions so the Addin can be tested inside ZBS

Note: currently only the definitions so that my addon works are inside the ESOStandards.lua
I will try to capture all Functions later on. It's always possible to add missing definitons into that file by yourself.

[Addon-Example/ZBS/Addon-ExampleTests.lua](Addon-Example/ZBS/Addon-ExampleTests.lua)  -- Testing of functionality only used within ZBS

[lualibs/LuaESO/LuaESO.lua](lualibs/LuaESO/LuaESO.lua) -- Supports reading an ESO GuiXML and converts them into Lua Objects.
This is necessairy to avoid compile errors for objects created by ESO during reading of the XML.

```lua
  require [[LuaESO]] -- required to Convert ESO GuiXML to Lua Objects
  LuaESO:GetXML([[MobileBank\MobileBank.xml]]) 
  ```

[lualibs/LuaXML/LuaXML.lua](lualibs/LuaXML/LuaXML.lua)  -- Library to read XML Files by Gerald Franz [http://viremo.eludi.net/LuaXML/](http://viremo.eludi.net/LuaXML/)  -- download for binary .dll file necessairy in the same folder.
