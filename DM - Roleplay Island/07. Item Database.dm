mob
	Admin
		verb
			Create_Item()
				set category = "Item Database"
				var/obj/Item/I = new/obj/Item()
				I.icon = input("Give an icon.") as icon
				var/nameobj = input("Insert a name for your new item!", "Item name")

				for(var/obj/Item/item in itemDatabase)
					if(I.name == item.name)
						src << output("This item already exists.", "ooc")
						return

				var/description = input("Insert a description for your new item", "Item description")
				var/requirements = input("Insert the requirements you'd like for this item", "Item requirements") as null|text
				I.name = nameobj
				I.desc = description
				I.requirements = requirements
				itemDatabase.Add(I)

			View_Item_Database()
				set category = "Item Database"
				var/obj/Item/choice = input("Select an item to see it's attributes!","itemDatabase view") as null|anything in itemDatabase
				if(!choice) return
				for(var/obj/Item/I in itemDatabase)
					if(I.name == choice.name)
						winset(usr,"perkwindow","is-visible=true;")
						usr << output(I.name, "perkwindow.namelabel")
						usr << output(I.desc, "perkwindow.desclabel")

			Delete_Item()
				set category = "Item Database"
				var/obj/Item/choice = input("Select an item to delete!","Item Delete") as null|anything in itemDatabase
				if(!choice) return
				for(var/obj/Item/I in itemDatabase)
					if(I.name == choice.name)
						itemDatabase.Remove(I)

			Give_Item(mob/M in world)
				set category = "Item Database"
				var/obj/Item/choice = input("Select an item to give to [M.charname]!","Item Delete") as null|anything in itemDatabase
				if(!choice) return
				M.contents += choice

			Remove_Item_From_Player(mob/M in world)
				set category = "Item Database"
				var/list/items = list()
				for(var/obj/Item/I in src.contents)
					items.Add(I)
				var/obj/Item/choice = input("Select a perk to remove from [M.charname]!","Item Delete") as null|obj in items
				if(!choice) return
				M.contents -= choice
