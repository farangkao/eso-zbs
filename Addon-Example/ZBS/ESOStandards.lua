
-- ANIMATION_MANAGER:CreateTimelineFromVirtual("MBUI_IconAnimation",_G["MBUI_Row"..i.."ButtonIcon"])
ANIMATION_MANAGER = {
  CreateTimelineFromVirtual = function(self, name, control)     
      _G[name] = { 
        }                  
        return _G[name]
    end,
}

CT_CONTROL = 1

CheckInventorySpaceSilently = function(num) return true end
GetBagInfo = function(id) return "nope", 5 end
GetBankedMoney = function() return 0 end
GetCurrentMoney = function() return 1000 end
GetControl = function(container, name) return WINDOW_MANAGER:CreateControl(nil, container, 1) end
GetItemName = function(id,ix) return "name" end
GetItemLink = function(id,ix) return "link%d+230" end
GetItemInfo = function(id,ix) return "icon","stack", 100, true, false, "equipType", "itemStyle", "quality" end  -- need to check the return params
GetItemLinkInfo = function(link) return "icon", 100, true, false, "equipType", "itemStyle" end  -- need to check the return params
GetItemType = function(id,ix) return "itemType" end  -- need to check the return param
GetNumGuilds = function() return 0 end 
GetUnitName = function(unit) return "name" end
GetSlotStackSize= function(id,cnt) return 5 end
GetItemStatValue= function(id,cnt) return 20 end
GetString = function(name) return "name" end
GetWorldName = function() return "ZBS" end
GetCVar = function(num) return "en" end

CALLBACK_MANAGER = {
 RegisterCallback = function(self, name, func) end,
}
CreateControlFromVirtual = function(name, parent, virtualname, ix)
  if name then 
    return  WINDOW_MANAGER:CreateControl(name .. tostring(ix), parent, 1)    
  else
    return  WINDOW_MANAGER:CreateControl(virtualname, parent, 1)    
  end
end

IsGameCameraUIModeActive = function() return true end

d = function(text) print (text) end

ESO_Dialogs = {}

EVENT_MANAGER = {
  RegisterForEvent = function(self, name, event, func)  end,
}


SLASH_COMMANDS = {}
    
  
  -- wm:CreateControl(nil, list, CT_BACKDROP)
WINDOW_MANAGER = {
  CreateTopLevelWindow = function(self, name) 
      return WINDOW_MANAGER:CreateControl(name, nil, 0)        
    end,
  CreateControl = function(self, name, control, ct_control)     
      local table = { 
        -- Control
         ClearAnchors = function(self) end,
         IsHidden = function(self) return false end,
         SetHandler = function(self, event,funct) return {} end,
         SetAnchor = function(self, pos1, parent, pos2, x,y) end,
         SetAnchorFill = function(self) end,
         SetDimensions = function(self, x, y) end,
         SetEdgeTexture = function(self, name, x, y) end,
         SetMouseEnabled = function(self, enabled) end,
         SetMovable = function(self, movable) end,
         SetCenterColor = function(self, r,g,b,a) end,
         SetEdgeColor = function(self, r,g,b,a) end,
         SetAlpha = function(self, a) end,
         SetDrawLevel = function(self, level) end,
         SetDrawLayer = function(self, level) end,
         SetFont = function(self, name) end,
         SetHeight = function(self, value) end,
         SetHorizontalAlignment = function(self, value) end,
         SetWidth = function(self, value) end,
         SetColor = function(self, r,g,b,a) end,
         SetText = function(self, text) end,
         SetNormalFontColor = function(self, r,g,b,a) end,
         SetMouseEnabled = function(self, enabled) end,
         SetMouseOverFontColor = function(self, r,g,b,a) end,
         SetParent = function(self,name) end,
         SetTexture = function(self, texture) end,
         SetTextureCoords = function(self, x1,y1,x2,y2) end,
         SetResizeToFitPadding = function(self, x,y) end,
         GetName = function(self) return name end,         
         -- Slider
         SetValue = function(self, value) end,
         SetHidden = function(self, hidden) end,         
         GetWidth = function(self) return 100 end,
        }          
        if name then
          _G[name] = table
        end
        return table      
    end,
  CreateControlFromVirtual = function(self, name, parent, virtualname, ix)
      return CreateControlFromVirtual(name,parent,virtualname,ix)
      end,
  GetControlByName = function(self, name) return {} end,    
}

ZO_HIGHLIGHT_TEXT = {
  UnpackRGBA = function(self) end,
}

ZO_PreHookHandler = function (control, event, func) end
    
ZO_SavedVars = {
  New            = function(self, name, version, vtype , default, unknown ) 
    return default 
    end,
  NewAccountWide = function(self, name, version, vtype , default, unknown )    
    return default
    end,
}

ZO_PreHook = function(name, func) end
ZO_OptionsWindow_AddUserPanel = function(controlPanelID, name) end
ZO_OptionsWindow_InitializeControl = function(list) end
ZO_OptionsWindowResetToDefaultButton = WINDOW_MANAGER:CreateControl("ZO_OptionsWindowResetToDefaultButton",nil, 1)
zo_strmatch = function(object,match) return 0 end  -- string.gsub(tostring(object),match)
zo_strformat= function(name1,name2) return "name" end
