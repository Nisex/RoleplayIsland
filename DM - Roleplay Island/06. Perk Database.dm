var/global/list/database = list()

mob
	Admin
		verb
			Create_Perk()
				set category = "Admin"
				var/obj/Perk/P = new/obj/Perk()
				P.icon = input("Give an icon.") as icon
				var/nameobj = input("Insert a name for your new perk!", "Perk name")
				var/description = input("Insert a description for your new perk", "Perk description")
				switch(input("Does your perk have any requirements?", "Requirements?") in list("Yes", "No"))
					if("Yes")
						var/requirements = input("Insert the requirements below:", "Requirements!")
						P.requirements = requirements
				P.name = nameobj
				P.desc = description
				for(var/obj/perk in database)
					if(P.name == perk.name)
						src << output("There is a perk with the same name already.", "ooc")
						return
				database.Add(P)

			View_Database()
				set category = "Admin"
				var/obj/Perk/choice = input("Select a perk to see it's attributes!","Database view") as null|anything in database
				if(!choice) return
				for(var/obj/Perk/P in database)
					if(P.name == choice.name)
						winset(src,"perkwindow","is-visible=true;")
						src << output(P.name, "perkwindow.namelabel")
						src << output(P.desc, "perkwindow.desclabel")
						if(P.requirements != "") src << output(P.requirements, "perkwindow.reqlabel")

			Delete_Perk()
				set category = "Admin"
				var/obj/Perk/choice = input("Select a perk to delete!","Perk Delete") as null|anything in database
				if(!choice) return
				for(var/obj/Perk/P in database)
					if(P.name == choice.name)
						database.Remove(P)

			Give_Perk(mob/M in world)
				set category = "Admin"
				var/obj/Perk/choice = input("Select a perk to give to [M.charname]!","Perk Delete") as null|anything in database
				if(!choice) return
				M.contents += choice

			Remove_Perk_From_Player(mob/M in world)
				set category = "Admin"
				var/list/perks = list()
				for(var/obj/Perk/P in src.contents)
					perks.Add(P)
				var/obj/Perk/choice = input("Select a perk to remove from [M.charname]!","Perk Delete") as null|obj in perks
				if(!choice) return
				M.contents -= choice
