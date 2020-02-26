/datum/team/dwarves
	name = "Dwarven Empire"
	show_roundend_report = TRUE

/datum/antagonist/dwarves
	name = "Ash Walker"
	job_rank = ROLE_LAVALAND
	show_in_antagpanel = FALSE
	prevent_roundtype_conversion = FALSE
	antagpanel_category = "Dwarves"
	var/datum/team/dwarves/dwarf_team

/datum/antagonist/dwarves/create_team(datum/team/team)
	if(team)
		dwarf_team = team
		objectives |= dwarf_team.objectives
	else
		dwarf_team = new

/datum/antagonist/dwarves/get_team()
	return dwarf_team

/datum/antagonist/dwarves/greet()
	to_chat(owner.current, "<span class='warning'>As a dwarf you must follow these 5 tenats:</span><br>")
	to_chat(owner.current, "<span class='warning'>1.You may never kill or maim another dwarf intentionally outside of duels!</span><br>")
	to_chat(owner.current, "<span class='warning'>2.Fortune is worth more than spilt blood!</span><br>")
	to_chat(owner.current, "<span class='warning'>3.Expand your emprire and crush anyone who resists!</span><br>")
	to_chat(owner.current, "<span class='warning'>4.Non dwarves are to be killed unless they are traders</span><br>")
	to_chat(owner.current, "<span class='warning'>5.Live , kill and die for the glorious dwarven empire!</span><br>")

/datum/antagonist/dwarves/on_body_transfer(mob/living/old_body, mob/living/new_body)
	UnregisterSignal(old_body, COMSIG_MOB_EXAMINATE)
	RegisterSignal(new_body, COMSIG_MOB_EXAMINATE, .proc/on_examinate)

/datum/antagonist/dwarves/on_gain()
	RegisterSignal(owner.current, COMSIG_MOB_EXAMINATE, .proc/on_examinate)

/datum/antagonist/dwarves/on_removal()
	UnregisterSignal(owner.current, COMSIG_MOB_EXAMINATE)
