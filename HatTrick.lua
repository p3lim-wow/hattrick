-- I hate that I have to do this, but Blizz's option frame fucks up the setting unless it was set from their option frame
local ShowCloak, ShowHelm, noop = ShowCloak, ShowHelm, function() end
_G.ShowCloak, _G.ShowHelm = noop, noop

for k, v in next, {InterfaceOptionsDisplayPanelShowCloak, InterfaceOptionsDisplayPanelShowHelm} do
	v:SetButtonState('DISABLED', true)
end

local helm = CreateFrame('CheckButton', 'HelmToggle', PaperDollFrame, 'OptionsCheckButtonTemplate')
helm:SetPoint('TOPLEFT', CharacterHeadSlot, 'BOTTOMRIGHT', 5, 5)
helm:SetWidth(22)
helm:SetHeight(22)
helm:SetChecked(ShowingHelm())
helm:SetToplevel()
helm:RegisterEvent('UNIT_MODEL_CHANGED')
helm:SetScript('OnClick', function() ShowHelm(not ShowingHelm()) end)
helm:SetScript('OnEvent', function(self) self:SetChecked(ShowingHelm()) end)



local cloak = CreateFrame('CheckButton', 'CloakToggle', PaperDollFrame, 'OptionsCheckButtonTemplate')
cloak:SetPoint('TOPLEFT', CharacterBackSlot, 'BOTTOMRIGHT', 5, 5)
cloak:SetWidth(22)
cloak:SetHeight(22)
cloak:SetChecked(ShowingCloak())
cloak:SetToplevel()
cloak:RegisterEvent('UNIT_MODEL_CHANGED')
cloak:SetScript('OnClick', function() ShowCloak(not ShowingCloak()) end)
cloak:SetScript('OnEvent', function(self) self:SetChecked(ShowingCloak()) end)
