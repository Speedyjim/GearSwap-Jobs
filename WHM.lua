-- *** Original file from pastebin.com/u/Bokura *** --
-- Last Updated: 07/14/14 12:30 AM --

function get_sets()
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Kiting = 'ON' -- Set Default Sublimation Kiting ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	send_command('input /macro book 7;wait .1;input /macro set 1') -- Change Default Macro Book Here --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV","Cure V","Cure VI"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II","Curaga III","Curaga IV","Curaga V"} -- Curaga Degradation --
	Na_Spells = S{"Paralyna","Cursna","Silena","Poisona","Blindna","Viruna","Stona","Erase"}
	sc_map = {SC1 = "AfflatusSolace", SC2 = "Sublimation", SC3 = "LightArts"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
			head="Orison Cap +2",neck="Twilight Torque",
			ear1="Lifestorm Earring",ear2="Loquac. Earring",
			body="Piety Briault +1",hands="Serpentes Cuffs",
			ring1="Sangoma Ring",ring2="Bifrost Ring",back="Umbra Cape",
			waist="Witful Belt",legs="Nares Trews",feet="Serpentes Sabots"}
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			head="Orison Cap +2",neck="Colossus's Torque",
			ear1="Lifestorm Earring",ear2="Psystorm Earring",
			hands="Dynasty Mitts",
			ring1="Sangoma Ring",ring2="Bifrost Ring",
			back="Pahtli Cape",legs="Theo. Pant. +1",feet="Herald's Gaiters"})
	sets.Resting = set_combine(sets.Idle.Refresh,{main="Boonwell Staff",ammo="Clarus Stone",
			body="Piety Briault +1",neck="Jeweled Collar",
			ear2="Loquac. Earring",
			ring1="Angha Ring",ring2="Sangoma Ring",
            back="Vita Cape",waist="Austerity Belt"})

	-- PDT Set --
	sets.PDT = {
			main="Bolelabunga",sub="Genbu's Shield",
			neck="Twilight Torque",
			body="Gendewitha Bliaut",hands="Gendewitha Gages",
			ring1="Patricius Ring",
			ring2={name="Dark Ring",augments={"Magic Damage Taken -4%","Physical Damage Taken -6%"}},
			back="Umbra Cape",
			feet="Gende. Galoshes"}
			
	sets.MDT = set_combine(sets.PDT,{ammo="Sihirik",
	        head="Artsieq Hat",neck="Twilight Torque",
			ear1="Mujin Stud",ear2="Sanare Earring",
			body="Piety Briault +1",hands="Dynasty Mitts",
			ring1={name="Dark Ring",augments={"Magic Damage Taken -3%","Physical Damage Taken -5%"}},
			ring2={name="Dark Ring",augments={"Magic Damage Taken -4%","Physical Damage Taken -6%"}},	
            back="Tuilha Cape",legs="Theo. Pant. +1",feet="Piety Duckbills +1"})
			
	sets.Sublimation = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {ammo="Incantor Stone",
			head="Nahtirah Hat",neck="Orison Locket",ear2="Loquac. Earring",
			body="Hedera Cotehardie",hands="Gendewitha Gages",
			ring1="Prolix Ring",
			back="Swith Cape +1",waist="Witful Belt",
			legs="Artsieq Hose",feet="Chelona Boots +1"}

	-- Elemental Staves --
	sets.Precast.Light = {main='Chatoyant Staff'}

	-- Precast EnhancingMagic Set --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{hands="Dynasty Mitts",})

	-- Precast HealingMagic Set --
	sets.Precast['Healing Magic'] = set_combine(sets.Precast.FastCast,{legs="Orsn. Pantaln. +2"})

	-- Cure Precast Set --
	sets.Precast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
			head="Piety Cap",neck="Orison Locket",ear2="Loquac. Earring",
			body="Nefer Kalasiris",hands="Gendewitha Gages",
			ring1="Prolix Ring",back="Pahtli Cape",
			waist="Ninurta's Sash";legs="Artsieq Hose",feet="Litany Clogs"}
			
	-- Arise Precast Set --
    sets.Precast.Arise = set_combine(sets.Precast.FastCast,{})	

	-- Midcast Base Set --
	sets.Midcast = set_combine(sets.Precast.FastCast,{})

	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{})

	-- Cure Set --
	sets.Midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
			head="Theo. Cap +1",neck="Colossus's Torque",
			ear1="Lifestorm Earring",ear2="Orison Earring",
			body="Orison Bliaud +2",hands="Theo. Mitts +1",
			ring1="Sirona's Ring",ring2="Ephedra Ring",back="Tempered Cape",
			waist="Cascade Belt",legs="Orsn. Pantaln. +2",feet="Piety Duckbills +1"}

	-- Curaga Set --
	sets.Midcast.Curaga = {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens",
			head="Theo. Cap +1",neck="Nuna Gorget +1",
			ear1="Lifestorm Earring",ear2="Novia Earring",
			body="Gendewitha Bliaut",hands="Bokwus Gloves",
			ring1="Aquasoul Ring",ring2="Aquasoul Ring",back="Pahtli Cape",
			waist="Cascade Belt",legs="Orsn. Pantaln. +2",feet="Piety Duckbills +1"}

	-- EnhancingMagic Set --
	sets.Midcast['Enhancing Magic'] = set_combine(sets.Midcast.Haste,{main="Beneficus",sub="Genbu's Shield",
			head="Umuthi Hat",neck="Colossus's Torque",hands="Dynasty Mitts",
			waist="Cascade Belt",legs="Piety Pantaloons",feet="Orsn. Duckbills +2"})
			
	-- Shellra V Set --
	sets.Midcast.Shellra = set_combine(sets.Midcast.Haste,{
            legs="Piety Pantaloons"})
			
	-- Protectra V Set --
	sets.Midcast.Protectra = set_combine(sets.Midcast.Haste,{
            feet="Piety Duckbills +1"})			
			
	-- Arise Set --
    sets.Midcast.Arise = set_combine(sets.Midcast.Haste,{})	

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast.EnhancingMagic,{
	        neck="Stone Gorget"})

	-- Regen Set --
	sets.Midcast.Regen = set_combine(sets.Midcast.Haste,{
	        main="Bolelabunga",sub="Genbu's Shield",
			body="Piety Briault +1",hands="Orison Mitts +2",
			legs="Theo. Pant. +1",feet="Orsn. Duckbills +2"})

	-- Barspells Set --
	sets.Midcast.Bar = set_combine(sets.Midcast.EnhancingMagic,{
	        main="Beneficus",sub="Genbu's Shield",
			head="Orison Cap +2",body="Orison Bliaud +2",hands="Orison Mitts +2",
			legs="Piety Pantaloons",feet="Orsn. Duckbills +2"})

	-- Na Set --
	sets.Midcast.Na = set_combine(sets.Midcast.Haste,{
	        head="Orison Cap +2",legs="Orsn. Pantaln. +2"})

	-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{main="Beneficus",ammo="Impatiens",
            head="Orison Cap +2",neck="Malison Medallion",
			ring1="Ephedra Ring",ring2="Ephedra Ring",
			back="Mending Cape",legs="Theo. Pant. +1",feet="Gende. Galoshes"})

	-- DivineMagic Set --
	sets.Midcast['Divine Magic'] = {main="Baqil Staff",sub="Mephitis Grip",ammo="Kalboron Stone",
			head="Artsieq Hat",body="Hedera Cotehardie",hands="Clr. Mitts +2",
			ring1="Sangoma Ring",ring2="Angha Ring",
			back="Refraction Cape",
			legs="Theo. Pant. +1",feet="Artsieq Boots"}

	-- EnfeeblingMagic Set --
	sets.Midcast['Enfeebling Magic'] = {main="Baqil Staff",sub="Mephitis Grip",ammo="Kalboron Stone",
			head="Artsieq Hat",neck="Nuna Gorget +1",
			ear1="Lifestorm Earring",ear2="Psystorm Earring",
			body="Hedera Cotehardie",hands="Ayao's Gages", -- Piety Mitts +1
			ring1="Sangoma Ring",ring2="Angha Ring",
			back="Refraction Cape",waist="Witful Belt",
			legs="Mystagog Slacks",feet="Piety Duckbills +1"}

	-- DarkMagic Set --
	sets.Midcast['Dark Magic'] = set_combine(sets.Midcast['Enfeebling Magic'],{})

	-- Impact Set --
	sets.Midcast.Impact = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Benediction = {body="Piety Briault +1"}
	sets.JA.Devotion = {head="Piety Cap"}
	sets.JA["Afflatus Solace"] = {body="Orison Bliaud +2"}
	sets.JA["Divine Caress"] = {hands="Orison Mitts +2",back="Mending Cape"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{main="Bolelabunga",sub="Genbu's Shield"})

	-- WS Base Set --
	sets.WS = {}
	sets.WS["Hexa Strike"] = {}
	sets.WS.Realmrazer = {}
	sets.WS.Dagan = {}
	sets.WS["Mystic Boon"] = {}
	sets.WS.Randgrith = {}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif spell.english == "Rampart" then
		cancel_spell()
		send_command('input /ja Sacrosanctity <me>')
	elseif spell.english == "Dispel" and spell.target.type=="PLAYER" then
		cancel_spell()
		send_command('input /ma Sacrifice ' .. spell.target.name)
	elseif spell.english == "Dispel" and player.target.type=="PLAYER" then
		cancel_spell()
		send_command('input /ma Sacrifice ' .. player.target.name)
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		elseif sets.WS[spell.english] then
			equip(sets.WS[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and not Na_Spells:contains(spell.english) then
		equip(sets.Precast[spell.element])
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if Na_Spells:contains(spell.english) then
			equipSet = equipSet.Na
			if buffactive['Divine Caress'] then
				equipSet = set_combine(equipSet,{hands="Orison Mitts +2",back="Mending Cape"})
			end
		elseif string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
			if string.find(spell.english,'Cure') then
				if buffactive["Afflatus Solace"] then
					equipSet = equipSet.Cure
				else
					equipSet = equipSet.Curaga
				end
			elseif string.find(spell.english,'Cura') then
				equipSet = equipSet.Curaga
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist='Korin Obi'})
			end
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Bar') then
			equipSet = equipSet.Bar
		elseif string.find(spell.english,'Regen') then
			equipSet = equipSet.Regen
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet,{hands="Clr. Mitts +2"})
		elseif string.find(spell.english,'Reraise') then
			equipSet = equipSet.Haste
		elseif string.find(spell.english,'Arise') then
			equipSet = equipSet.Arise	
		elseif string.find(spell.english,'Raise') then
			equipSet = equipSet.Arise
        elseif string.find(spell.english,'Shellra') then
			equipSet = equipSet.Shellra
        elseif string.find(spell.english,'Protectra') then
			equipSet = equipSet.Protectra	
        elseif string.find(spell.english,'Haste') then
			equipSet = equipSet.EnhancingMagic			
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end 
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end 
	equip(equipSet)
end

function aftercast(spell,action)
	if (spell.english == "Repose" or spell.english == "Sleep II") and not spell.interrupted then
		send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
	elseif (spell.english == "Sleep" or spell.english == "Sleepga") and not spell.interrupted then
		send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
	elseif spell.english == "Banish III" and not spell.interrupted then
		send_command('wait 35;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
		if Kiting == 'ON' then
            equip({feet="Herald's Gaiters"})
		end				
	elseif Armor == 'MDT' then
        equip(sets.MDT)	
		if Kiting == 'ON' then
            equip({feet="Herald's Gaiters"})
		end
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
		if Kiting == 'ON' then
            equip({feet="Herald's Gaiters"})
		end
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Kiting Toggle --
		if Kiting == 'ON' then
			Kiting = 'OFF'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Kiting = 'ON'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C7' then
		if Armor == 'PDT' then -- PDT Toggle --
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then
		if Armor == 'MDT' then -- MDT Toggle --
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)	
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end
