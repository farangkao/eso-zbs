require("LuaXml")

LuaESO = {
  GetXML = function (self,path)
	  -- load XML data from file "test.xml" into local table xfile 
	  local xfile = xml.load(path) 
	  -- search for substatement having the tag "scene" 
	  local gui = xfile:find("GuiXml") 
	  local parent = nil

	  function rPrint(s, l, i, lastparent) -- recursive Print (structure, limit, indent)
		l = (l) or 100; i = i or "";	-- default item limit, indent string
		if (l<1) then print "ERROR: Item limit reached."; return l-1 end;  
		local ts = type(s);
		
		if (ts ~= "table") then
		  if i == "name" then       
			entry = xfile:find(nil,"name",s)                  
		  --  if lastparent then  print ("lastparent: " .. lastparent) end
			if lastparent then s = s:gsub("%$%(parent%)",lastparent) end      
			local control = 0
			if entry:tag() == "Control" then control = CT_CONTROL end              
		--    print ("name: " .. s)         
			--  print ("tag: " .. entry:tag())      
			WINDOW_MANAGER:CreateControl(s,nil,control) 
			if _G[s] then
			  print ("WINDOW_MANAGER:CreateControl => " .. s)
			  -- for k,v in pairs(_G[s]) do
			  --   print ("key: " .. tostring(k))
			  -- end
			end      
			parent = s
		--    print("parent: " .. parent)
		  end
		  return l-1 
		end        
		for k,v in pairs(s) do -- print "[KEY] VALUE"
		  if type(k) == "string" then           
			l = rPrint(v, l, tostring(k),parent);          
			if (l < 0) then break end
		  end
		end  
		for k,v in pairs(s) do -- print "[KEY] VALUE"
		  if type(k) == "number" then            
			l = rPrint(v, l, tostring(k),parent);            
			if (l < 0) then break end
		  end
		end
		parent = lastparent
		
		return l
	  end	

	  -- if this substatement is found... 
	  if gui ~= nil then 
		print("Read XML...")
		rPrint(gui,10000,1,"GuiXML")
	  end 
	end
}
