-- *** Original file from pastebin.com/u/Bokura *** --
-- Last Updated: 08/10/14 *Updated Gear Sets* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	WeaponIndex = 1
	WeaponArray = {} -- Default Sub Weapon Is Izhiikoh. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	SA = false
	TA = false
	TH = 'OFF' -- Set Default Full TH ON or OFF Here --
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
	target_distance = 6 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="MercyStroke", SC2="Evisceration", SC3="Rudra'sStorm"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = {
			head="Oce. Headpiece +1",neck="Wiglen Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
			body="Kheper Jacket",hands="Plun. Armlets +1",ring1="Paguroidea Ring",ring2="Sheltered Ring",
			back="Repulse Mantle",waist="Flume Belt",legs="Quiahuiz Trousers",feet="Pill. Poulaines +1"}
			
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{
			head="Felistris Mask",neck="Love Torque",body="Plunderer's Vest +1",
			ring1="Epona's Ring",ring2="Rajas Ring",back="Atheling Mantle",waist="Patentia Sash",})

	-- TP Sets --
	sets.TP = {--range="Raider's Bmrng.", 
	        ammo="Qirmiz Tathlum",
			head="Felistris Mask",neck="Asperity Necklace",
			--ear1="Suppanomimi",ear2="Brutal Earring",
			ear1="Dudgeon Earring",ear2="Heartseeker Earring",
			body="Plunderer's Vest +1",
			--body="Thaumas Coat",
			hands="Qaaxo Mitaines",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Atheling Mantle",waist="Patentia Sash",legs="Quiahuiz Trousers",feet="Plun. Poulaines +1"}
	sets.TP.MidACC = set_combine(sets.TP,{ammo="Honed Tathlum",
	        ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Qaaxo Harness",hands="Buremte Gloves"})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{
	        head="Whirlpool Mask",neck="Iqabi Necklace",body="Pillager's Vest +1",ring1="Patricius Ring",
			ring2="Mars's Ring",back="Canny Cape",waist="Anguinus Belt",legs="Plun. Culottes +1",feet="Pill. Poulaines +1"})			

    -- March x2 + Haste --
    sets.TP.MidHaste = set_combine(sets.TP,{
            ear1="Trux Earring", ear2="Brutal Earring",waist="Windbuffet Belt"})
    sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidHaste,{
            ammo="Honed Tathlum",body="Qaaxo Harness",hands="Buremte Gloves"})
    sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{
            head="Whirlpool Mask",neck="Iqabi Necklace",body="Pillager's Vest +1",ring1="Patricius Ring",
			back="Canny Cape",waist="Anguinus Belt",legs="Plun. Culottes +1",feet="Pill. Poulaines +1"})
 
    -- March x2 + Haste + Samba --
    sets.TP.HighHaste = set_combine(sets.TP.MidHaste,{
            ear1="Trux Earring", ear2="Brutal Earring",waist="Windbuffet Belt"})
    sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{
            ammo="Honed Tathlum",body="Qaaxo Harness",hands="Buremte Gloves"})
    sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{
            head="Whirlpool Mask",neck="Iqabi Necklace",body="Pillager's Vest +1",ring1="Patricius Ring",
			back="Canny Cape",waist="Anguinus Belt",legs="Plun. Culottes +1",feet="Pill. Poulaines +1"})			

	-- Full TH TP Set --
	sets.TP.TH = {hands="Plun. Armlets +1",waist="Chaac Belt",feet="Raid. Poulaines +2"}

	-- TP Rancor ON Neck --
	sets.TP.Rancor = {neck="Rancor Collar"}

	-- PDT/MDT Sets --
	sets.PDT = {neck="Wiglen Gorget",
			ring1={name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
			ring2="Patricius Ring",back="Repulse Mantle",waist="Flume Belt",feet="Iuitl Gaiters"}

	sets.MDT = {
	        head="Felistris Mask",neck="Twilight Torque",ear1="Mujin Stud",ear2="Sanare Earring",
			body="Plunderer's Vest +1",hands="Pill. Armlets +1",ring1="Shadow Ring",
			ring2={name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
			back="Mubvum. Mantle",waist="Patentia Sash",legs="Pill. Culottes +1",feet="Pill. Poulaines +1"}

	-- Hybrid/Evasion Sets --
	sets.TP.Hybrid = {--range="Raider's Bmrng.",
			head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
			body="Plunderer's Vest +1",hands="Pill. Armlets +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Atheling Mantle",waist="Patentia Sash",legs="Pill. Culottes +1",feet="Plun. Poulaines +1"}
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.Evasion = set_combine(sets.TP,{
	        neck="Torero Torque",body="Pillager's Vest +1",back="Boxer's Mantle",feet="Pill. Poulaines +1",})

	-- WS Base Set --
	sets.WS = {}

	-- WS Sets --
	sets.WS["Mercy Stroke"] = {ammo="Qirmiz Tathlum",
			head="Whirlpool Mask",neck="Soil Gorget",ear1="Flame Pearl",ear2="Brutal Earring",
			body="Pillager's Vest +1",hands="Pill. Armlets +1",ring1="Epona's Ring",ring2="Pyrosoul Ring",
			back="Buquwik Cape",waist="Windbuffet Belt",legs="Pill. Culottes +1",feet="Plun. Poulaines +1"}
	sets.WS["Mercy Stroke"].SA = set_combine(sets.WS["Mercy Stroke"],{
			head="Pill. Bonnet +1",ear2="Flame Pearl",body="Plunderer's Vest +1",
			ring1="Rajas Ring",waist="Caudata Belt",feet="Pill. Poulaines +1"})
	sets.WS["Mercy Stroke"].SA.MidAcc = set_combine(sets.WS["Mercy Stroke"].SA,{})
    sets.WS["Mercy Stroke"].SA.HighAcc = set_combine(sets.WS["Mercy Stroke"].SA.MidAcc,{})		
	sets.WS["Mercy Stroke"].TA = set_combine(sets.WS["Mercy Stroke"].SA,{
	        ring1="Pyrosoul Ring"})
	sets.WS["Mercy Stroke"].TA.MidAcc = set_combine(sets.WS["Mercy Stroke"].TA,{})
    sets.WS["Mercy Stroke"].TA.HighAcc = set_combine(sets.WS["Mercy Stroke"].TA.MidAcc,{})

    sets.WS["Rudra's Storm"] = {}
	sets.WS["Rudra's Storm"].SA = set_combine(sets.WS["Rudra's Storm"],{ammo="Qirmiz Tathlum",
	        head="Pill. Bonnet +1",neck="Shadow Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
			body="Pillager's Vest +1",hands="Pill. Armlets +1",ring1="Thundersoul Ring",ring2="Thundersoul Ring",
			back="Kayapa Cape",waist="Cuchulain's Belt",legs="Pill. Culottes +1",feet="Plun. Poulaines +1"})
	sets.WS["Rudra's Storm"].SA.HighACC = set_combine(sets.WS["Rudra's Storm"].SA,{})		
	sets.WS["Rudra's Storm"].TA = set_combine(sets.WS["Rudra's Storm"].SA,{
			body="Plunderer's Vest +1",ring2="Epona's Ring",back="Cavaros Mantle"})
	sets.WS["Rudra's Storm"].TA.HighACC = set_combine(sets.WS["Rudra's Storm"].TA,{
            body="Pillager's Vest +1",ring2="Rajas Ring",back="Kayapa Cape",waist="Caudata Belt"})	

	sets.WS.Exenterator = {ammo="Potestas Bomblet",
			head="Felistris Mask",neck="Justiciar's Torque",ear1="Tripudio Earring",ear2="Brutal Earring",
			body="Plunderer's Vest +1",hands="Pill. Armlets +1",ring1="Epona's Ring",ring2="Stormsoul Ring",
			back="Vespid Mantle",waist="Prosilio Belt",legs="Nahtirah Trousers",feet="Plun. Poulaines +1"}
	sets.WS.Exenterator.MidAcc = set_combine(sets.WS.Exenterator,{})
    sets.WS.Exenterator.HighAcc = set_combine(sets.WS.Exenterator.MidAcc,{ammo="Honed Tathlum",
			head="Whirlpool Mask",neck="Soil Gorget",ear1="Heartseeker Earring",ear2="Steelflash Earring",
			body="Pillager's Vest +1",hands="Buremte Gloves",back="Canny Cape",waist="Anguinus Belt",
			legs="Plun. Culottes +1",feet="Pill. Poulaines +1"})	
	sets.WS.Exenterator.SA = set_combine(sets.WS.Exenterator,{
	        head="Uk'uxkaj Cap",neck="Soil Gorget",legs="Pill. Culottes +1"})
	sets.WS.Exenterator.TA = set_combine(sets.WS.Exenterator.SA,{})

	sets.WS.Evisceration = {ammo="Qirmiz Tathlum",
			head="Pill. Bonnet +1",neck="Love Torque",ear1="Tripudio Earring",ear2="Moonshade Earring",
			body="Plunderer's Vest +1",hands="Pill. Armlets +1",ring1="Epona's Ring",ring2="Rajas Ring",
			back="Rancorous Mantle",waist="Prosilio Belt",legs="Pill. Culottes +1",feet="Plun. Poulaines +1"}
	sets.WS.Evisceration.MidAcc = set_combine(sets.WS.Evisceration,{})
	-- Evisceration HighAcc same as Exenterator --
    sets.WS.Evisceration.HighAcc = set_combine(sets.WS.Exenterator.MidAcc,{})		
	sets.WS.Evisceration.SA = set_combine(sets.WS.Evisceration,{hands="Raid. Armlets +2"})
	sets.WS.Evisceration.TA = set_combine(sets.WS.Evisceration.SA,{})			

	sets.WS["Aeolian Edge"] = {neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Novio Earring",ring1="Acumen Ring",
	        head="Pill. Bonnet +1",body="Plunderer's Vest +1",hands="Pill. Armlets +1",
			waist="Caudata Belt",legs="Iuitl Tights",feet="Pill. Poulaines +1"}

	sets.WS["Mandalic Stab"] = {}

	-- JA Sets --
	sets.JA = {}
	TH_Gear = {hands="Plun. Armlets +1",feet="Raid. Poulaines +2"}
	sets.JA.Conspirator = {body="Raider's Vest +2"}
	sets.JA.Accomplice = {head="Raid. Bonnet +2"}
	sets.JA.Collaborator = {head="Raid. Bonnet +2"}
	sets.JA["Perfect Dodge"] = {hands="Plun. Armlets +1"}
	sets.JA.Steal = {hands="Pill. Armlets +1",legs="Pill. Culottes +1",feet="Pill. Poulaines +1"}
	sets.JA.Flee = {feet="Pill. Poulaines +1"}
	sets.JA.Despoil = {feet="Raid. Poulaines +2"}
	sets.JA.Feint = {legs="Plun. Culottes +1"}
	sets.JA["Assassin's Charge"] = {feet="Plun. Poulaines +1"}
	sets.JA.Ambush = {body="Plunderer's Vest +1"}
	sets.JA.Hide = {body="Pillager's Vest +1"}
	sets.JA["Sneak Attack"] = {
			head="Uk'uxkaj Cap",neck="Love Torque",
			body="Plunderer's Vest +1",hands="Plun. Armlets +1",
			back="Vespid Mantle",waist="Chaac Belt",
			legs="Pill. Culottes +1",feet="Raid. Poulaines +2"}
	sets.JA["Trick Attack"] = set_combine(sets.JA["Sneak Attack"],{ring2="Stormsoul Ring"})

	-- Step Set --
	sets.Step = set_combine(sets.TP.HighACC,TH_Gear)

	-- Flourish Set --
	sets.Flourish = set_combine(sets.TP.HighACC,TH_Gear)

	-- Waltz Set --
	sets.Waltz = {
	        head="Uk'uxkaj Cap",body="Pillager's Vest +1",ear1="Soil Pearl",ear2="Soil Pearl",
			hands="Plun. Armlets +1",ring2="Asklepian Ring",
			back="Iximulew Cape",waist="Chaac Belt",legs="Plun. Culottes +1",feet="Pill. Poulaines +1"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{ammo="Impatiens",neck="Magoraga Beads",hands="Buremte Gloves"})

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.TP,{})
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
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
			if SA and equipSet["SA"] then
				equipSet = equipSet["SA"]
			end
			if TA and equipSet["TA"] then
				equipSet = equipSet["TA"]
			end
			if spell.english == "Evisceration" and player.tp > 2990 then -- Equip Jupiter's Pearl When You Have 3000 TP --
				equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type=="JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
		if spell.english=="Sneak Attack" then
			SA = true
		end
		if spell.english=="Trick Attack" then
			TA = true
		end
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if string.find(spell.english,'Utsusemi') then
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
				return
			else
				equip(sets.Precast.Utsusemi)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == 'Step' then
		equip(sets.Step)
	elseif string.find(spell.type,'Flourish') then
		equip(sets.Flourish)
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	if spell.english == 'Ranged' then
		equip(TH_Gear)
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
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
		if (buffactive.Embrava and (buffactive.Haste or buffactive.March) and buffactive['Haste Samba']) or (buffactive.March == 2 and buffactive.Haste and buffactive['Haste Samba']) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if (buffactive.Embrava and (buffactive.Haste or buffactive.March or buffactive['Haste Samba'])) or (buffactive.March == 1 and buffactive.Haste and buffactive['Haste Samba'] and equipSet["MidHaste"]) or (buffactive.March == 2 and (buffactive.Haste or buffactive['Haste Samba'])) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if SA then
			equipSet = set_combine(equipSet,sets.JA["Sneak Attack"])
		end
		if TA then
			equipSet = set_combine(equipSet,sets.JA["Trick Attack"])
		end
		if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
			equipSet = set_combine(equipSet,sets.TP.Rancor)
		end
		if TH == 'ON' then -- Use TH Toggle To Lock Full TH Set --
			equipSet = set_combine(equipSet,sets.TP.TH)
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
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "sneak attack" then
		SA = gain
	elseif buff == "trick attack" then
		TA = gain
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
			add_to_chat(123,'Solo Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Solo Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C8' then -- Full TH Set Toggle --
		if TH == 'ON' then
			TH = 'OFF'
			add_to_chat(123,'Full TH Set: [Unlocked]')
		else
			TH = 'ON'
			add_to_chat(158,'Full TH Set: [Locked]')
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
		set_macro_page(1, 1)
	elseif player.sub_job == 'DNC' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 1)
	else
		set_macro_page(1, 1)
	end
end
