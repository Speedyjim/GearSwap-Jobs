-- *** Original file from pastebin.com/u/Bokura *** --
-- Last Updated: 08/10/14 *Updated Gear Sets* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC","HasteLowACC","HasteMidACC","HasteHighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {'Movement','Regen'} -- Default Idle Set Is Movement --
	Armor = 'None'
	Migawari = 'OFF' -- Set Default Migawari Body ON or OFF Here --
	Rancor = 'ON' -- Set Default Rancor ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	send_command('input /macro book 2;wait .1;input /macro set 1') -- Change Default Macro Book Here --

	sc_map = {SC1="BladeHi", SC2="UtsusemiIchi", SC3="UtsusemiNi"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = set_combine(sets.Idle.Movement,{
			head="Oce. Headpiece +1",neck="Wiglen Gorget",body="Kheper Jacket",
			ring1="Paguroidea Ring",ring2="Sheltered Ring",back="Repulse Mantle",waist="Flume Belt"})
	sets.Idle.Movement = {ammo="Qirmiz Tathlum",
			head="Felistris Mask",neck="Hope Torque",ear1="Moonshade Earring",ear2="Brutal Earring",
			body="Hachi. Chain. +1",hands="Hachiya Tekko +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Yokaze Mantle",waist="Patentia Sash",legs="Mochizuki Hakama +1",feet="Danzo Sune-Ate"}

	-- Normal TP Sets --
	sets.TP = {ammo="Qirmiz Tathlum",
			head="Iga Zukin +2",neck="Asperity Necklace",ear1="Heartseeker Earring",ear2="Dudgeon Earring",
			body="Hachi. Chain. +1",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Atheling Mantle",waist="Patentia Sash",legs="Mochizuki Hakama +1",feet="Manibozho Boots"}
	sets.TP.MidACC = set_combine(sets.TP,{
			ammo="Jukukik Feather",ring2="Mars's Ring",back="Yokaze Mantle"})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
			head="Whirlpool Mask",neck="Iqabi Necklace",body="Manibozho Jerkin",hands="Buremte Gloves",
			ring1="Patricius Ring",waist="Anguinus Belt",legs="Hachiya Hakama",feet="Qaaxo Leggings"})

	--[[ 
	     Haste (White Magic): 15%
         Haste Samba (Sub): 5%
         Haste (Merited DNC): 10%
		 Victory March +3/+4/+5: 14%/15.6%/17.1%
         Advancing March +3/+4/+5: 10.9%/12.5%/14%
         Embrava: 25%  
    --]]	
			
	-- March x2 --
	-- March + Haste + Haste Samba --
	sets.TP.MidHaste = {ammo="Qirmiz Tathlum",
			head="Felistris Mask",neck="Rancor Collar",ear1="Bladeborn Earring", ear2="Steelflash Earring", -- Replace with Trux/Brutal
			body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Atheling Mantle",waist="Windbuffet Belt",legs="Otronif Brais",feet="Manibozho Boots"}
	sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidHaste,{
	        ear1="Bladeborn Earring",ear2="Steelflash Earring",ring2="Mars's Ring",back="Yokaze Mantle"})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
			head="Whirlpool Mask",neck="Iqabi Necklace",body="Manibozho Jerkin",hands="Buremte Gloves",
			ring1="Patricius Ring",waist="Anguinus Belt",legs="Hachiya Hakama",feet="Qaaxo Leggings"})

	-- March x2 + Haste --
	-- Embrava + (March x2 or March + Haste) --
	sets.TP.HighHaste = {ammo="Qirmiz Tathlum",
			head="Felistris Mask",neck="Rancor Collar",ear1="Bladeborn Earring",ear2="Steelflash Earring", -- Replace with Trux/Brutal
			body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Atheling Mantle",waist="Windbuffet Belt",legs="Otronif Brais",feet="Manibozho Boots"}
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
			ear1="Steelflash Earring",ear2="Bladeborn Earring",ring2="Mars's Ring",back="Yokaze Mantle"})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{
			head="Whirlpool Mask",neck="Iqabi Necklace",body="Manibozho Jerkin",hands="Buremte Gloves",
			ring1="Patricius Ring",waist="Anguinus Belt",legs="Hachiya Hakama",feet="Qaaxo Leggings"})

	-- Embrava + (Haste or March) TP Sets --
	sets.TP.EmbravaHaste = {ammo="Qirmiz Tathlum",
			head="Felistris Mask",neck="Rancor Collar",ear1="Bladeborn Earring",ear2="Steelflash Earring", -- Replace with Trux/Brutal
			body="Thaumas Coat",hands="Otronif Gloves +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Atheling Mantle",waist="Windbuffet Belt",legs="Mochizuki Hakama +1",feet="Manibozho Boots"}
	sets.TP.MidACC.EmbravaHaste = set_combine(sets.TP.EmbravaHaste,{
			ear1="Steelflash Earring",ear2="Bladeborn Earring",ring2="Mars's Ring",back="Yokaze Mantle"})
	sets.TP.HighACC.EmbravaHaste = set_combine(sets.TP.MidACC.EmbravaHaste,{
			head="Whirlpool Mask",neck="Iqabi Necklace",body="Manibozho Jerkin",hands="Buremte Gloves",
			ring1="Patricius Ring",waist="Anguinus Belt",legs="Hachiya Hakama",feet="Qaaxo Leggings"})

	-- TP Rancor ON Neck --
	sets.TP.Rancor = {neck="Rancor Collar"}

	-- TP Migawari Set --
	sets.TP.Migawari = {body="Iga Ningi +2"}

	-- PDT/MDT Sets --
	sets.PDT = {ammo="Qirmiz Tathlum",
			head="Otronif Mask",neck="Twilight Torque",body="Qaaxo Harness",hands="Otronif Gloves +1",
			ring1="Patricius Ring",back="Repulse Mantle",waist="Flume Belt",
			legs="Otronif Brais",feet="Otronif Boots +1",
			ring2={name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}}}

	sets.MDT = set_combine(sets.PDT,{ammo="Demonry Stone",
			head="Uk'uxkaj Cap",ear1="Mujin Stud",ear2="Sanare Earring",
			body="Hachi. Chain. +1",hands="Buremte Gloves",ring1="Shadow Ring",
			ring2={name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
			back="Mubvum. Mantle",legs="Nahtirah Trousers",feet="Daihanshi Habaki"})

	-- Hybrid/Evasion Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			head="Whirlpool Mask",body="Hachi. Chain. +1",
			ear1="Heartseeker Earring",ear2="Dudgeon Earring",back="Repulse Mantle",})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			legs="Hachiya Hakama"})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			body="Manibozho Jerkin",feet="Mochizuki Kyahan"})

	sets.Evasion = set_combine(sets.TP,{
	        head="Whirlpool Mask", body="Hachi. Chain. +1",hands="Hachiya Tekko +1",
			back="Yokaze Mantle",legs="Nahtirah Trousers",feet="Qaaxo Leggings"})

	-- WS Base Set --
	sets.WS = {}

	-- WS Sets --
	sets.WS["Blade: Hi"] = {ammo="Qirmiz Tathlum",
			head="Uk'uxkaj Cap",neck="Hope Torque",ear1="Moonshade Earring",ear2="Brutal Earring",
			body="Hachi. Chain. +1",hands="Qaaxo Mitaines",
			ring1="Epona's Ring",ring2="Stormsoul Ring",back="Rancorous Mantle",waist="Caudata Belt",
			legs="Mochi. Hakama +1",feet="Daihanshi Habaki"} -- Mochi. Kyahan +1
	sets.WS["Blade: Hi"].MidACC = set_combine(sets.WS["Blade: Hi"],{
			head="Whirlpool Mask",neck="Shadow Gorget",legs="Hachiya Hakama"})
	sets.WS["Blade: Hi"].HighACC = set_combine(sets.WS["Blade: Hi"].MidACC,{
			back="Yokaze Mantle"})

	sets.WS["Blade: Shun"] = {}

	sets.WS["Blade: Metsu"] = {}

	sets.WS["Blade: Kamu"] = {}

	sets.WS["Blade: Jin"] = {}

	sets.WS.Exenterator = {}

	sets.WS.Evisceration = {}

	sets.WS["Sanguine Blade"] = {}

	-- Waltz Set --
	sets.Waltz = {
	        head="Uk'uxkaj Cap",body="Hachi. Chain. +1",hands="Buremte Gloves",
			ring1="Asklepian Ring",legs="Nahtirah Trousers",feet="Daihanshi Habaki"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{ammo="Impatiens",neck="Magoraga Beads",body="Mochi. Chainmail",hands="Buremte Gloves"})

	sets.Midcast = {}
	-- -- Magic Haste/Utsusemi Set --
	sets.Midcast.Haste = set_combine(sets.Evasion,{ammo="Impatiens",
	        neck="Torero Torque",hands="Mochizuki Tekko",
			waist="Twilight Belt",back="Boxer's Mantle",feet="Iga Kyahan +2",
			ear1="Loquac. Earring",ring1="Veneficium Ring",ring2="Prolix Ring"})

	-- Migawari Magic Set --
	sets.Midcast.Migawari = {}

	-- Ninjutsu Set --
	sets.Midcast.Ninjutsu = {ammo="Impatiens",
	        head="Hachiya Hatsuburi",hands="Mochizuki Tekko",feet="Mochizuki Kyahan"}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Yonin" and buffactive.Yonin then -- Change Yonin To Innin If Yonin Is On --
		cancel_spell()
		send_command('Innin')
	elseif spell.english == "Innin" and buffactive.Innin then -- Change Innin To Yonin If Innin Is On --
		cancel_spell()
		send_command('Yonin')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged') then -- Cancel Ranged Attack or WS If You Are Out Of Range --
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
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if player.tp > 2990 then
				if spell.english == "Blade: Hi" then
					equipSet = set_combine(equipSet,{ear1="Auster's Pearl"})
				elseif spell.english == "Blade: Shun" then
					equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
				end
			end
			equip(equipSet)
		end
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
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
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
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
		elseif string.find(spell.english,'Tonko') then
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Migawari: Ichi' then
			equip(sets.Midcast.Migawari)
		elseif sets.Midcast[spell.skill] then
			equip(sets.Midcast[spell.skill])
		end
	end
