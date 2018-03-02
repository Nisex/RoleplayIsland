var/global/list/locations = list("Main Area")
var/global/list/locationDescriptions = list("A beginning area that everyone starts on.")

mob
	var
		location = ""
		charname = "placeholder"
		travelcooldown = 0
		cantravel = 1


	verb
		Travel()
			var/choice
			choice = input("Choose a location", "Location") in locations
			var/index = locations.Find(choice)
			var/description = locationDescriptions[index]
			switch(input("[choice]\n[description]\nAre you sure you want to travel here?", "Confirm") in list("Yes", "No"))
				if("Yes")
					if(src.cantravel)
						src.location = choice
						src.cantravel = 0
						src.travelcooldown = 600
						src.TravelCooldown()
						src << output("<font color = \"blue\">You have successfuly travelled to [choice]! </font>", "ooc")
					else
						src << output("<font color = \"blue\">Travelling has a cooldown, please wait before travelling again.\n You may travel again in [src.travelcooldown] seconds </font>", "ooc")

					return
				if("No")
					return




	proc
		TravelCooldown()
			src.travelcooldown = src.travelcooldown - 1
			sleep(10) //10 = 1 seg
			if(src.travelcooldown == 0)
				src.cantravel = 1
			else
				src.TravelCooldown()
	Admin
		verb
			AddLocation(loc as text)
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

			ResetTravel()
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
				M << output("<b> Your travel time has been cleared by [src.charname] </b>", "ooc")

