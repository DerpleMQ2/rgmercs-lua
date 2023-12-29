-- Sample Basic Class Module
local mq             = require('mq')
local RGMercsLogger  = require("rgmercs.utils.rgmercs_logger")
local RGMercUtils    = require("rgmercs.utils.rgmercs_utils")
local shdClassConfig = require("rgmercs.class_configs.shd_class_config")

local Module             = { _version = '0.1a', name = "ShadowKnight", author = 'Derple' }
Module.__index           = Module
Module.Tanking           = false
Module.SpellLoadOut      = {}
Module.ResolvedActionMap = {}

local newCombatMode  = false

local function getConfigFileName()
    return mq.configDir ..
        '/rgmercs/PCConfigs/' .. Module.name .. "_" .. RGMercConfig.CurServer .. "_" .. RGMercConfig.CurLoadedChar .. '.lua'
end

function Module:SaveSettings(doBroadcast)
    mq.pickle(getConfigFileName(), self.settings)

    if doBroadcast then
        RGMercUtils.BroadcastUpdate(self.name, "SaveSettings")
    end
end

function Module:LoadSettings()
    RGMercsLogger.log_info("Basic Combat Module Loading Settings for: %s.", RGMercConfig.CurLoadedChar)
    local settings_pickle_path = getConfigFileName()

    local config, err = loadfile(settings_pickle_path)
    if err or not config then
        RGMercsLogger.log_error("\ay[Basic]: Unable to load global settings file(%s), creating a new one!",
            settings_pickle_path)
        self.settings = {}
        self:SaveSettings(true)
    else
        self.settings = config()
    end

    -- Setup Defaults
    self.settings.Mode = self.settings.Mode or shdClassConfig.DefaultConfig.Mode.Default
    self.settings.DoTorrent = self.settings.DoTorrent or shdClassConfig.DefaultConfig.DoTorrent.Default
    self.settings.DoDiretap = self.settings.DoDiretap or shdClassConfig.DefaultConfig.DoDiretap.Default
    self.settings.DoBandolier = self.settings.DoBandolier or shdClassConfig.DefaultConfig.DoBandolier.Default
    self.settings.DoBurn = self.settings.DoBurn or shdClassConfig.DefaultConfig.DoBurn.Default
    self.settings.DoSnare = self.settings.DoSnare or shdClassConfig.DefaultConfig.DoSnare.Default
    self.settings.DoDot = self.settings.DoDot or shdClassConfig.DefaultConfig.DoDot.Default
    self.settings.DoAE = self.settings.DoAE or shdClassConfig.DefaultConfig.DoAE.Default
    self.settings.AeTauntCnt = self.settings.AeTauntCnt or shdClassConfig.DefaultConfig.AeTauntCnt.Default
    self.settings.HPStopDOT = self.settings.HPStopDOT or shdClassConfig.DefaultConfig.HPStopDOT.Default
    self.settings.TLP = self.settings.TLP or shdClassConfig.DefaultConfig.TLP.Default
    self.settings.ManaToNuke = self.settings.ManaToNuke or shdClassConfig.DefaultConfig.ManaToNuke.Default
    self.settings.FlashHP = self.settings.FlashHP or shdClassConfig.DefaultConfig.FlashHP.Default
    self.settings.StartBigTap = self.settings.StartBigTap or shdClassConfig.DefaultConfig.StartBigTap.Default
    self.settings.StartLifeTap = self.settings.StartLifeTap or shdClassConfig.DefaultConfig.StartLifeTap.Default
    self.settings.BurnSize = self.settings.BurnSize or shdClassConfig.DefaultConfig.BurnSize.Default
    self.settings.BurnAuto = self.settings.BurnAuto or shdClassConfig.DefaultConfig.BurnAuto.Default
    self.settings.DoPet = self.settings.DoPet or shdClassConfig.DefaultConfig.DoPet.Default
    self.settings.BurnMobCount = self.settings.BurnMobCount or shdClassConfig.DefaultConfig.BurnMobCount.Default
    self.settings.BurnNamed = self.settings.BurnNamed or shdClassConfig.DefaultConfig.BurnNamed.Default
    newCombatMode = true
