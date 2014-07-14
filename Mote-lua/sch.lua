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

--[[
		Custom commands:

		Shorthand versions for each strategem type that uses the version appropriate for
		the current Arts.

										Light Arts              Dark Arts

		gs c scholar cost               Penury                  Parsimony
		gs c scholar speed              Celerity                Alacrity
		gs c scholar aoe                Accession               Manifestation
		gs c scholar power              Rapture                 Ebullience
		gs c scholar duration           Perpetuance
		gs c scholar accuracy           Altruism                Focalization
		gs c scholar enmity             Tranquility             Equanimity
		gs c scholar skillchain                                 Immanence
		gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
		"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

	state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
	update_active_strategems()
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	options.CastingModes = {'Normal', 'Resistant'}
	options.OffenseModes = {'None', 'Normal'}
	options.DefenseModes = {'Normal'}
	options.WeaponskillModes = {'Normal'}
	options.IdleModes = {'Normal', 'Town', 'Field'}
	options.RestingModes = {'Normal'}
	options.PhysicalDefenseModes = {'PDT'}
	options.MagicalDefenseModes = {'MDT'}

	state.OffenseMode = 'None'
	state.Defense.PhysicalMode = 'PDT'

	info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
	info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
					   "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
					   "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",}
	info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

	gear.macc_hagondes = {name="Hagondes Cuffs"}

	send_command('bind ^` input /ma Stun <t>')
	send_command('bind delete input /ja Light Arts <me>')
	send_command('bind Home input /ja Perpetuance <me>')
	send_command('bind End input /ja Accession <me>')

	-- Default macro set/book
	if player.sub_job == 'RDM' then
		set_macro_page(1, 8)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 8)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 8)
	else
		set_macro_page(1, 8)
	end
end

