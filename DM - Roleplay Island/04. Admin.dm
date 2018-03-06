var/global/list/admins = list("Rubythemapper", "SoulReaver69", "Niise")

mob
	Enforcer
		verb
			Check_Setting()
				if(setting)
					usr<<output("<b>Current setting: [setting]</b>", "ooc")
				else
					return
	Admin
		verb
			Change_Setting(sett as text)
				set category = "Admin"
				if(sett)
					switch(input("Are you sure you'd like the new setting to be [sett]?") in list("Yes","No"))
						if("Yes")
							setting = sett
							world.status = "Current setting: [setting]"
							usr<<output("<font color='red'>You have changed the world status to '[setting]'</font>", "ooc")
							world << output("<b><font color='yellow'> [src] has changed the setting to [setting] </font></b>", "ooc")
						if("No")
							return

			Add_Admin(mob/M in world)
				set category = "Admin"
				switch(input("Are you sure you want to add [M] to the admin list?") in list("Yes","No"))
					if("Yes")
						if(admins.Find(M.key, 1, admins.len) != 0)
							admins.Add(M.key)
							M.gm = 3
							src << output("The person you picked was added to the admin list","ooc")
						else
							if(M.gm != 3)
								M.gm = 3
							src << output("<font color='yellow'>They're already an admin.</font>", "ooc")
					if("No")
						return

			SaveWorld()
				set category = "Admin"
				set name = "World Save"
				WorldSave()
				world << output("<b><font color=\"yellow\">[src] has saved the world </font></b>", "ooc")

			Add_Location(loc as text)
				set category = "Admin"
				if(loc)
					switch(input("[loc]\nAre you sure you want to create this location?", "Confirm") in list("Yes", "No"))
						if("Yes")
							locations.Add(loc)
							var/desc = input("Add a description to your new area.", "Description")
							switch(input("[desc]\nIs this the right description?", "Confirm") in list("Yes", "No"))
								if("Yes")
									locationDescriptions.Add(desc)
									usr<<output("<font color='red'>You have added the new location - [loc]!</font>", "ooc")

			Reset_Travel()
				set category = "Admin"
				var/list/playerListName = list()
				var/list/playerList = list()

				for(var/mob/M in world)
					playerListName.Add(M.charname)
					playerList.Add(M)
				playerListName.Add("Cancel")

				var/choice = input("Select a player", "Selection") in playerListName
				if(choice == "Cancel")
					return
				var/index = playerListName.Find(choice,1,playerListName.len)
				var/mob/M = playerList[index]

				M.cantravel = 1
				M.travelcooldown = 0

				src << output("<b> You have resetted [M.charname]'s travel time! </b>", "ooc")
				M << output("<b> Your travel time has been cleared by [src.key] </b>", "ooc")