end

function Module.New()
        -- Only load this module for SKs
    if RGMercConfig.CurLoadedClass ~= "SHD" then return nil end

    RGMercsLogger.log_info("ShadowKnight Combat Module Loaded.")
    local newModule = setmetatable({ settings = {}, CombatState = "None" }, Module)

    newModule:LoadSettings()

    return newModule
end

-- helper function for advanced logic to see if we want to use Darl Lord's Unity
function Module:castDLU()
    if not Module.ResolvedActionMap['Shroud'] then return false end

    local res = mq.TLO.Spell(Module.ResolvedActionMap['Shroud']).Level() <= (mq.TLO.Me.AltAbility("Dark Lord's Unity (Azia)").Spell.Level() or 0) and
            mq.TLO.Me.AltAbility("Dark Lord's Unity (Azia)").MinLevel() <= mq.TLO.Me.Level() and
            mq.TLO.Me.AltAbility("Dark Lord's Unity (Azia)").Rank() > 0

    return res
end

function Module:setCombatMode(mode)
    RGMercsLogger.log_debug("\aySettings Combat Mode to: \am%s", mode)
    if mode == "Tank" then
        Module.Tanking = true
        if self.settings.TLP then
            Module.ResolvedActionMap, Module.SpellLoadOut = RGMercUtils.SetLoadOut(shdClassConfig.Rotations.TLP_Tank.Spells, shdClassConfig.ItemSets, shdClassConfig.AbilitySets)
        else
            Module.ResolvedActionMap, Module.SpellLoadOut = RGMercUtils.SetLoadOut(shdClassConfig.Rotations.Tank.Spells, shdClassConfig.ItemSets, shdClassConfig.AbilitySets)
        end
    elseif mode == "DPS" then
        Module.Tanking = false
        if self.settings.TLP then
            Module.ResolvedActionMap, Module.SpellLoadOut = RGMercUtils.SetLoadOut(shdClassConfig.Rotations.TLP_DPS.Spells, shdClassConfig.ItemSets, shdClassConfig.AbilitySets)
        else
            Module.ResolvedActionMap, Module.SpellLoadOut = RGMercUtils.SetLoadOut(shdClassConfig.Rotations.DPS.Spells, shdClassConfig.ItemSets, shdClassConfig.AbilitySets)
        end 
    end
    
    RGMercUtils.LoadSpellLoadOut(Module.SpellLoadOut)
end

local function renderSetting(k, v)
    if type(v) == "table" then
        ImGui.Text(k)
        ImGui.Indent()
        for ki, kv in pairs(v) do
            renderSetting(ki, kv)
        end
        ImGui.Unindent()
    else
        ImGui.Text("%s => %s", k, v)
    end
end

