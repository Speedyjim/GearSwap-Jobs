-- *** Original file from pastebin.com/u/Bokura *** --
-- Last Updated: 07/14/14 12:30 AM *Changed JA Names* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	StunIndex = 0
	Obi = 'OFF' -- Turn Default Obi ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	send_command('input /macro book 6;wait .1;input /macro set 1') -- Change Default Macro Book Here --

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix'}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	
	sc_map = {SC1 = "Stun", SC2 = "DarkArts", SC3 = "LightArts"} --	3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
		'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
		'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
		'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
		'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
	
	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = set_combine(sets.Idle.Movement,{
			main="Bolelabunga",sub="Genbu's Shield",
			head="Artsieq Hat",neck="Twilight Torque",
			ear1="Lifestorm Earring",ear2="Loquac. Earring",
			body="Hagondes Coat",hands="Serpentes Cuffs",
			ring1="Dark Ring",ring2="Dark Ring",
			back="Umbra Cape",waist="Witful Belt",
			legs="Nares Trews",feet="Serpentes Sabots"})
	sets.Idle.Movement = {main="Kaladanda",sub="Mephitis Grip",ammo="Witchstone",
			head="Artsieq Hat",neck="Eddy Necklace",
			ear1="Friomisi Earring",ear2="Novio Earring",
			body="Spae. Coat +1",hands="Otomi Gloves",
			ring1="Strendu Ring",ring2="Acumen Ring",
			back="Toro Cape",waist="Aswang Sash",
			legs="Hagondes Pants",feet="Herald's Gaiters"}
	sets.Resting = set_combine(sets.Idle.Refresh,{
	        main="Boonwell Staff",sub="Mephitis Grip",ammo="Clarus Stone",
			neck="Jeweled Collar",
			ring1="Angha Ring",back="Vita Cape",
			waist="Austerity Belt",feet="Chelona Boots +1"})

	-- PDT Set --
	sets.PDT = {main="Earth Staff",
	        sub="Mephitis Grip",
			head="Hagondes Hat",neck="Twilight Torque",
			body="Hagondes Coat",hands="Hagondes Cuffs",
			ring1="Patricius Ring",
			ring2={name="Dark Ring",augments={"Magic Damage Taken -4%","Physical Damage Taken -6%"}},
			back="Umbra Cape",
			legs="Hagondes Pants",feet="Hagondes Sabots"}

	sets.MDT = set_combine(sets.PDT,{
			ammo="Sihirik",
			head="Nahtirah Hat",neck="Twilight Torque",
			ear1="Sanare Earring",ear2="Mujin Stud",
			body="Spae. Coat +1",hands="Yaoyotl Gloves",
			ring1="Shadow Ring",
			ring2={name="Dark Ring",augments={"Magic Damage Taken -4%","Physical Damage Taken -6%"}},
			back="Tuilha Cape",waist="Slipor Sash",
			legs="Hagondes Pants",feet="Umbani Boots"})

	sets.Precast = {}

	-- Fastcast Set --
	sets.Precast.FastCast = {
			head="Nahtirah Hat",
			ear2="Loquac. Earring",body="Hedera Cotehardie",
			ring2="Prolix Ring",
			back="Swith Cape +1",waist="Ninurta's Sash",
			legs="Artsieq Hose",feet="Chelona Boots +1"}
	
	sets.Precast['Elemental Magic'] = {
	        head="Goetia Petasos +2",neck="Stoicheion Medal",}	

	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Cure Set --
	sets.Precast.Cure = {
	        ammo="Impatiens",head="Nahtirah Hat",
			ear2="Loquac. Earring",body="Nefer Kalasiris",
			ring1="Veneficium Ring",ring2="Prolix Ring",
			back="Pahtli Cape",waist="Ninurta's Sash",
			legs="Artsieq Hose",feet="Chelona Boots +1"}	

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{})

	-- Cure Set --
	sets.Midcast.Cure = {main="Tamaxchi",
	    sub="Genbu's Shield",ammo="Impatiens",
		head="Nahtirah Hat",neck="Colossus's Torque",
		ear1="Lifestorm Earring",ear2="Loquacious Earring",
		body="Nefer Kalasiris",hands="Bokwus Gloves",
		ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Pahtli Cape",waist="Witful Belt",
		legs="Nares Trews",feet="Umbani Boots"}

	-- Curaga Set --
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure,{})

	-- EnhancingMagic Set --
	sets.Midcast['Enhancing Magic'] = {
	        ammo="Impatiens",
			head="Umuthi Hat",neck="Colossus's Torque",
			ear1="Loquac. Earring",hands="Ayao's Gages",
			ring1="Prolix Ring",ring2="Veneficium Ring",
			back="Ogapepo Cape",waist="Witful Belt"}
			
	sets.Midcast.Warp = set_combine(sets.Precast.FastCast,{ammo="Impatiens",back="Ogapepo Cape",ring1="Veneficium Ring"})		

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast.EnhancingMagic,{
			head="Umuthi Hat",neck="Stone Gorget"})

	-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			head="Nahtirah Hat",neck="Colossus's Torque",
			body="Hedera Cotehardie",hands="Bokwus Gloves",
			ring1="Ephedra Ring",ring2="Ephedra Ring",
			back="Bane Cape",waist="Ninurta's Sash",
			legs="Artsieq Hose",feet="Hagondes Sabots"})

	-- Stun Sets --
	sets.Midcast.Stun = {main="Kaladanda",
			sub="Mephitis Grip",ammo="Impatiens",
			head="Artsieq Hat",neck="Eddy Necklace",
			ear1="Lifestorm Earring",ear2="Psystorm Earring",
			body="Hedera Cotehardie",hands="Hagondes Cuffs",
			ring1="Veneficium Ring",ring2="Sangoma Ring",
			back="Swith Cape +1",waist="Witful Belt",
			legs="Artsieq Hose",feet="Artsieq Boots"}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- DarkMagic Sets --
	sets.Midcast['Dark Magic'] = {main="Kaladanda",
	        sub="Mephitis Grip",ammo="Impatiens",
	        head="Artsieq Hat",neck="Eddy Necklace",
			ear1="Lifestorm Earring",ear2="Psystorm Earring",
			body="Hedera Cotehardie",hands="Hagondes Cuffs",
			ring1="Veneficium Ring",ring2="Sangoma Ring",
			back="Ogapepo Cape",waist="Witful Belt",
			legs="Artsieq Hose",feet="Goetia Sabots +2"}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{})
	
	-- Drain Aspir Sets --
	
	sets.Midcast.Drain = {main="Bounty Sickle",
	        sub="Mephitis Grip",ammo="Impatiens",
	        head="Artsieq Hat",neck="Eddy Necklace",
			ear1="Hirudinea Earring",ear2="Loquac. Earring",
			body="Hedera Cotehardie",hands="Hagondes Cuffs",
			ring1="Veneficium Ring",ring2="Sangoma Ring",
			back="Ogapepo Cape",waist="Fucho-no-obi",
			legs="Artsieq Hose",feet="Goetia Sabots +2"}
	
	sets.Midcast.Aspir = set_combine(sets.Midcast.Drain,{})

	-- Elemental Sets --
	sets.Midcast.LowTierNukes = {main="Kaladanda",
			sub="Wise Strap", -- Zuuxowu Grip
			ammo="Witchstone", -- Dosis Tathlum
			head="Buremte Hat",
			neck="Eddy Necklace",ear1="Friomisi Earring", 
			ear2="Novio Earring", -- Crematio Earring
			body="Spae. Coat +1",hands="Otomi Gloves",
			ring1="Strendu Ring",ring2="Acumen Ring",
			back="Bane Cape",waist="Sekhmet Corset",legs="Hagondes Pants",feet="Umbani Boots"}
	sets.Midcast['Elemental Magic'] = {main="Kaladanda",
			sub="Wise Strap",ammo="Witchstone",
			head="Hagondes Hat",neck="Eddy Necklace",
			ear1="Friomisi Earring",ear2="Novio Earring",
			body="Hagondes Coat",hands="Yaoyotl Gloves",
			ring1="Strendu Ring",ring2="Acumen Ring",
			back="Toro Cape",waist="Aswang Sash",
			legs="Hagondes Pants",feet="Hagondes Sabots"}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{
	        sub="Mephitis Grip",ammo="Kalboron Stone",
			head="Artsieq Hat",hands="Hagondes Cuffs",
			ear1="Lifestorm Earring",ear2="Psystorm Earring",
			ring2="Sangoma Ring",
			back="Bane Cape",feet="Artsieq Boots"})
	sets.Abyssea = {body='Spae. Coat +1'}	

	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {main="Kaladanda",
	        sub="Mephitis Grip",ammo="Kalboron Stone",
			head="Artsieq Hat",neck="Eddy Necklace",
			ear1="Lifestorm Earring",ear2="Psystorm Earring",
			body="Spae. Coat +1",hands="Hagondes Cuffs",
			ring1="Angha Ring",ring2="Sangoma Ring",
			back="Bane Cape",waist="Aswang Sash",
			legs="Artsieq Hose",feet="Artsieq Boots"}
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{})
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{})

	-- Impact Set --
	sets.Midcast.Impact = {main="Kaladanda",
			sub="Mephitis Grip",ammo="Kalboron Stone",
			neck="Eddy Necklace",
			ear1="Lifestorm Earring",ear2="Psystorm Earring",
			body="Twilight Cloak",hands="Hagondes Cuffs",
			ring1="Angha Ring",ring2="Sangoma Ring",
			back="Refraction Cape",waist="Demonry Sash",
			legs="Mes'yohi Slacks",feet="Nares Clogs"}

	-- Meteor Set --
	sets.Midcast.Meteor = set_combine(sets.Midcast['Elemental Magic'],{})

	-- Elemental Obi/Twilight Cape --
	sets.Obis = {}
    sets.Obis.Fire = {back='Twilight Cape',lring='Zodiac Ring'}
    sets.Obis.Earth = {back='Twilight Cape',lring='Zodiac Ring'}
    sets.Obis.Water = {back='Twilight Cape',lring='Zodiac Ring'}
    sets.Obis.Wind = {waist='Furin Obi',back='Twilight Cape',lring='Zodiac Ring'}
    sets.Obis.Ice = {waist='Hyorin Obi',back='Twilight Cape',lring='Zodiac Ring'}
    sets.Obis.Lightning = {waist='Rairin Obi',back='Twilight Cape',lring='Zodiac Ring'}
    sets.Obis.Light = {waist='Korin Obi',back='Twilight Cape',lring='Zodiac Ring'}
    sets.Obis.Dark = {waist='Anrin Obi',back='Twilight Cape',lring='Zodiac Ring'}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Manafont = {body="Src. Coat +2"}
	sets.JA['Enmity Douse'] = {hands="Goetia Gloves +2"}
	sets.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- WS Base Set --
	sets.WS = {}
	sets.WS.Shattersoul = {}
	sets.WS.Myrkr = {}
	sets.WS.Vidohunir = {}
	sets.WS["Gate of Tartarus"] = {}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif spell.english == "Meteor" and not buffactive['Elemental Seal'] then -- Auto Elemental Seal When You Use Meteor --
		cancel_spell()
		send_command('input /ja "Elemental Seal" <me>;wait 1;input /ma "Meteor" <t>')
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
					add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
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
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] then
		equip(sets.Precast[spell.element])
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
	if Abyssea == 1 then
		equip(sets.Abyssea)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' or spell.type == 'BardSong' then
		equipSet = sets.Midcast
		if LowTierNukes[spell.english] then
        equipSet = sets.Midcast.LowTierNukes
		end
		if string.find(spell.english,'Cura') then
			equipSet = equipSet.Curaga
		elseif string.find(spell.english,'Cure') then
			equipSet = equipSet.Cure
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
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			if (spell.skill == 'ElementalMagic' or string.find(spell.english,'Cur') or string.find(spell.english,'Bio')) and not Non_Obi_Spells:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' then -- Use Obi Toggle To Equip Normal Waist Gear --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
	if AbysseaIndex == 1 then
		equip(sets.Abyssea)
	end
