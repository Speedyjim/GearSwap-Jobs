-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.
   -- Supplementary files needed: 
      -- Mote-Globals
	  -- Mote-Include
	  -- Mote-Mappings
	  -- Mote-SelfCommands
	  -- Mote-TreasureHunter
	  -- Mote-Utility

-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
	state.Buff['Trick Attack'] = buffactive['trick attack'] or false
	state.Buff['Feint'] = buffactive['feint'] or false
	
	include('Mote-TreasureHunter')

	-- For th_action_check():
	-- JA IDs for actions that always have TH: Provoke, Animated Flourish
	info.default_ja_ids = S{35, 204}
	-- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
	info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.OffenseModes = {'Normal', 'Acc', 'Mod'} -- Mod for trivially weak mobs
	options.DefenseModes = {'Normal', 'Evasion', 'PDT'}
	options.RangedModes = {'Normal', 'Acc'}
	options.WeaponskillModes = {'Normal', 'Acc', 'Mod'}
	options.IdleModes = {'Normal'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'Evasion', 'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.RangedMode = 'Normal'
	state.Defense.PhysicalMode = 'Evasion'

	gear.default.weaponskill_neck = "Asperity Necklace"
	gear.default.weaponskill_waist = "Caudata Belt"
	
	gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}

	-- Additional local binds
	send_command('bind ^` input /ja "Flee" <me>')
	send_command('bind ^= gs c cycle treasuremode')
	send_command('bind !- gs c cycle targetmode')

	select_default_macro_book()
	   set_macro_page(1, 1)
end