end

function aftercast(spell,action)
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end

function status_change(new,old)
	if player.equipment.range ~= 'empty' then
		disable('range','ammo')
	else
		enable('range','ammo')
	end
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'EVA' then
		equip(sets.Evasion)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if (buffactive.Haste and buffactive.March == 2) and (buffactive.Embrava and (buffactive.March == 2 or (buffactive.March and buffactive.Haste))) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive.Embrava and (buffactive.Haste or buffactive.March) and equipSet["EmbravaHaste"] then
			equipSet = equipSet["EmbravaHaste"]
		end
		if (buffactive.March == 1 and buffactive.Haste and buffactive["Haste Samba"]) or (buffactive.March == 2) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
			equipSet = set_combine(equipSet,sets.TP.Rancor)
		end
		equip(equipSet)
	else
		equip(sets.Idle[IdleArray[IdleIndex]])
		if world.time >= 1020 or world.time <= 420 then
			equip({feet="Hachiya Kyahan"})
		end
	end
	if buffactive.Migawari and Migawari == 'ON' then -- Use Migawari Toggle To Lock Iga Ningi +2 When You Have Migawari On --
		equip(sets.TP.Migawari)
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
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
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
	elseif command == 'C16' then -- Migawari Set Toggle --
		if Migawari == 'ON' then
			Migawari = 'OFF'
			add_to_chat(123,'Migawari Set: [Unlocked]')
		else
			Migawari = 'ON'
			add_to_chat(158,'Migawari Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Evasion Toggle --
		if Armor == 'EVA' then
			Armor = 'None'
			add_to_chat(123,'Evasion Set: [Unlocked]')
		else
			Armor = 'EVA'
			add_to_chat(158,'Evasion Set: [Locked]')
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
	elseif command == 'C12' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
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
