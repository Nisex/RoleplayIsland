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
		var/requirements = ""
		Click()
			winset(usr,"itemwindow","is-visible=true;")
			usr << output(src.name, "itemwindow.namelabel")
			usr << output(src.desc, "itemwindow.desclabel")
			if(src.requirements != "") usr << output(src.requirements, "perkwindow.reqlabel")

	Technique
		name = ""
		desc = ""
		var/requirements = ""
		var/turncooldown = 3
		Click()
			winset(usr, "techniqueWindow", "is-visible=true;")
			usr << output(src.name, "techniqueWindow.namelabel")
			usr << output(src.desc, "techniqueWindow.desclabel")
			if(src.requirements != "") usr << output(src.requirements, "techniqueWindow.reqlabel")