-- Called when this job file is unloaded (eg: job change)
function job_file_unload()
	send_command('unbind ^`')
	send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Special sets (required by rules)
	--------------------------------------

	sets.TreasureHunter = {hands="Plunderer's Armlets +1", waist="Chaac Belt", feet="Raider's Poulaines +2"}
	sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
	sets.Kiting = {feet="Pillager's Poulaines +1"}

	sets.buff['Sneak Attack'] = {ammo="Qirmiz Tathlum",
		head="Uk'uxkaj Cap",neck="Love Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Vespid Mantle",waist="Chaac Belt",legs="Pillager's Culottes +1",feet="Raider's Poulaines +2"}

	sets.buff['Trick Attack'] = {ammo="Qirmiz Tathlum",
		head="Pillager's Bonnet +1",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Stormsoul Ring",ring2="Epona's Ring",
		back="Vespid Mantle",waist="Chaac Belt",legs="Pillager's Culottes +1",feet="Raider's Poulaines +2"}

	-- Actions we want to use to tag TH.
	sets.precast.Step = sets.TreasureHunter
	sets.precast.Flourish1 = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter


	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Collaborator'] = {head="Raider's Bonnet +2"}
	sets.precast.JA['Accomplice'] = {head="Raider's Bonnet +2"}
	sets.precast.JA['Assassins Charge'] = {feet="Plunderer's Poulaines +1"}
	sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
	sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
	sets.precast.JA['Conspirator'] = {body="Raider's Vest +2"}
	sets.precast.JA['Steal'] = {head="Plunderer's Bonnet",hands="Pillager's Armlets +1",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}
	sets.precast.JA['Despoil'] = {feet="Raider's Poulaines +2"}
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
	sets.precast.JA['Feint'] = {legs="Plunderer's Culottes +1"}

	sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
	sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Uk'Uxkaj Cap",ear1="Soil Pearl",ear2="Soil Pearl",
		body="Pillager's Vest +1",hands="Plunderer's Armlets +1",ring1="Asklepian Ring",
		back="Iximulew Cape",waist="Chaac Belt",legs="Plunderer's Culottes +1",feet="Pillager's Poulaines +1"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}


	-- Fast cast sets for spells
	sets.precast.FC = {ammo="Impatiens",ear2="Loquacious Earring",hands="Buremte Gloves",ring1="Prolix Ring"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {ammo="Impatiens",neck="Magoraga Beads",hands="Buremte Gloves",ring1="Prolix Ring"})


	-- Ranged snapshot gear
	sets.precast.RA = {}


	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Potestas Bomblet",
		 head="Uk'uxkaj Cap",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
		 body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
		 back="Atheling Mantle",waist="Caudata Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum", back="Vespid Mantle"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Mercy Stroke'].Acc = set_combine(sets.precast.WS['Mercy Stroke'], {})
	sets.precast.WS['Mercy Stroke'].Mod = set_combine(sets.precast.WS['Mercy Stroke'], {})
	sets.precast.WS['Mercy Stroke'].SA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {ammo="Qirmiz Tathlum",
	     head="Pillager's Bonnet +1",ear1="Flame Pearl",ear2="Flame Pearl",body="Plunderer's Vest +1",hands="Raider's Armlets +2",
		 ring2="Pyrosoul Ring",back="Buquwik Cape",waist="Caudata Belt",feet="Qaaxo Leggings"})
	sets.precast.WS['Mercy Stroke'].SA.Acc = set_combine(sets.precast.WS['Mercy Stroke'].SA, {ammo="Honed Tathlum",
	     head="Whirlpool Mask",body="Pillager's Vest +1",hands="Buremte Gloves",})
	sets.precast.WS['Mercy Stroke'].TA = set_combine(sets.precast.WS['Mercy Stroke'].SA, {hands="Pillager's Armlets +1",})
	sets.precast.WS['Mercy Stroke'].TA.Acc = set_combine(sets.precast.WS['Mercy Stroke'].TA, {ammo="Honed Tathlum",head="Whirlpool Mask",})
	
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {head="Felistris Mask",ear1="Tripudio Earring",
	     ear2="Brutal Earring",body="Plunderer's Vest +1",ring1="Stormsoul Ring",back="Vespid Mantle",
		 waist="Caudata Belt",legs="Nahtirah Trousers"})
	sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum",head="Whirlpool Mask",
	     hands="Buremte Gloves",back="Canny Cape",waist="Anguinus Belt",legs="Plunderer's Cullotes +1",feet="Pillager's Poulaines +1"})
	sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {head="Felistris Mask",neck="Justiciar's Torque",ear1="Tripudio Earring",
	     ear2="Brutal Earring",body="Plunderer's Vest +1",ring1="Stormsoul Ring",ring2="Stormsoul Ring",back="Vespid Mantle",
		 waist="Prosilio Belt",legs="Nahtirah Trousers"})
	sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum"
	     head="Pillager's Bonnet +1",neck=gear.ElementalGorget,legs="Pillager's Cullotes +1"})
	sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].SA, {})
	sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].SA, {})

	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Qirmiz Tathlum",
		 head="Uk'uxkaj Cap",neck="Love Torque",ear1="Tripudio Earring",ear2="Moonshade Earring",back="Rancorous Mantle"})
	sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Honed Tathlum",
	     head="Whirlpool Mask",neck=gear.ElementalGorget,hands="Buremte Gloves",waist="Anguinus Belt",
		 legs="Plunderer's Culottes +1",feet="Pillager's Poulaines +1"})
	sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {})
	sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
	sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
	sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {})

	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {head="Pillager's Bonnet +1",ear1="Brutal Earring",ear2="Moonshade Earring"})
	sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Honed Tathlum", back="Letalis Mantle"})
	sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {back="Kayapa Cape",waist=gear.ElementalBelt})
	sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum",
		 body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
	sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum",
		 body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
	sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum",
		 body="Pillager's Vest +1",legs="Pillager's Culottes +1"})

	sets.precast.WS['Aeolian Edge'] = {head="Pill. Bonnet +1",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
		 body="Wayfarer Robe",hands="Pillager's Armlets +1",ring1="Acumen Ring",back="Toro Cape",
		 waist=gear.ElementalBelt,legs="Plun. Culottes +1",feet="Pill. Poulaines +1"}

	sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {
		head="Whirlpool Mask",ear2="Loquacious Earring",
		body="Pillager's Vest +1",hands="Pillager's Armlets +1",
		back="Canny Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

	-- Specific spells
	sets.midcast.Utsusemi = {
		head="Felistris Mask",ear2="Loquacious Earring",body="Pillager's Vest +1",
		hands="Buremte Gloves",legs="Quiahuiz Trousers",feet="Plunderer's Poulaines +1"}

	-- Ranged gear
	sets.midcast.RA = {}

	sets.midcast.RA.Acc = {}


	--------------------------------------
	-- Idle/resting/defense sets
	--------------------------------------

	-- Resting sets
	sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle = {
		head="Felistris Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Kheper Jacket",hands="Pillager's Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Repulse Mantle",waist="Flume Belt",legs="Quiahuiz Trousers",feet="Pillager's Poulaines +1"}

	sets.idle.Town = {
		head="Felistris Mask",neck="Love Torque",ear1="Moonshade Earring",ear2="Brual Earring",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Quiahuiz Trousers",feet="Pillager's Poulaines +1"}

	sets.idle.Weak = {
		head="Felistris Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Kheper Jacket",hands="Pillager's Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Repulse Mantle",waist="Flume Belt",legs="Quiahuiz Trousers",feet="Pillager's Poulaines +1"}


	-- Defense sets

	sets.defense.Evasion = {
		head="Pillager's Bonnet +1",neck="Torero Torque",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Defending Ring",ring2="Beeline Ring",
		back="Canny Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Pillager's Poulaines +1"}

	sets.defense.PDT = {ammo="Iron Gobbet",
		head="Pillager's Bonnet +1",neck="Twilight Torque",
		body="Plunderer's Vest +1",hands="Plunderer's Armlets +1",ring1="Patricius Ring",ring2=gear.DarkRing.physical,
		back="Repulse Mantle",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Iuitl Gaiters"}

	sets.defense.MDT = {ammo="Demonry Stone",
		head="Felistris Mask",neck="Twilight Torque",ear1="Mujin Stud",ear2="Sanara Earring",
		body="Plunderer's Vest +1",hands="Pillager's Armlets +1",ring1="Shadow Ring",ring2=gear.DarkRing.magical,
		back="Mubvumbamiri Mantle",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}


	--------------------------------------
	-- Melee sets
	--------------------------------------

	-- Normal melee group
	sets.engaged = {ammo="Qirmiz Tathlum",
		head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Plunderer's Vest +1",hands="Pillager's Armlets +1",ring1="Rajas Ring",ring2="Epona's Ring",
		back="Atheling Mantle",waist="Patentia Sash",legs="Quiahuiz Trousers",feet="Plunderer's Poulaines +1"}
	sets.engaged.Acc = {ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Iqabi Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Pillager's Vest +1",hands="Buremte Gloves",ring1="Patricius Ring",ring2="Mars's Ring",
		back="Canny Cape",waist="Anguinus Belt",legs="Plunderer's Culottes +1",feet="Qaaxo Leggings"}
		
	-- Mod set for trivial mobs (Skadi+1)
	sets.engaged.Mod = set_combine(sets.engaged,{body="Thaumas Coat"}

	-- Mod set for trivial mobs (Thaumas)
	sets.engaged.Mod2 = set_combine(sets.engaged,{body="Thaumas Coat"}

	sets.engaged.Evasion = {ammo="Qirmiz Tathlum",
		head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Qaaxo Harness",hands="Pillager's Armlets +1",ring1="Beeline Ring",ring2="Epona's Ring",
		back="Canny Cape",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}
	sets.engaged.Acc.Evasion = {ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Beeline Ring",ring2="Epona's Ring",
		back="Canny Cape",waist="Anguinus Belt",legs="Plunderer's Culottes +1",feet="Qaaxo Leggings"}

	sets.engaged.PDT = {ammo="Qirmiz Tathlum",
		head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Iuitl Vest",hands="Pillager's Armlets +1",ring1="Patricius Ring",ring2="Epona's Ring",
		back="Repulse Mantle",waist="Flume Belt",legs="Iuitl Tights",feet="Qaaxo Leggings"}
	sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
		head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Pillager's Vest +1",hands="Pillager's Armlets +1",ring1="Patricius Ring",ring2="Epona's Ring",
		back="Canny Cape",waist="Flume Belt",legs="Iuitl Tights",feet="Qaaxo Leggings"}

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = true
	end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.english == 'Aeolian Edge' and state.TreasureMode ~= 'None' then
		equip(sets.TreasureHunter)
	elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
		if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' then
			equip(sets.TreasureHunter)
		end
	end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if state.TreasureMode ~= 'None' and spell.action_type == 'Ranged Attack' then
		equip(sets.TreasureHunter)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
	end

	-- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
	if spell.type == 'WeaponSkill' and not spell.interrupted then
		state.Buff['Sneak Attack'] = false
		state.Buff['Trick Attack'] = false
		state.Buff['Feint'] = false
	end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
	-- If Feint is active, put that gear set on on top of regular gear.
	-- This includes overlaying SATA gear.
	check_buff('Feint', eventArgs)
end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
	local wsmode

	if state.Buff['Sneak Attack'] then
		wsmode = 'SA'
	end
	if state.Buff['Trick Attack'] then
		wsmode = (wsmode or '') .. 'TA'
	end

	return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
	-- Check that ranged slot is locked, if necessary
	check_range_lock()

	-- Check for SATA when equipping gear.  If either is active, equip
	-- that gear specifically, and block equipping default gear.
	check_buff('Sneak Attack', eventArgs)
	check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
	if player.hpp < 80 then
		idleSet = set_combine(idleSet, sets.ExtraRegen)
	end

	return idleSet
end


function customize_melee_set(meleeSet)
	if state.TreasureMode == 'Fulltime' then
		meleeSet = set_combine(meleeSet, sets.TreasureHunter)
	end

	return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for change events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		if not midaction() then
			handle_equipping_gear(player.status)
		end
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Various update events.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	th_update(cmdParams, eventArgs)
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local defenseString = ''
	if state.Defense.Active then
		local defMode = state.Defense.PhysicalMode
		if state.Defense.Type == 'Magical' then
			defMode = state.Defense.MagicalMode
		end

		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..'  '
	end

	add_to_chat(122,'Melee: '..state.OffenseMode..'/'..state.DefenseMode..'  WS: '..state.WeaponskillMode..'  '..
		defenseString..'Kiting: '..on_off_names[state.Kiting]..'  TH: '..state.TreasureMode)

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
	if state.Buff[buff_name] then
		equip(sets.buff[buff_name] or {})
		if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' then
			equip(sets.TreasureHunter)
		end
		eventArgs.handled = true
	end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
	if category == 2 or -- any ranged attack
		--category == 4 or -- any magic action
		(category == 3 and param == 30) or -- Aeolian Edge
		(category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
		(category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
		then return true
	end
end


-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
	if player.equipment.range ~= 'empty' then
		disable('range', 'ammo')
	else
		enable('range', 'ammo')
	end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(2, 5)
	elseif player.sub_job == 'WAR' then
		set_macro_page(3, 5)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 5)
	else
		set_macro_page(2, 5)
	end
end
