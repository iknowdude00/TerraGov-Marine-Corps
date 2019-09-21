/obj/structure/displaycase
	name = "display case"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "glassbox1"
	desc = "A display case for prized possessions. It taunts you to kick it."
	resistance_flags = UNACIDABLE
	max_integrity = 30
	var/occupied = 1
	var/destroyed = 0

/obj/structure/displaycase/ex_act(severity)
	switch(severity)
		if(1)
			deconstruct(FALSE)
		if(2)
			take_damage(15)
		if(3)
			take_damage(5)


/obj/structure/displaycase/update_icon()
	if(destroyed)
		icon_state = "glassboxb[occupied]"
	else
		icon_state = "glassbox[occupied]"


/obj/structure/displaycase/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	
	if(destroyed && occupied)
		to_chat(user, "<span class='notice'>You deactivate the hover field built into the case.</span>")
		occupied = FALSE
		update_icon()
		return

	visible_message("<span class='warning'>[user] kicks the display case.</span>", "<span class='notice'>You kick the display case.</span>")
	take_damage(2)

//Quick destroyed case.
/obj/structure/displaycase/destroyed
	icon_state = "glassboxb0"
	max_integrity = 0
	occupied = FALSE
	destroyed = TRUE
