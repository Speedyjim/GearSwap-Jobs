-- Original LUA by Bokura, pastebin.com/u/Bokura --
-- Last Updated: 08/10/14 *Updated Gear Sets* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC","MADx1","MADx2"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. --
	WeaponIndex = 1
	WeaponArray = {"Tinhaspa","Oatixur"} -- Default Main Weapon Is Verethragna. Can Delete Any Weapons That You Don't Own. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	HP = 'OFF'
	Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
	target_distance = 6 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="VictorySmite", SC2="Chakra", SC3="Boost"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {ammo="Honed Tathlum",
			head="Oce. Headpiece +1",neck="Wiglen Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
			body="Hes. Cyclas",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
			back="Repulse Mantle",waist="Black Belt",legs="Otronif Brais",feet="Herald's Gaiters"}

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head="Felistris Mask",neck="Iqabi Necklace",
			body="Anch. Cyclas +1",hands="Anch. Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Anchoret's Mantle",waist="Windbuffet Belt",legs="Hes. Hose +1"})

	-- TP Sets --
	sets.TP = {ammo="Potestas Bomblet",
			head="Felistris Mask",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
			body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Atheling Mantle",waist="Windbuffet Belt",legs="Hes. Hose +1",feet="Anch. Gaiters +1"}
	sets.TP.MidACC = set_combine(sets.TP,{
			ammo="Honed Tathlum",body="Qaaxo Harness",hands="Hes. Gloves +1",})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
	        head="Whirlpool Mask",neck="Iqabi Necklace",
			body="Anch. Cyclas +1",back="Anchoret's Mantle",
			waist="Anguinus Belt",legs="Manibozho Brais",
			feet={name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}}})
	-- Double Madrigal, No Soul Voice, No Focus/Aggressor		
	sets.TP.MADx2 = set_combine(sets.TP,{
	        ammo="Honed Tathlum",head="Whirlpool Mask",
			neck="Iqabi Necklace",body="Anch. Cyclas +1", --Qaaxo RA
			hands="Hes. Gloves +1",
			feet={name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}}})
	--Blade Madrigal only, No Soul Voice, No Focus/Aggressor		
	sets.TP.MADx1 = set_combine(sets.TP.MADx2,{
			back="Anchoret's Mantle"})

	--[[ (Impetus Up) TP Sets For Glanzfaust --
	-- It Won't Use These Sets Unless You Have Glanzfaust Equipped Or You Change The Impetus Rule Under Status_Change Function --
	sets.TP.Impetus = set_combine(sets.TP,{
			ammo="Honed Tathlum",head="Uk'uxkaj Cap",
			body="Tantra Cyclas +2",waist="Cetl Belt",})
	sets.TP.MidACC.Impetus = set_combine(sets.TP.Impetus,{
			ammo="Honed Tathlum",head="Whirlpool Mask",
			ring2="Mars's Ring"})
	sets.TP.HighACC.Impetus = set_combine(sets.TP.MidACC.Impetus,{
			body="Manibozho Jerkin",neck="Iqabi Necklace",
			ring1="Patricius Ring",
			hands="Hes. Gloves +1",legs="Manibozho Brais",
			waist="Hurch'lan Sash",feet="Qaaxo Leggings"})
	--]]		

	-- Hundred Fists TP Set --
	sets.TP.HF = {}

	-- Perfect Counter Set --
	sets.TP.PerfectCounter = set_combine(sets.TP,{head="Tantra Crown +2"})

	-- TP Rancor ON Neck --
	sets.TP.Rancor = {neck="Rancor Collar"}

	-- PDT/MDT Sets --
	sets.PDT = {ammo="Honed Tathlum",
			head="Otronif Mask",neck="Twilight Torque",ear1="Steelflash Earring",ear2="Bladeborn Earring",
			body="Anch. Cyclas +1",hands="Otronif Gloves +1",ring1="Patricius Ring",
			ring2={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
			back="Repulse Mantle",waist="Black Belt",legs="Otronif Brais",feet="Otronif Boots +1"}

	sets.MDT = set_combine(sets.PDT,{ammo="Demonry Stone",
			head="Felistris Mask",neck="Twilight Torque",ear1="Mujin Stud",ear2="Sanare Earring",
	        body="Anch. Cyclas +1",hands="Hes. Gloves +1",ring1="Shadow Ring",back="Mubvum. Mantle",
			legs="Nahtirah Trousers",feet="Daihanshi Habaki"})

	-- Hybrid/HP Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.HP = set_combine(sets.PDT,{})

	-- WS Base Set --
	sets.WS = {ammo="Thew Bomblet",
	        head="Whirlpool Mask",neck="Justiciar's Torque",ear1="Moonshade Earring",ear2="Brutal Earring",
			body="Anch. Cyclas +1",hands="Anch. Gloves +1",ring1="Pyrosoul Ring",ring2="Epona's Ring",
			back="Buquwik Cape",waist="Caudata Belt",legs="Quiahuiz Trousers",
			feet={name="Qaaxo Leggings", augments={'Accuracy+15','STR+7','Phys. dmg. taken -3',}}}

	-- Victory Smite Sets --
	sets.WS["Victory Smite"] = set_combine(sets.WS,{
	        head="Uk'uxkaj Cap",neck="Rancor Collar",})
	sets.WS["Victory Smite"].MidACC = set_combine(sets.WS["Victory Smite"],{
			ammo="Honed Tathlum",})
	sets.WS["Victory Smite"].HighACC = set_combine(sets.WS["Victory Smite"].MidACC,{
			head="Whirlpool Mask",neck="Light Gorget",body="Manibozho Jerkin",
			hands="Hes. Gloves +1",back="Rancorous Mantle",legs="Manibozho Brais",})

	-- Shijin Spiral Sets --
	sets.WS["Shijin Spiral"] = set_combine(sets.WS,{
	        head="Uk'uxkaj Cap",ear1="Steelflash Earring",ear1="Bladeborn Earring",
			ring1="Rajas Ring",back="Atheling Mantle",waist="Windbuffet Belt",
			legs="Manibozho Brais",feet="Daihanshi Habaki"})
	sets.WS["Shijin Spiral"].MidACC = set_combine(sets.WS["Shijin Spiral"],{
			ammo="Honed Tathlum",head="Whirlpool Mask",})
	sets.WS["Shijin Spiral"].HighACC = set_combine(sets.WS["Shijin Spiral"].MidACC,{
			neck="Light Gorget",body="Manibozho Jerkin",ring2="Mars's Ring",waist="Anguinus Belt"})
			
	-- Raging Fists Sets --
    sets.WS["Raging Fists"] = set_combine(sets.WS,{
	        ammo="Potestas Bomblet",ring1="Rajas Ring",back="Atheling Mantle",waist="Windbuffet Belt"}) 
    sets.WS["Raging Fists"].MidACC = set_combine(sets.WS["Raging Fists"],{
	        ammo="Honed Tathlum",hands="Hes. Gloves +1"})
	sets.WS["Raging Fists"].HighACC = set_combine(sets.WS["Raging Fists"].MidACC,{
	        body="Manibozho Jerkin",waist="Thunder Belt",legs="Manibozho Brais"})		

	-- Asuran Fists Sets --
	sets.WS["Asuran Fists"] = set_combine(sets.WS,{})

	sets.WS["Final Heaven"] = set_combine(sets.WS,{})

	sets.WS["Ascetic's Fury"] = set_combine(sets.WS,{})
	
	-- JA Sets --
	sets.JA = {}
	sets.JA.Focus = {head="Anchorite's Crown"}
	sets.JA['Formless Strikes'] = {body="Hes. Cyclas"}
	sets.JA['Hundred Fists'] = {legs="Hes. Hose +1"}
	sets.JA.Mantra = {feet="Mel. Gaiters +2"}
	sets.JA.Counterstance = {feet="Mel. Gaiters +2"}
	sets.JA.Dodge = {feet="Anch. Gaiters +1"}
	sets.JA.Boost = {hands="Anch. Gloves +1"}
	sets.JA.Chakra = {
			ammo="Tantra Tathlum",head="Ejekamal Mask",ear1="Soil Pearl",ear2="Soil Pearl",
			body="Anch. Cyclas +1",hands="Hes. Gloves +1",ring1="Terrasoul Ring",ring2="Terrasoul Ring",
			back="Iximulew Cape",waist="Caudata Belt",legs="Kaabnax Trousers",feet="Thur. Boots +1"}

	-- Waltz Set --
	sets.Waltz = {
			head="Uk'uxkaj Cap",body="Anch. Cyclas +1",hands="Anch. Gloves +1",
			ring2="Asklepian Ring",legs="Nahtirah Trousers",feet="Daihanshi Habaki"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {}
	
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{ammo="Impatiens",neck="Magoraga Beads"})

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == 'Impetus' and buffactive.Impetus then -- Change Impetus To Focus When Impetus Is On --
		cancel_spell()
		send_command('Focus')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if Attack == 'ON' then
				equipSet = equipSet["ATT"]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if spell.english == "Victory Smite" or spell.english == "Ascetic's Fury" then
				if buffactive.Impetus then -- Equip Tantra Cyclas +2 When You Have Impetus On For Victory Smite or Ascetic's Fury --
					equipSet = set_combine(equipSet,{body="Tantra Cyclas +2"})
				end	
				if player.tp > 2990 then -- Equip Vulcan's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{ear1="Flame Pearl"})
				end
				if buffactive.Madrigal then -- Equip Kuwunga Earring when you have Madrigal on --
                    equipSet = set_combine(equipSet,{ear1="Kuwunga Earring"})	
				end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if string.find(spell.english,'Utsusemi') then
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				cancel_spell()
				add_to_chat(123, spell.english .. ' Canceled: [3+ Images]')
				return
			else
				equip(sets.Precast.Utsusemi)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if HP == 'ON' then
		equip(sets.HP)
	end
end

function midcast(spell,action)
	if spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Impetus" then -- Impetus Timer --
			timer_impetus()
		elseif spell.english == "Mantra" then -- Mantra Timer/Countdown --
			timer_mantra()
			send_command('wait 170;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /p '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if Attack == 'ON' then
			equipSet = equipSet["ATT"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if player.equipment.main == 'Glanzfaust' and buffactive.Impetus and equipSet["Impetus"] then -- For Non Glanzfaust Users: If You Still Want To Use Impetus TP Sets For Whatever Reasons, Just Delete "player.equipment.main == 'Glanzfaust' and" --
			equipSet = equipSet["Impetus"]
		end
		if buffactive['Hundred Fists'] then
			equipSet = set_combine(equipSet,sets.TP.HF)
		end
		if buffactive['Perfect Counter'] then
			equipSet = set_combine(equipSet,sets.TP.PerfectCounter)
		end
		if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
			equipSet = set_combine(equipSet,sets.TP.Rancor)
		end
		equip(equipSet)
	else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		equip(equipSet)
	end
	if HP == 'ON' then
		equip(sets.HP)
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
	elseif buff == 'impetus' and not gain then
		send_command('timers delete "Impetus"')
		add_to_chat(123,'Impetus: [OFF]')
	elseif buff == 'mantra' and not gain then
		send_command('timers delete "Mantra"')
	elseif buff == "inner strength" then -- Inner Strength Timer --
		if gain then
			send_command('timers create "Inner Strength" 30 down')
		else
			send_command('timers delete "Inner Strength"')
			add_to_chat(123,'Inner Strength: [OFF]')
		end
	elseif buff == 'aggressor' and not gain then
		add_to_chat(123,'Aggressor: [OFF]')
	elseif buff == "perfect defense" then -- PD Timer --
		if gain then
			send_command('timers create "Perfect Defense" 57 down')
		else
			send_command('timers delete "Perfect Defense"')
			add_to_chat(123,'PD: [OFF]')
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
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C10' then -- Main Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
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
	elseif command == 'C16' then -- HP Toggle --
		if HP == 'ON' then
			HP = 'OFF'
			add_to_chat(123,'HP Set: [Unlocked]')
		else
			HP = 'ON'
			add_to_chat(158,'HP Set: [locked]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Rancor Toggle --
		if Rancor == 'ON' then
			Rancor = 'OFF'
			add_to_chat(123,'Rancor: [OFF]')
		else
			Rancor = 'ON'
			add_to_chat(158,'Rancor: [ON]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
		else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
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
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function timer_impetus()
	local duration = 180
	send_command('timers create "Impetus" '..tostring(duration)..' down')
end

function timer_mantra()
	local duration = 180
	send_command('timers create "Mantra" '..tostring(duration)..' down')
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 200, ['Curing Waltz II'] = 350, ['Curing Waltz III'] = 500, ['Curing Waltz IV'] = 650, ['Curing Waltz V'] = 800}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 200 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 350 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 500 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 650 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 800 then
			newWaltz = 'Curing Waltz IV'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
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
	if player.sub_job == 'WAR' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'DNC' then
		set_macro_page(2, 5)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 5)
	else
		set_macro_page(1, 5)
	end
end
