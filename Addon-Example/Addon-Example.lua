--	Addon-Example 1.0
----------------------------

-- ZeroBane Studio Testing Setup
if ESOAddonDev then   -- If available we are inside ZBS and need to do some work
  
  ESOAddonDev:GetXML([[Addon-Example\Addon-Example.xml]]) 
  
  -- More specific Code here (which helps to compile the lua)
end

-- The Rest of your addon code here...
--
--
--
--
--



-- Testing with ZBS --------------------------
if ESOAddonDev then 
    dofile [[Addon-Example\ZBS\Addon-ExampleTests.lua]]  -- Run the Tests to confirm your Code works
end
-----------------------------------------------

--Standard RegisterForEvent for ESO:
EVENT_MANAGER:RegisterForEvent("Addon-Example", EVENT_ADD_ON_LOADED, AddonExample.OnLoad)