end

function aftercast(spell,action)
	if spell.english == 'Mana Wall' and player.equipment.feet == "Goetia Sabots +2" and not spell.interrupted then
		disable('feet')
	elseif (spell.english == "Sleep II" or spell.english == "Sleepga II") and not spell.interrupted then -- Sleep II & Sleepga II Countdown --
		send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
	elseif (spell.english == "Sleep" or spell.english == "Sleepga") and not spell.interrupted then -- Sleep & Sleepga Countdown --
		send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
	elseif spell.english == "Banish II" and not spell.interrupted then -- Banish II Countdown --
		send_command('wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
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
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
	if Abyssea == 1 then
		equip(sets.Abyssea)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "mana wall" and not gain then
		enable('feet')
	elseif buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
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
    if command == 'C3' then -- Kiting Toggle --
		if Kiting == 'ON' then
			Kiting = 'OFF'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Kiting = 'ON'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Abyssea Toggle --
		if Abyssea == 'ON' then
			Abyssea = 'OFF'
			add_to_chat(123,'Abyssea: [OFF]')
		else
			Abyssea = 'ON'
			add_to_chat(158,'Abyssea: [ON]')
		end
		status_change(player.status)	
	elseif command == 'C1' then -- Magic Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Magic Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Stun Toggle --
		if StunIndex == 1 then
			StunIndex = 0
			add_to_chat(123,'Stun Set: [Unlocked]')
		else
			StunIndex = 1
			add_to_chat(158,'Stun Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
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

function weathercheck(spell_element,set)
    if spell_element == world.weather_element or spell_element == world.day_element then
        equip(set,sets.Obis[spell_element])
    else
        equip(set)
    end
    if set[spell_element] then equip(set[spell_element]) end
end
