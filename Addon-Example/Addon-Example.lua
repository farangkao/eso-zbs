--	Addon-Example 1.0
----------------------------

-- ZeroBane Studio Testing Setup
if not SLASH_COMMANDS then   -- SLASH_COMMANDS is defined by ESO ,so if it is missing we are not inside ESO
  require [[Addon-Example\ZBS\ESOStandards]]  -- Run only if not in ESO
  dofile  [[Addon-Example\ZBS\AddonExampleXML.lua]] -- Create all XML Controls for Dummy Testing
end

-- The Rest of your addon code here...
--
--
--
--
--



-- Testing with ZBS --------------------------
if GetWorldName() == "ZBS" then  -- ESO Function GetWorldName returns only "ZBS" if run inside ZBS
    dofile [[Addon-Example\ZBS\Addon-ExampleTests.lua]]  -- Run the Tests to confirm your Code works
end
-----------------------------------------------

--Standard RegisterForEvent for ESO:
EVENT_MANAGER:RegisterForEvent("Addon-Example", EVENT_ADD_ON_LOADED, AddonExample.OnLoad)
