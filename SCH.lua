-- *** Original file from pastebin.com/u/Bokura *** --
-- Last Updated: 08/10/14 *Updated Gear Sets* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	StunIndex = 0
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix'}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "LightArts", SC2 = "Perpetuance", SC3 = "Accession"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle Sets --
	sets.Idle = {}
	sets.Idle.Refresh = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
			head="Peda. M.Board +1",neck="Colossus's Torque",ear1="Lifestorm Earring",ear2="Loquac. Earring",
			body="Artsieq Jubbah",hands="Serpentes Cuffs",ring1="Sangoma Ring",ring2="Bifrost Ring",
			back="Umbra Cape",waist="Fucho-no-Obi",legs="Nares Trews",feet="Serpentes Sabots"}
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			head="Peda. M.Board +1",neck="Colossus's Torque",ear2="Psystorm Earring",
			body="Pedagogy Gown +1",hands="Lurid Mitts",
			back="Bookworm's Cape",legs="Acad. Pants +1",feet="Herald's Gaiters"})
	sets.Resting = set_combine(sets.Idle.Refresh,{main="Chatoyant Staff"})

	-- PDT Set --
	sets.PDT = {}

	sets.Sublimation = set_combine(sets.Idle.Refresh,{head="Acad. Mortarboard",ear1="Savant's Earring",body="Pedagogy Gown +1"})

	sets.Precast = {}
	-- Fastcast Sets --
	sets.Precast.FastCast = {ammo="Incantor Stone",
	        head="Nahtirah Hat",ear2="Loquac. Earring",body="Hedera Cotehardie",
			hands="Gendewitha Gages",ring2="Prolix Ring",back="Swith Cape +1",
			waist="Witful Belt",legs="Artsieq Hose",feet="Peda. Loafers +1"}

	-- Elemental Staves --

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{})

	-- Precast Cure Set --
	sets.Precast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens",
			head="Paean Mitra",neck="Colossus's Torque",ear2="Loquac. Earring",
			body="Nefer Kalasiris",hands="Gendewitha Gages",ring1="Prolix Ring",
			back="Pahtli Cape",waist="Witful Belt";legs="Artsieq Hose",feet="Peda. Loafers +1"}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{})

	-- Cure Set --
	sets.Midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
			head="Gende. Caubeen",neck="Colossus's Torque",ear1="Lifestorm Earring",ear2="Loquac. Earring",
			body="Peda. Gown +1",hands="Pedagogy Bracers",ring1="Sirona's Ring",ring2="Ephedra Ring",
			back="Tempered Cape",waist="Cascade Belt",legs="Acad. Pants +1",feet="Peda. Loafers +1"}
			
	-- Light Weather Cure --
    sets.Midcast.Cure.Weather = set_combine(sets.Midcast.Cure,{main="Chatoyant Staff",sub="Curatio Grip",back="Twilight Cape"})	

	-- Curaga Set --
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure,{neck="Nuna Gorget +1",ring1="Aquasoul Ring",ring2="Aquasoul Ring",})

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {ammo="Savant's Treatise",
	        head="Umuthi Hat",neck="Colossus's Torque",ear1="Andoaa Earring",
			body="Pedagogy Gown +1",hands="Ayao's Gages",waist="Cascade Belt"}

	-- Stoneskin --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{head="Umuthi Hat",neck="Stone Gorget"})

	-- Cursna --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{ammo="Impatiens",neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",
			back="Ogapepo Cape",waist="Witful Belt",feet="Gende. Galoshes"})

	-- Stun Sets --
	sets.Midcast.Stun = {main="Baqil Staff",sub="Mephitis Grip",ammo="Incantor Stone",
			head="Peda. M.Board +1",neck="Eddy Necklace",ear1="Gwati Earring",ear2="Loquac. Earring",
			body="Hedera Cotehardie",hands="Gendewitha Gages",ring1="Sangoma Ring",ring2="Prolix Ring",
			back="Swith Cape +1",waist="Ninurta's Sash",legs="Artsieq Hose",feet="Acad. Loafers"}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {main="Baqil Staff",sub="Mephitis Grip",ammo="Impatiens",
		head="Artsieq Hat",neck="Eddy Necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Hedera Cotehardie",hands="Yaoyotl Gloves",ring1="Perception Ring",ring2="Sangoma Ring",
		back="Bookworm's Cape",waist="Fucho-no-obi",legs="Pedagogy Pants",feet="Artsieq Boots"}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{})
	
	sets.Midcast.Drain = {main="Baqil Staff",sub="Mephitis Grip",ammo="Impatiens",
		head="Artsieq Hat",neck="Eddy Necklace",ear1="Hirudinea Earring",ear2="Loquac. Earring",
		body="Hedera Cotehardie",hands="Yaoyotl Gloves",ring1="Perception Ring",ring2="Sangoma Ring",
		back="Ogapepo Cape",waist="Fucho-no-obi",legs="Artsieq Hose",feet="Artsieq Boots"}

	sets.Midcast.Aspir = set_combine(sets.Midcast.Drain,{})

	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {main="Ngqoqwanb",sub="Wise Strap",ammo="Witchstone",
		head="Hagondes Hat",neck="Eddy Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
		body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
		back="Bookworm's Cape",waist="Aswang Sash",legs="Hagondes Pants",feet="Hagondes Sabots"}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{
	    sub="Mephitis Grip",ammo="Savant's Treatise",head="Artsieq Hat",ear1="Gwati Earring",
		body="Artsieq Jubbah",legs="Artsieq Hose",feet="Artsieq Boots"})

	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {main="Baqil Staff",sub="Mephitis Grip",ammo="Savant's Treatise",
		head="Artsieq Hat",neck="Imbodla Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Artsieq Jubbah",hands="Lurid Mitts",ring1="Perception Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Aswang Sash",legs="Artsieq Hose",feet="Artsieq Boots"}
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{})
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{})

	-- Impact --
	sets.Midcast.Impact = {main="Baqil Staff",sub="Mephitis Grip",ammo="Kalboron Stone",
			neck="Eddy Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
			body="Twilight Cloak",hands="Lurid Mitts",ring1="Perception Ring",ring2="Sangoma Ring",
			back="Refraction Cape",waist="Aswang Sash",legs="Artsieq Hose",feet="Artsieq Boots"}

	-- Elemental Obi/Twilight Cape --
	sets.Obi = {}
	sets.Obi.Thunder = {back="Twilight Cape",waist='Rairin Obi'}
	sets.Obi.Water = {back="Twilight Cape",waist='Suirin Obi'}
	sets.Obi.Fire = {back="Twilight Cape",waist='Karin Obi'}
	sets.Obi.Ice = {back="Twilight Cape",waist='Hyorin Obi'}
	sets.Obi.Wind = {back="Twilight Cape",waist='Furin Obi'}
	sets.Obi.Earth = {back="Twilight Cape",waist='Dorin Obi'}
	sets.Obi.Light = {back="Twilight Cape",waist='Korin Obi'}
	sets.Obi.Dark = {back="Twilight Cape",waist='Anrin Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
    sets.JA['Light Arts'] = {legs="Acad. Pants +1"}
	sets.JA['Dark Arts'] = {body="Academic's Gown"}
	sets.JA['Addendum: Black'] = {body="Savant's Gown +2"}
	sets.JA['Addendum: White'] = {body="Savant's Gown +2"}
	sets.JA.Parsimony = {legs="Savant's Pants +2"}
	sets.JA.Penury = {legs="Savant's Pants +2"}
	sets.JA.Rapture = {head="Svnt. Bonnet +2"}
	sets.JA.Ebullience = {head="Svnt. Bonnet +2"}
	sets.JA.Perpetuance = {hands="Svnt. Bracers +2"}
	sets.JA.Immenance = {hands="Svnt. Bracers +2"}
	sets.JA.Enlightenment = {body="Pedagogy Gown +1"}
	sets.JA.Stormsurge = {feet="Peda. Loafers +1"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- WS Base Set --
	sets.WS = {}
	sets.WS.Shattersoul = {}
	sets.WS.Myrkr = {}
	sets.WS.Omniscience = {}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
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
	elseif spell.type == "JobAbility" or spell.type == "Scholar" then
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
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
			if string.find(spell.english,'Cure') and world.weather_element == 'Light' then
				equipSet = equipSet.Cure.Weather	
			elseif string.find(spell.english,'Cura') then
				equipSet = equipSet.Curaga
			else
                equipSet = equipSet.Cure 			
			end
			if buffactive.Rapture then -- Equip Svnt. Bonnet +2 When Rapture Is Up For Curaga Spells --
				equipSet = set_combine(equipSet,{head="Svnt. Bonnet +2"})
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
		elseif string.find(spell.english,'Regen') then -- Equip Svnt. Bonnet +2 For Regen Spells --
			equipSet = set_combine(equipSet,{head="Svnt. Bonnet +2"})
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet.Haste,{ring1="Fenian Ring"})
		elseif spell.english == "Stun" and buffactive.Alacrity and world.weather_element == 'Thunder' then -- Equip Argute loafers +2 When Alacrity Is Up And Thunder Weather --
			equipSet = set_combine(equipSet,{head="Nahtirah Hat",feet="Peda. Loafers +1"})
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
			if (spell.skill == 'Elemental Magic' or string.find(spell.english,'Cur') or string.find(spell.english,'Bio') or string.find(spell.english,'Dia')) and not Non_Obi_Spells:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' then -- Use Obi Toggle To Equip Normal Waist Gear --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
	end
	if buffactive.Perpetuance and spell.skill == "Enhancing Magic" then
		equipSet = set_combine(equipSet,{hands="Svnt. Bracers +2"})
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
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
	if command == 'C1' then -- Magic Accuracy Toggle --
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
	elseif command == 'C3' then -- Obi Toggle --
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
		add_to_chat(8,spell.name..' Canceled: [Current MP = ' .. player.mp .. ' | ' .. player.mpp .. '%] Using '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
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
