local select, UnitBuff, UnitDebuff, UnitAura, tonumber, strfind, hooksecurefunc =
	select, UnitBuff, UnitDebuff, UnitAura, tonumber, strfind, hooksecurefunc

local function addLine(self,id,isItem)
	if isItem then
		self:AddDoubleLine("ItemID:","|cffffffff"..id)
		if IsAltKeyDown() then ChatFrame1EditBox:SetText(id) print(id) end
	else
		self:AddDoubleLine("SpellID:","|cffffffff"..id)
		if IsAltKeyDown() then ChatFrame1EditBox:SetText(id) print(id) end
	end
	self:Show()
end

-- Spell Hooks ----------------------------------------------------------------
hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
	local id = select(11,UnitBuff(...))
	if id then addLine(self,id) end
end)

hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
	local id = select(11,UnitDebuff(...))
	if id then addLine(self,id) end
end)

hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
	local id = select(11,UnitAura(...))
	if id then addLine(self,id) end
end)

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
	local id = select(3,self:GetSpell())
	if id then addLine(self,id) end
end)

hooksecurefunc("SetItemRef", function(link, ...)
	local id = tonumber(link:match("spell:(%d+)"))
	if id then addLine(ItemRefTooltip,id) end
end)

-- Item Hooks -----------------------------------------------------------------

local function attachItemTooltip(self)
	local link = select(2,self:GetItem())
	if not link then return end
	local id = select(3,strfind(link, "^|%x+|Hitem:(%-?%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%-?%d+):(%-?%d+)"))
	if id then addLine(self,id,true) end
	
end
GameTooltip:HookScript('OnTooltipSetUnit', function(self)
    local name, unit = self:GetUnit()
	-- print(name, unit)
    if unit then
        local unitType, f, g, h, j, npcID = strsplit(':', UnitGUID(unit) or '')
		local a = strsub(UnitGUID(unit),7,10);
		local NPCID = tonumber(a,16)
        if unitType then
            self:AddDoubleLine(NPCID)
            self:Show()
			if IsAltKeyDown() then ChatFrame1EditBox:SetText(NPCID) print(NPCID) end
			if IsControlKeyDown() then ChatFrame1EditBox:SetText(name) print(name) end
			-- print(NPCID, name)
        end
    end
end)
GameTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)
ItemRefShoppingTooltip3:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)
ShoppingTooltip3:HookScript("OnTooltipSetItem", attachItemTooltip)

print("ok")


MinimapZoneTextButton:HookScript("OnClick", function()
	
	--print("GetMinimapZoneText: |cffFFF468", GetMinimapZoneText() )
	--print("GetRealZoneText: |cffFFF468", GetRealZoneText() )
	print("GetZoneText: |cffFFF468", GetZoneText() )
	print("GetSubZoneText: |cffFFF468", GetSubZoneText() )
	--print("GetZonePVPInfo: |cffFFF468", GetZonePVPInfo() )
	local a = {GetCurrentMapZone()}
	--print("GetCurrentMapZone: |cffFFF468", a[1] )
	
	--print( GetCurrentMapAreaID ()  )
	--print( GetMapNameByID(GetCurrentMapAreaID())  )
	
	-- /run print((select(8,GetInstanceInfo())))
	
	--print(" ")

end)
