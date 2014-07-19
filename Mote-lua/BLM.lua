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

end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    options.CastingModes = {'Normal', 'Resistant', 'Proc'}
    options.OffenseModes = {'None', 'Normal'}
    options.DefenseModes = {'Normal'}
    options.WeaponskillModes = {'Normal'}
    options.IdleModes = {'Normal', 'PDT'}
    options.RestingModes = {'Normal'}
    options.PhysicalDefenseModes = {'PDT'}
    options.MagicalDefenseModes = {'MDT'}

    state.Defense.PhysicalMode = 'PDT'
    state.OffenseMode = 'None'

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

    gear.macc_hagondes = {name="Hagondes Cuffs"}

	select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Impatiens",
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Hedera Cotehardie",hands="Hagondes Cuffs",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Artsieq Hose",feet="Chelona Boots +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal",head="Goetia Petasos +2"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens",
	        body="Nefer Kalasiris",ring2="Veneficium Ring",back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Hagondes Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Icesoul Ring",
        back="Refraction Cape",waist="Aswang Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = sets.precast.WS
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Colossus's Torque",ear1="Lifestorm Earring",
        hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist=gear.ElementalObi,legs="Nares Trews",feet="Umbani Boots"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {head="Umuthi Hat",neck="Colossus's Torque",hands="Ayao's Gages",}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {head="Umuthi Hat",neck="Stone Gorget"})

    sets.midcast['Enfeebling Magic'] = {main="Baqil Staff",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Artsieq Hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Spae. Coat +1",hands="Lurid Mitts",ring1="Angha Ring",ring2="Sangoma Ring",
        back="Bane Cape",waist="Aswang Sash",legs="Artsieq Hose",feet="Artsieq Boots"}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = set_combine(sets.midcast['Enfeebling Magic'],{feet="Goetia Sabots +2"})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'],{main="Bounty Sickle",
	        ear1="Hirudinea Earring",ear2="Gwati Earring",waist="Fucho-no-obi",}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {set_combine(sets.Midcast['Dark Magic'],{head="Nahtirah Hat",ear1="Loquac. Earring",ear2="Gwati Earring",
	    hands="Hagondes Cuffs",waist="Witful Belt",legs="Artsieq Hose",feet="Artsieq Boots"})}

    sets.midcast.BardSong = {}


    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'].LowTierNuke = {main="Kaladanda",sub="Wise Strap",ammo="Witchstone",
        head="Buremte Hat",neck="Eddy Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
        body="Spae. Coat +1",hands="Otomi Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist="Sekhmet Corset",legs="Hagondes Pants",feet="Umbani Boots"}

    sets.midcast['Elemental Magic'].Resistant = {main="Lehbrailg +2",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Hagondes Coat",hands=gear.macc_hagondes,ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Bokwus Boots"}

    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'].LowTierNuke,
	    {head="Hagondes Hat",body="Hagondes Coat",hands="Yaoyotl Gloves",back="Toro Cape",waist="Aswang Sash",feet="Hagondes Sabots"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].HighTierNuke,
	   {sub="Mephitis Grip",ammo="Kalboron Stone",head="Artsieq Hat",hands="Hagondes Cuffs",ear2="Gwati Earring",
	   ring2="Sangoma Ring",back="Bane Cape",feet="Artsieq Boots"})


    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main="Earth Staff", sub="Mephitis Grip",ammo="Impatiens",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Gwati Earring",ear2="Loquacious Earring",
        body="Manasa Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Nares Trews",feet="Chelona Boots +1"}


    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Boonwell Staff",ammo="Clarus Stone",neck="Jewelled Collar",
        body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Vita Cape",waist="Austerity Belt",legs="Nares Trews",feet="Serpentes Sabots"}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main="Bolelabunga",sub="Genbu's Shield",
	    head="Artsieq Hat",neck="Twilight Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
	    body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Patricius Ring",ring2=gear.DarkRing.physical,
		back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Serpentes Sabots"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
        head="Hagondes Hat",neck="Twilight Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Patricius Ring",ring2="Paguroidea Ring",
        back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Hagondes Sabots"}
    
    -- Town gear.
    sets.idle.Town = {main="Kaladanda",sub="Mephitis Grip",ammo="Witchstone",
		head="Artsieq Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Novio Earring",
		body="Spae. Coat +1",hands="Otomi Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
		back="Toro Cape",waist="Aswang Sash",legs="Hagondes Pants",feet="Herald's Gaiters"}
        
    -- Defense sets

    sets.defense.PDT = {main="Earth Staff",sub="Mephitis Grip",
		head="Hagondes Hat",neck="Twilight Torque",body="Hagondes Coat",hands="Hagondes Cuffs",
		ring1="Patricius Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.defense.MDT = set_combine(sets.defense.PDT,{ammo="Sihirik",
		head="Nahtirah Hat",ear1="Sanare Earring",ear2="Mujin Stud",body="Spae. Coat +1",
		hands="Yaoyotl Gloves",ring1="Shadow Ring",back="Tuilha Cape",feet="Umbani Boots"})

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}
    

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Umbra Cape",waist="Windbuffet Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sekhmet Corset"
        if state.CastingMode == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Elemental Magic' and state.CastingMode == 'Proc' then
            add_to_chat(15,'Proc mode, no damage gear for midcast.')
            eventArgs.handled = true
        end
    end
end


function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted and spell.english == 'Mana Wall' then
        enable('feet')
        equip(sets.buff['Mana Wall'])
        disable('feet')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        -- No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end


-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

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


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local meleeString = ''
    if state.OffenseMode == 'Normal' then
        meleeString = 'Melee: Weapons locked, '
    end
    
    local defenseString = ''
    if state.Defense.Active then
        local defMode = state.Defense.PhysicalMode
        if state.Defense.Type == 'Magical' then
            defMode = state.Defense.MagicalMode
        end

        defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
    end

    add_to_chat(122,meleeString..'Casting ['..state.CastingMode..'], Idle ['..state.IdleMode..'], '..defenseString..
        'Kiting: '..on_off_names[state.Kiting])

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 6)
end
