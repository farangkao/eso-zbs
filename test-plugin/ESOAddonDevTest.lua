-- ESOAddonDevTest.lua by @farangkao

local function exePath(self, version)
  local version = tostring(version):gsub('%.','')
  local mainpath = ide.editorFilename:gsub("[^/\\]+$","")
  local macExe = mainpath..([[bin/lua.app/Contents/MacOS/lua%s]]):format(version)
  return ide.config.path['lua'..version]
     or (ide.osname == "Windows" and mainpath..([[bin\lua%s.exe]]):format(version))
     or (ide.osname == "Unix" and mainpath..([[bin/linux/%s/lua%s]]):format(ide.osarch, version))
     or (wx.wxFileExists(macExe) and macExe or mainpath..([[bin/lua%s]]):format(version))
end

local interpreter = {
  name =  [[ESOAddonDevTest]],
  description = [[Lua 5.1 for Elder Scrolls Online by @Farangkao (Test)]],
  api = {"baselib"},
  luaversion = version or '5.1',
  fexepath = exePath, 
  frun = function(self,wfilename,rundebug)
    local exe = self:fexepath(version or "")
    local filepath = wfilename:GetFullPath()
	
	local tmplua = wx.wxFileName()
	tmplua:AssignTempFileName(".")
	tmpluafile = tmplua:GetFullPath()
	local flua = io.open(tmpluafile, "w")
	if not flua then
		DisplayOutput("Can't open temporary file '"..tmpluafile.."' for writing\n")
		return
	end
	flua:write("print [[Hello Inside ESOAddonDev]]\n")
    flua:write(("dofile [[%s]]\n"):format(filepath))
	flua:close()
    
    if rundebug then  -- We are Debugging
      DebuggerAttachDefault({runstart = ide.config.debugger.runonstart == true})      
      -- update arg to point to the proper file
      rundebug = ('if arg then arg[0] = [[%s]] end '):format(tmpluafile)..rundebug
	  
      local tmpfile = wx.wxFileName()
      tmpfile:AssignTempFileName(".")
      local filepath = tmpfile:GetFullPath()
      local f = io.open(filepath, "w")
      if not f then
        DisplayOutput("Can't open temporary file '"..filepath.."' for writing\n")
        return
      end
      f:write(rundebug)
      f:close()
	  tmpluafile = filepath
	  local fh = io.open(tmpluafile, "r")
      if fh then fh:close() end
      if ide.osname == 'Windows' and pcall(require, "winapi")
      and tmpfile:FileExists() and not fh then
        winapi.set_encoding(winapi.CP_UTF8)
        tmpluafile = winapi.short_path(tmpluafile)
      end
    else	   -- We are Only Running (without Debugging)
      -- if running on Windows and can't open the file, this may mean that
      -- the file path includes unicode characters that need special handling
      local fh = io.open(tmpluafile, "r")
      if fh then fh:close() end
      if ide.osname == 'Windows' and pcall(require, "winapi")
      and wfilename:FileExists() and not fh then
        winapi.set_encoding(winapi.CP_UTF8)
        tmpluafile = winapi.short_path(tmpluafile)
      end
    end
    local params = ide.config.arg.any or ide.config.arg.lua
    local code = ([[-e "io.stdout:setvbuf('no')" "%s"]]):format(tmpluafile)
    local cmd = '"'..exe..'" '..code..(params and " "..params or "")

    -- modify CPATH to work with other Lua versions
    local clibs = ('/clibs%s/'):format(version and tostring(version):gsub('%.','') or '')
    local _, cpath = wx.wxGetEnv("LUA_CPATH")
    if version and cpath and not cpath:find(clibs, 1, true) then
      wx.wxSetEnv("LUA_CPATH", cpath:gsub('/clibs/', clibs)) end

    -- CommandLineRun(cmd,wdir,tooutput,nohide,stringcallback,uid,endcallback)
    local pid = CommandLineRun(cmd,self:fworkdir(wfilename),true,false,nil,nil,
      function() 
	--	if rundebug then wx.wxRemoveFile(tmpluafile) end 
	  end)

    if version and cpath then wx.wxSetEnv("LUA_CPATH", cpath) end
    return pid
  end, 
  fprojdir = function(self,wfilename)
    return wfilename:GetPath(wx.wxPATH_GET_VOLUME)
  end,
  fworkdir = function (self,wfilename)
    return ide.config.path.projectdir or wfilename:GetPath(wx.wxPATH_GET_VOLUME)
  end,
  hasdebugger = true,
  fattachdebug = function(self) DebuggerAttachDefault() end,
}

return {
  name = "ESOAddonDevTest",
  description = "Elder Scrolls Addon Developing Plugin (Test Plugin)",
  author = "@farangkao",  
  version = 1.0,
  interpreter = interpreter,
  onEditorLoad = function(self, editor)  
		editor:SetProperty("html.tags.case.sensitive", "1") 
		editor:SetProperty("html.attributes.case.sensitive", "1") 
	end,
  onEditorNew = function(self, editor) 
		editor:SetProperty("html.tags.case.sensitive", "1") 
		editor:SetProperty("html.attributes.case.sensitive", "1") 
	end,

  onRegister = function(self)    	
	ide:AddInterpreter("ESOAddonDevTest", interpreter)    
  end,
  
  onUnRegister = function(self) 	
	ide:RemoveInterpreter("ESOAddonDevTest")
    end,	
}