function Module:Render()
    ImGui.Text("ShadowKnight Combat Modules")
    local pressed 

    if ImGui.CollapsingHeader("Current Settings") then
        for k, v in pairs(self.settings) do
            renderSetting(k, v)
        end
    end

    local pressed

    ImGui.Text("Mode: ")
    ImGui.SameLine()
    self.settings.Mode, pressed = ImGui.Combo("##_select_ai_mode", self.settings.Mode, shdClassConfig.Modes, #shdClassConfig.Modes)
    newCombatMode = newCombatMode or pressed

    self.settings.ManaToNuke, pressed = ImGui.InputInt("test", self.settings.ManaToNuke, 1, 25)

    self.settings.TLP, pressed = RGMercUtils.RenderOptionToggle("##_bool_tlp_mode", "TLP Mode", self.settings.TLP)
    newCombatMode = newCombatMode or pressed

    self.settings.DoTorrent, pressed = RGMercUtils.RenderOptionToggle("##_bool_do_torrent", "Use Torrents", self.settings.DoTorrent)
    newCombatMode = newCombatMode or pressed

    self.settings.DoDiretap, pressed = RGMercUtils.RenderOptionToggle("##_bool_do_diretap", "Use Diretap", self.settings.DoDiretap)
    newCombatMode = newCombatMode or pressed

    self.settings.DoSnare, pressed = RGMercUtils.RenderOptionToggle("##_bool_do_snare", "Cast Snares", self.settings.DoSnare)
    if pressed then self:SaveSettings(true) end

    self.settings.DoDot, pressed = RGMercUtils.RenderOptionToggle("##_bool_do_dot", "Cast DoTs", self.settings.DoDot)
    if pressed then self:SaveSettings(true) end

    self.settings.DoAE, pressed = RGMercUtils.RenderOptionToggle("##_bool_do_ae", "Cast AE Taunt", self.settings.DoAE)
    if pressed then self:SaveSettings(true) end    

    self.settings.DoPet, pressed = RGMercUtils.RenderOptionToggle("##_bool_do_pet", "Cast Pet", self.settings.DoPet)
    if pressed then self:SaveSettings(true) end

    self.settings.DoBandolier, pressed = RGMercUtils.RenderOptionToggle("##_bool_do_bandolier", "Use Bandolier", self.settings.DoBandolier)
    if pressed then self:SaveSettings(true) end

    self.settings.DoBurn, pressed = RGMercUtils.RenderOptionToggle("##_bool_do_burn", "Burn", self.settings.DoBurn)
    if pressed then self:SaveSettings(true) end

    self.settings.BurnAuto, pressed = RGMercUtils.RenderOptionToggle("##_bool_auto_burn", "Burn Auto", self.settings.BurnAuto)
    if pressed then self:SaveSettings(true) end

    self.settings.BurnNamed, pressed = RGMercUtils.RenderOptionToggle("##_bool_auto_named", "Burn Named", self.settings.BurnNamed)
    if pressed then self:SaveSettings(true) end

    if ImGui.CollapsingHeader("Spell Loadout") then
        ImGui.Indent()
        RGMercUtils.RenderLoadoutTable(Module.SpellLoadOut)
        ImGui.Unindent()
    end

    if ImGui.CollapsingHeader("Rotations") then
        ImGui.Indent()
        local mode = shdClassConfig.Modes[self.settings.Mode]
        if self.settings.TLP then
            mode = "TLP_"..mode
        end
        for k,v in pairs(shdClassConfig.Rotations[mode].Rotation) do
            if ImGui.CollapsingHeader(k) then
                ImGui.Indent()
                RGMercUtils.RenderRotationTable(self, k, shdClassConfig.Rotations[mode].Rotation[k], Module.ResolvedActionMap)
                ImGui.Unindent()
            end
        end
        ImGui.Unindent()
    end
    ImGui.Text(string.format("Combat State: %s", self.CombatState))
end

function Module:GiveTime(combat_state)
    -- Main Module logic goes here.
    if newCombatMode then
        RGMercsLogger.log_debug("New Combat Mode Requested: %s", shdClassConfig.Modes[self.settings.Mode])
        self:setCombatMode(shdClassConfig.Modes[self.settings.Mode])
        self:SaveSettings(true)
        newCombatMode = false
    end

    self.CombatState = combat_state

    -- Downtime totaiton will just run a full rotation to completion
    if self.CombatState == "Downtime" then
        if Module.Tanking and self.settings.TLP then
            RGMercUtils.RunRotation(self, shdClassConfig.Rotations.TLP_Tank.Rotation.Downtime, Module.ResolvedActionMap)
        elseif not Module.Tanking and self.settings.TLP then
            RGMercUtils.RunRotation(self, shdClassConfig.Rotations.TLP_DPS.Rotation.Downtime, Module.ResolvedActionMap)
        elseif Module.Tanking then
            RGMercUtils.RunRotation(self, shdClassConfig.Rotations.Tank.Rotation.Downtime, Module.ResolvedActionMap)
        else
            RGMercUtils.RunRotation(self, shdClassConfig.Rotations.DPS.Rotation.  Downtime, Module.ResolvedActionMap)
        end
    else
    end
end

function Module:Shutdown()
    RGMercsLogger.log_info("ShadowKnight Combat Module UnLoaded.")
end

return Module
