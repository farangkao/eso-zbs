eso-zbs
=======

Modifications for [ZeroBrane Studio](http://studio.zerobrane.com/) to support Addon Development on Elder Scrolls Online (ESO)

**ESO** = Elder Scrolls Online

**ZBS** = ZeroBranch Studio

## References

ZeroBrane Studio  (IDE for Lua) by Paul Kulchenko
        [http://studio.zerobrane.com/](http://studio.zerobrane.com/) 
        
LuaDist Package by Paul Kulchenko to support [LuaDist](http://luadist.org/)
        [https://github.com/pkulchenko/ZeroBranePackage/blob/master/luadist.lua](https://github.com/pkulchenko/ZeroBranePackage/blob/master/luadist.lua)
        
LuaXML  (Lib to parse XML Files) 
        [http://viremo.eludi.net/LuaXML//](http://viremo.eludi.net/LuaXML/)
        

## Installation Instructions

Download and Install ZBS
Download LuaDist.lua and save it to <InstallDir>\Packages
Download ESOAddonDev.lua and save it to <InstallDir>\Packages

Type the command inside ZBS on the Local Console:
**luadist.install "luaxml"

to install LuaXML Support into ZBS.
Switch the Lua Interpreter in the Menu "Project" to "ESOAddonDev"


## Project Directory

[Addon-Example/Addon-Example.lua](Addon-Example/Addon-Example.lua) -- Example of necessairy modification to ESO Addin to
support the Debugging and Compiling inside ZBS

```lua
  ESOAddonDev:GetXML([[Addon-Example\Addon-Example.xml]]) 
  ```

[Addon-Example/ZBS/ESOStandards.lua](Addon-Example/ZBS/ESOStandards.lua)  -- Standard Definitions so the Addin can be tested.
This will be loaded at the start of the Addon (only if running inside ZBS)


[Addon-Example/ZBS/Addon-ExampleTest.lua](Addon-Example/ZBS/Addon-ExampleTest.lua)  -- Testing of functionality only used within ZBS

This lua will be loaded with dofile at the End of the Addon, because the **OnLoad Event** will not be triggered automatically.

```lua
-- Testing with ZBS --------------------------
if ESOAddonDev then
    dofile [[Addon-Example\ZBS\Addon-ExampleTests.lua]] -- Run the Tests to confirm your Code works
end
```





