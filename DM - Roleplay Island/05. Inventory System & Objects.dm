mob
	Stat()
		statpanel("Inventory")
		stat("Ryo: ", src.ryo)
		for(var/obj/Item/I in src.contents)
			stat(I)
		statpanel("Perks")
		for(var/obj/Perk/P in src.contents)
			stat(P)


obj
	Perk
		name = ""
		desc = ""
		var/requirements = ""
		Click()
			winset(usr,"perkwindow","is-visible=true;")
			usr << output(src.name, "perkwindow.namelabel")
			usr << output(src.desc, "perkwindow.desclabel")
			if(src.requirements != "") usr << output(src.requirements, "perkwindow.reqlabel")
	Item
		name = ""
		desc = ""