function job_file_unload()
	send_command('unbind ^`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Precast sets to enhance JAs

	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}


	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Incantor Stone",
		head="Nahtirah Hat",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
		back="Swith Cape +1",waist="Ninurta's Sash",legs="Artsieq Hose",feet="Chelona Boots +1"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {head="Paean Mitra",body="Nefer Kalasiris",back="Pahtli Cape"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})


	-- Midcast Sets

	sets.midcast.FastRecast = {ammo="Incantor Stone",
		head="Nahtirah Hat",ear2="Loquacious Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
		back="Swith Cape +1",waist="Ninurta's Sash",legs="Artsieq Hose",feet="Academic's Loafers"}

	sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Colossus's Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Nefer Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Tempered Cape",waist="Cascade Belt",legs="Nares Trews",feet="Academic's Loafers"}

	sets.midcast.CureWithLightWeather = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Colossus's Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Nefer Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Twilight Cape",waist="Korin Obi",legs="Nares Trews",feet="Academic's Loafers"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Regen = {main="Bolelabunga",head="Savant's Bonnet +2"}

	sets.midcast.Cursna = {
		neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",feet="Gendewitha Galoshes"}

	sets.midcast['Enhancing Magic'] = {ammo="Savant's Treatise",
		head="Umuthi Hat",neck="Colossus's Torque",body="Pedagogy Gown +1",hands="Ayao's Gages",
		waist="Cascade Belt", legs="Academic's Pants"} --legs="Portent Pants"

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {head="Umuthi Hat",neck="Stone Gorget"})

	sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})

	sets.midcast.Protect = {ring1="Sheltered Ring"}
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = {ring1="Sheltered Ring"}
	sets.midcast.Shellra = sets.midcast.Shell


	-- Custom spell classes
	sets.midcast.MndEnfeebles = {main="Baqil Staff",sub="Mephitis Grip",ammo="Kalboron Stone",
		head="Artsieq Hat",neck="Nuna Gorget +1",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Hedera Cotehardie",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Cascade Belt",legs="Artsieq Hose",feet="Artsieq Boots"}

	sets.midcast.IntEnfeebles = {main="Baqil Staff",sub="Mephitis Grip",ammo="Kalboron Stone",
		head="Artsieq Hat",neck="Enfeebling Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Hedera Cotehardie",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Aswang Sash",legs="Artsieq Hose",feet="Artsieq Boots"}

	sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

	sets.midcast['Dark Magic'] = {main="Baqil Staff",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Hedera Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
		back="Bookworm's Cape",waist="Fucho-no-obi",legs="Artsieq Hose",feet="Artsieq Boots"}

	sets.midcast.Kaustra = {main="Baqil Staff",sub="Wise Strap",ammo="Witchstone",
		head="Hagondes Hat",neck="Eddy Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Acumen Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Aswang Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.midcast.Drain = {main="Baqil Staff",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Eddy Necklace",ear1="Hirudinea Earring",ear2="Loquacious Earring",
		body="Hedera Cotehardie",hands="Hagondes Cuffs",ring1="Strendu Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Fucho-no-obi",legs="Artsieq Hose",feet="Academic's Loafers"}

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {main="Baqil Staff",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Pedagogy Mortarboard",neck="Eddy Necklace",ear1="Gwati Earring",ear2="Loquac. Earring",
		body="Hedera Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Sangoma Ring",
		back="Swith Cape +1",waist="Ninurta's Sash",legs="Artsieq Hose",feet="Academic's Loafers"}

	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Baqil Staff"})


	-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast['Elemental Magic'] = {main="Baqil Staff",sub="Wise Strap",ammo="Whichstone",
		head="Hagondes Hat",neck="Eddy Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Otomi Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
		back="Bookworm's Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Umbani Boots"}

	sets.midcast['Elemental Magic'].Resistant = {main="Baqil Staff",sub="Mephitis Grip",ammo="Whichstone",
		head="Hagondes Hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Hagondes Coat",hands=gear.macc_hagondes,ring1="Strendu Ring",ring2="Acumen Ring",
		back="Bookworm's Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Artsieq Boots"}

	-- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {hands="Yaoyotl Gloves",feet="Hagondes Sabots",back="Toro Cape"})

	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})

	sets.midcast.Impact = {main="Baqil Staff",sub="Mephitis Grip",ammo="Kalboron Stone",
		head=empty,neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Twilight Cloak",hands=gear.macc_hagondes,ring1="Angha Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Aswang Sash",legs="Artsieq Hose",feet="Artsieq Boots"}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {main="Boonwell Staff",sub="Mephitis Grip",ammo="Clarus Stone",
		neck="Jeweled Collar",neck="Wiglen Gorget",
		body="Gendewitha Bliaut",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Vita Cape",waist="Austerity Belt",legs="Nares Trews",feet="Serpentes Sabots"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Pedagogy Mortarboard",neck="Colossus's Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Pedagogy Gown +1",hands="Hagondes Cuffs",ring1="Sangoma Ring",ring2="Bifrost Ring",
		back="Bookworm's Cape",waist="Witful Belt",legs="Artsieq Hose",feet="Herald's Gaiters"}

	sets.idle.Field = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Pedagogy Mortarboard",neck="Wiglen Gorget",ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Gendewitha Bliaut",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Serpentes Sabots"}

	sets.idle.Field.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
		back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Herald's Gaiters"}

	sets.idle.Field.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Sangoma Ring",
		back="Swith Cape +1",waist="Ninurta's Sash",legs="Bokwus Slops",feet="Academic's Loafers"}

	sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Meridian Ring",
		back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Herald's Gaiters"}

	-- Defense sets

	sets.defense.PDT = {main=gear.Staff.PDT,sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Twilight Torque",ring1="Patricius Ring",ring2=gear.DarkRing.physical,
		back="Umbra Cape",legs="Hagondes Pants",feet="Gendewitha Galoshes"}

	sets.defense.MDT = {main=gear.Staff.PDT,sub="Mephitis Grip",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Twilight Torque",
		body="Pedagogy Gown +1",hands="Yaoyotl Gloves",ring1=gear.DarkRing.magical,ring2="Shadow Ring",
		back="Tuilha Cape",legs="Artsieq Hose",feet="Artsieq Boots"}

	sets.Kiting = {feet="Herald's Gaiters"}

	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		head="Zelus Tiara",
		body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Rajas Ring",
		waist="Ninurta's Sash",legs="Hagondes Pants",feet="Hagondes Sabots"}



	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Ebullience'] = {head="Savant's Bonnet +2"}
	sets.buff['Rapture'] = {head="Savant's Bonnet +2"}
	sets.buff['Perpetuance'] = {hands="Savant's Bracers +2"}
	sets.buff['Immanence'] = {hands="Savant's Bracers +2"}
	sets.buff['Penury'] = {legs="Savant's Pants +2"}
	sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
	sets.buff['Alacrity'] = {head="Nahtirah Hat",feet="Chelona Boots +1"}

	sets.buff['Klimaform'] = {feet="Savant's Loafers +2"}

	sets.buff.FullSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring",body="Pedagogy Gown +1"}
	sets.buff.PDTSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring"}

	--sets.buff['Sandstorm'] = {feet="Desert Boots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = true
	end
end

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
	end
end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
	if spell.action_type == 'Magic' then
		if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
			if world.weather_element == 'Light' then
				return 'CureWithLightWeather'
			end
		elseif spell.skill == 'Enfeebling Magic' then
			if spell.type == 'WhiteMagic' then
				return 'MndEnfeebles'
			else
				return 'IntEnfeebles'
			end
		elseif spell.skill == 'Elemental Magic' then
			if info.low_nukes:contains(spell.english) then
				return 'LowTierNuke'
			elseif info.mid_nukes:contains(spell.english) then
				return 'MidTierNuke'
			elseif info.high_nukes:contains(spell.english) then
				return 'HighTierNuke'
			end
		end
	end
end

function customize_idle_set(idleSet)
	if state.Buff['Sublimation: Activated'] then
		if state.IdleMode == 'Normal' then
			idleSet = set_combine(idleSet, sets.buff.FullSublimation)
		elseif state.IdleMode == 'PDT' then
			idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
		end
	end

	if player.mpp < 51 then
		idleSet = set_combine(idleSet, sets.latent_refresh)
	end

	return idleSet
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
	end

	if buff == "Sublimation: Activated" then
		handle_equipping_gear(player.status)
	end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
	if stateField == 'OffenseMode' then
		if newValue == 'Normal' then
			disable('main','sub')
		else
			enable('main','sub')
		end
	elseif stateField == 'Reset' then
		if state.OffenseMode == 'None' then
			enable('main','sub')
		end
	end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
	if cmdParams[1]:lower() == 'scholar' then
		handle_strategems(cmdParams)
		eventArgs.handled = true
	end
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
					   buffactive['addendum: white'] or buffactive['addendum: black']) then
		if state.IdleMode == 'Stun' then
			send_command('@input /ja "Dark Arts" <me>')
		else
			send_command('@input /ja "Light Arts" <me>')
		end
	end

	update_active_strategems()
	update_sublimation()
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

		defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
	end

	local meleeString = ''
	if state.OffenseMode == 'Normal' then
		meleeString = 'Melee: Weapons locked, '
	end

	add_to_chat(122,'Casting ['..state.CastingMode..'], '..meleeString..'Idle ['..state.IdleMode..'], '..defenseString..
		'Kiting: '..on_off_names[state.Kiting])

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
	state.Buff['Ebullience'] = buffactive['Ebullience'] or false
	state.Buff['Rapture'] = buffactive['Rapture'] or false
	state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
	state.Buff['Immanence'] = buffactive['Immanence'] or false
	state.Buff['Penury'] = buffactive['Penury'] or false
	state.Buff['Parsimony'] = buffactive['Parsimony'] or false
	state.Buff['Celerity'] = buffactive['Celerity'] or false
	state.Buff['Alacrity'] = buffactive['Alacrity'] or false

	state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
	state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
	if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
		equip(sets.buff['Perpetuance'])
	end
	if state.Buff.Alacrity and spell.english == "Stun" then
	    equip(sets.buff['Alacrity'])
	end	
	if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
		equip(sets.buff['Rapture'])
	end
	if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
		if state.Buff.Ebullience and spell.english ~= 'Impact' then
			equip(sets.buff['Ebullience'])
		end
		if state.Buff.Immanence then
			equip(sets.buff['Immanence'])
		end
		if state.Buff.Klimaform and spell.element == world.weather_element then
			equip(sets.buff['Klimaform'])
		end
	end

	if state.Buff.Penury then equip(sets.buff['Penury']) end
	if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
	if state.Buff.Celerity then equip(sets.buff['Celerity']) end
	if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
	-- cmdParams[1] == 'scholar'
	-- cmdParams[2] == strategem to use

	if not cmdParams[2] then
		add_to_chat(123,'Error: No strategem command given.')
		return
	end
	local strategem = cmdParams[2]:lower()

	if buffactive['light arts'] or buffactive['addendum: white'] then
		if strategem == 'cost' then
			send_command('@input /ja Penury <me>')
		elseif strategem == 'speed' then
			send_command('@input /ja Celerity <me>')
		elseif strategem == 'aoe' then
			send_command('@input /ja Accession <me>')
		elseif strategem == 'power' then
			send_command('@input /ja Rapture <me>')
		elseif strategem == 'duration' then
			send_command('@input /ja Perpetuance <me>')
		elseif strategem == 'accuracy' then
			send_command('@input /ja Altruism <me>')
		elseif strategem == 'enmity' then
			send_command('@input /ja Tranquility <me>')
		elseif strategem == 'skillchain' then
			add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
		elseif strategem == 'addendum' then
			send_command('@input /ja "Addendum: White" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	elseif buffactive['dark arts']  or buffactive['addendum: black'] then
		if strategem == 'cost' then
			send_command('@input /ja Parsimony <me>')
		elseif strategem == 'speed' then
			send_command('@input /ja Alacrity <me>')
		elseif strategem == 'aoe' then
			send_command('@input /ja Manifestation <me>')
		elseif strategem == 'power' then
			send_command('@input /ja Ebullience <me>')
		elseif strategem == 'duration' then
			add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
		elseif strategem == 'accuracy' then
			send_command('@input /ja Focalization <me>')
		elseif strategem == 'enmity' then
			send_command('@input /ja Equanimity <me>')
		elseif strategem == 'skillchain' then
			send_command('@input /ja Immanence <me>')
		elseif strategem == 'addendum' then
			send_command('@input /ja "Addendum: Black" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	else
		add_to_chat(123,'No arts has been activated yet.')
	end
end


-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
	-- returns recast in seconds.
	local allRecasts = windower.ffxi.get_ability_recasts()
	local stratsRecast = allRecasts[231]

	local maxStrategems

	if player.main_job_level >= 90 then
		maxStrategems = 5
	elseif player.main_job_level >= 70 then
		maxStrategems = 4
	elseif player.main_job_level >= 50 then
		maxStrategems = 3
	elseif player.main_job_level >= 30 then
		maxStrategems = 2
	elseif player.main_job_level >= 10 then
		maxStrategems = 1
	else
		maxStrategems = 0
	end

	local fullRechargeTime = 4*60

	local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)

	return currentCharges
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 17)
end
