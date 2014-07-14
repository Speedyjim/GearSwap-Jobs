-- *** Original file from pastebin.com/u/Bokura *** --
-- Last Updated: 03/08/14 8:35 PM *Fixed Error* --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	Twilight = 0
	Seigan = 'OFF' -- Set Default Seigan Set ON or OFF Here --
	Third_Eye = 'OFF' -- Set Default Third Eye Set ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	send_command('input /macro book 3;wait .1;input /macro set 1') -- Change Default Macro Book Here --

	sc_map = {SC1="TachiFudo", SC2="Meditate", SC3="TachiShoha"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {}
	sets.Idle.Regen = set_combine(sets.Idle.Movement,{
			head="Twilight Helm",neck="Wiglen Gorget",body="Arhat's Gi +1",
			hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
			back="Repulse Mantle",waist="Flume Belt",legs="Otronif Brais",feet="Danzo Sune-Ate"})
	sets.Idle.Movement = {ammo="Potestas Bomblet",
			head="Wakido Kabuto +1",neck="Iqabi Necklace",ear1="Tripudio Earring",ear2="Brutal Earring",
			body="Sakonji Domaru +1",hands="Wakido Kote +1",ring1="K'ayres Ring",ring2="Rajas Ring",
			back="Takaha Mantle",waist="Dynamic Belt +1",legs="Wakido Haidate +1",feet="Danzo Sune-Ate"}

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

	-- Tsurumaru TP Sets --
	sets.TP.Tsurumaru = {main="Tsurumaru",ammo="Paeapua",
			head="Otomi Helm",neck="Asperity Necklace", -- Ganesha's Mala
			ear1="Tripudio Earring",ear2="Brutal Earring",body="Sakonji Domaru +1",hands="Wakido Kote +1",
			ring1="K'ayres Ring",ring2="Rajas Ring",back="Takaha Mantle",waist="Windbuffet Belt",
			legs="Wakido Haidate +1",feet="Sak. Sune-Ate +1"}
	sets.TP.Tsurumaru.MidACC = set_combine(sets.TP.Tsurumaru,{
			head="Yaoyotl Helm",ear1="Steelflash Earring",ear2="Bladeborn Earring",waist="Dynamic Belt +1"})
	sets.TP.Tsurumaru.HighACC = set_combine(sets.TP.Tsurumaru.MidACC,{
			neck="Iqabi Necklace",ring1="Patricius Ring",ring2="Mars's Ring",feet="Wakido Sune-Ate"})

	-- Tsurumaru(Ionis) TP Sets --
	sets.TP.Tsurumaru.Ionis =  set_combine(sets.TP.Tsurumaru,{})
	sets.TP.Tsurumaru.MidACC.Ionis = set_combine(sets.TP.Tsurumaru.MidAcc,{})
	sets.TP.Tsurumaru.HighACC.Ionis = set_combine(sets.TP.Tsurumaru.HighACC,{})
			
	-- Ranged Accuracy TP Sets --
    sets.Ranged = {
	        head="Tema. Headband",neck="Iqabi Necklace",ear1="Vision Earring",ear2="Clearview Earring",
			body="Kyujutsugi",hands="Unkai Kote +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
			back="Kayapa Cape",waist="Sao. Koshi-Ate",legs="Temachtiani Pants",feet="Temachtiani Boots"}	
	sets.Ranged.MidACC = set_combine(sets.Ranged,{})	
	sets.Ranged.HighACC = set_combine(sets.Ranged.MidACC,{})	

	-- Seigan TP Set --
	sets.TP.Seigan = {head="Unkai Kabuto +2"}

	-- Third Eye TP Set --
	sets.TP['Third Eye'] = {legs="Sakonji Haidate"}

	-- PDT/MDT Sets --
	sets.PDT = {
			head="Otronif Mask",neck="Wiglen Gorget",body="Arhat's Gi +1",hands="Sakonji Kote",
			ring1="Patricius Ring",
			ring2={name="Dark Ring",augments={"Magic Damage Taken -4%","Physical Damage Taken -6%"}},
			back="Repulse Mantle",waist="Flume Belt",legs="Otronif Brais",feet="Otronif Boots"}

	sets.MDT = set_combine(sets.PDT,{ammo="Demonry Stone",
			head="Wakido Kabuto +1",ear1="Mujin Stud",ear2="Sanare Earring",
			body="Kyujutsugi",hands="Buremte Gloves",ring1="Shadow Ring",
			ring2={name="Dark Ring",augments={"Magic Damage Taken -4%","Physical Damage Taken -6%"}},
			back="Mubvum. Mantle",legs="Wakido Haidate +1",feet="Daihanshi Habaki"})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{
			ear1="Steelflash Earring",ear2="Bladeborn Earring",
			hands="Sakonji Kote +1",ring1="Patricius Ring",back="Repulse Mantle"})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{
			head="Yaoyotl Helm",body="Mes. Haubergeon",waist="Dynamic Belt +1",})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{
			neck="Iqabi Necklace",back="Takaha Mantle",feet="Waki. Sune-Ate +1"})

	-- WS Base Set --
	sets.WS = {ammo="Cheruski Needle",
			head="Otomi Helm",neck="Asperity Necklace",ear1="Flame Pearl",ear2="Brutal Earring",
			body="Phorcys Korazin",hands="Miki. Gauntlets",ring1="Pyrosoul Ring",ring2="Pyrosoul Ring",
			back="Buquwik Cape",waist="Windbuffet Belt",legs="Scuff. Cosciales",feet="Sak. Sune-Ate +1"}

	-- WS Sets --
	sets.WS["Tachi: Fudo"] = set_combine(sets.WS,{
			neck="Light Gorget",ear1="Moonshade Earring",waist="Light Belt",})
	sets.WS["Tachi: Fudo"].MidACC = set_combine(sets.WS["Tachi: Fudo"],{
			head="Yaoyotl Helm",hands="Miki. Gauntlets",})
	sets.WS["Tachi: Fudo"].HighACC = set_combine(sets.WS["Tachi: Fudo"].MidACC,{
			body="Wakido Domaru +1",back="Takaha Mantle",legs="Miki. Cuisses",feet="Wakido Sune-Ate"})

	sets.WS["Tachi: Shoha"] = set_combine(sets.WS,{
			ammo="Paeapua",ear1="Moonshade Earring"})
	sets.WS["Tachi: Shoha"].MidACC = set_combine(sets.WS["Tachi: Shoha"],{
			head="Yaoyotl Helm",neck="Breeze Gorget",hands="Miki. Gauntlets",waist="Shadow Belt",})
	sets.WS["Tachi: Shoha"].HighACC = set_combine(sets.WS["Tachi: Shoha"].MidACC,{
			body="Mes. Haubergeon",back="Takaha Mantle",
			legs="Miki. Cuisses", -- Replace with Xaddi Cuisses
			feet="Wakido Sune-Ate"})

	sets.WS["Tachi: Kaiten"] = set_combine(sets.WS,{})
	sets.WS["Tachi: Kaiten"].MidACC = set_combine(sets.WS["Tachi: Kaiten"],{})
	sets.WS["Tachi: Kaiten"].HighACC = set_combine(sets.WS["Tachi: Kaiten"].MidACC,{})

	sets.WS["Tachi: Rana"] = set_combine(sets.WS,{})
	sets.WS["Tachi: Rana"].MidACC = set_combine(sets.WS["Tachi: Rana"],{})
	sets.WS["Tachi: Rana"].HighACC = set_combine(sets.WS["Tachi: Rana"].MidACC,{})

	sets.WS["Namas Arrow"] = {}
	sets.WS["Namas Arrow"].MidACC = set_combine(sets.WS["Namas Arrow"],{})
	sets.WS["Namas Arrow"].HighACC = set_combine(sets.WS["Namas Arrow"].MidACC,{})

	sets.WS["Apex Arrow"] = {}
	sets.WS["Apex Arrow"].MidACC = set_combine(sets.WS["Apex Arrow"],{})
	sets.WS["Apex Arrow"].HighACC = set_combine(sets.WS["Apex Arrow"].MidACC,{})

	-- JA Sets --
	sets.JA = {}
	sets.JA.Meditate = {head="Wakido Kabuto +1",hands="Sakonji Kote"}
	sets.JA["Warding Circle"] = {head="Wakido Kabuto +1"}
	sets.JA["Meikyo Shisui"] = {feet="Sak. Sune-Ate +1"}
	sets.JA["Blade Bash"] = {hands="Sakonji Kote"}
	sets.JA.Sekkanoki = {hands="Unkai Kote +2"}
	sets.JA.Sengikori = {feet="Unkai Sune-Ate +2"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (player.status == 'Engaged' and (((spell.english == "Namas Arrow" or spell.english == "Apex Arrow") and spell.target.distance > 16+target_distance) or (spell.type == "WeaponSkill" and spell.english ~= "Namas Arrow" and spell.english ~= "Apex Arrow" and spell.target.distance > target_distance))) then -- Cancel Ranged Attack or WS If You Are Out Of Range --
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
			if buffactive.Sekkanoki then -- Equip Unkai Kote +2 When Sekkanoki Is On --
				equipSet = set_combine(equipSet,{hands="Unkai Kote +2"})
			end
			if buffactive.Sengikori then -- Equip Unkai Sune-ate +2 When Sengikori Is On --
				equipSet = set_combine(equipSet,{feet="Unkai Sune-ate +2"})
			end
			if (spell.english == "Tachi: Fudo" or spell.english == "Tachi: Shoha") and (player.tp > 2990 or buffactive.Sekkanoki or (player.tp > 1990 and buffactive.Hagakure)) then -- Equip Vulcan's Pearl When You Have 300 TP or Sekkanoki On or 200+ TP For Hagakure --
				equipSet = set_combine(equipSet,{ear1="Flame Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		if string.find(spell.english,'Utsusemi') then
			if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
				return
			else
				equip(sets.Precast.FastCast)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == "Waltz" then
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 1 then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
    if spell.english == 'Ranged' then
		equipSet = sets.Ranged
		if equipSet[player.range] then
			equipSet = equipSet[player.range]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Barrage and equipSet["Barrage"] then
			equipSet = equipSet["Barrage"]
		end
		equip(equipSet)
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
    if spell.english == 'Ranged' and autoRAmode==1 then
		autoRA()
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	elseif spell.english == "Warding Circle" and not spell.interrupted then -- Warding Circle Countdown --
		send_command('wait 260;input /echo '..spell.name..' Effect: [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..' Effect: [OFF]')
	end
	status_change(player.status)
end
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
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			equipSet = equipSet["AM3"]
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end	
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if buffactive.Seigan and Seigan == 'ON' then -- Use Seigan Toggle For Seigan TP Set --
			equipSet = set_combine(equipSet,sets.TP.Seigan)
		end
		if buffactive["Third Eye"] and Third_Eye == 'ON' then -- Use Third Eye Toggle For Third Eye TP Set --
			equipSet = set_combine(equipSet,sets.TP["Third Eye"])
		end
		equip(equipSet)
	else
		equip(sets.Idle[IdleArray[IdleIndex]])
	end
	if buffactive.doom then -- Lock Twilight When You Are Doomed --
		equip(sets.Twilight)
		disable('head','body')
	end
	if Twilight == 1 then
		equip(sets.Twilight)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "doom" and not gain then
		enable('head','body')
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
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C11' then -- Hybrid Toggle --
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
	elseif command == 'C9' then -- Seigan Toggle --
		if Seigan == 'ON' then
			Seigan = 'OFF'
			add_to_chat(123,'Seigan Set: [Unlocked]')
		else
			Seigan = 'ON'
			add_to_chat(158,'Seigan Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Third Eye Toggle --
		if Third_Eye == 'ON' then
			Third_Eye = 'OFF'
			add_to_chat(123,'Third Eye Set: [Unlocked]')
		else
			Third_Eye = 'ON'
			add_to_chat(158,'Third Eye Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 1 then
			Twilight = 0
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 1
			add_to_chat(158,'Twilight Set: [locked]')
		end
		status_change(player.status)
	elseif command == 'C2' then -- Auto Ranged Attack Toggle. *Don't Rely On This. It Isn't As Fast As Shooting Manually. It Is Mainly For AFK or When You Dualbox* --
		if autoRAmode == 0 then
			autoRAmode = 1
			add_to_chat(158,'AutoRA Mode: [ON]')
		else
			autoRAmode = 0
			add_to_chat(123,'AutoRA Mode: [OFF]')
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
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//'..sc_map[command])
	end
end
