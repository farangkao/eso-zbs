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

Download LuaDist.lua and save it to <<InstallDir>>\Packages

Download ESOAddonDev.lua and save it to <<InstallDir>>\Packages

Type the command inside ZBS on the Local Console:
**luadist.install "luaxml"**

To install LuaXML Support into ZBS.

Switch the Lua Interpreter in the Menu "Project" to "ESOAddonDev"


## Addon Modifications

To fully support your Addon getting Compiled and Debugged you need to do some extra steps.

First all XML Files need to be parsed, so the Object created thru the XML File are known.

```lua
  ESOAddonDev:GetXML([[Addon-Example\Addon-Example.xml]]) 
```

You will also need to Execute some Commands to Test out more than just the main-lua Code.
Also some Errors will only be found if you call the Methods in the Test.
Since the **OnLoad** Method will not be executed thru an Event ,like it would inside ESO.
You can write all Test-Code directly inside the Main-Lua, however it might be more
useful to create a seperate Lua for this (i put it in a sub-folder "ZBS" since it's not needed when
you commit your addon to ESOUI.com)

```lua
-- Testing with ZBS --------------------------
if ESOAddonDev then
    dofile [[Addon-Example\ZBS\Addon-ExampleTests.lua]] -- Run the Tests to confirm your Code works
end
```

Main Lua-Example here:
[Addon-Example/Addon-Example.lua](Addon-Example/Addon-Example.lua) -- Example of necessairy modification to ESO Addin to
support the Debugging and Compiling inside ZBS

Test-Lua-Example here:
[Addon-Example/ZBS/Addon-ExampleTest.lua](Addon-Example/ZBS/Addon-ExampleTest.lua)  -- Testing of functionality only used within ZBS

