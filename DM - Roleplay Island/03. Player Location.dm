var/global/list/locations = list("Main Area")
var/global/list/locationDescriptions = list("A beginning area that everyone starts on.")
/* Could have done locations in only one list, by applying objects but decided to go with 2 lists for the sake of understanding how these work. */

mob
	verb
		Travel()
			var/choice
			choice = input("Choose a location", "Location") in locations
			var/index = locations.Find(choice)
			var/description = locationDescriptions[index]
			switch(input("[choice]\n[description]\nAre you sure you want to travel here?", "Confirm") in list("Yes", "No"))
				if("Yes")
					if(src.cantravel)
						if(src.location != choice)
							src.location = choice
							src.cantravel = 0
							src.travelcooldown = 600
							src << output("<font color = \"blue\">You have successfuly arrived at [choice]! </font>", "ooc")
							src.TravelCooldown()
						else
							src << output("<font color = \"red\">You're already there, please choose a different location! </font>","ooc")
					else
						src << output("<font color = \"blue\">You're already travelling.\n You may travel again in [src.travelcooldown] seconds </font>", "ooc")

					return
				if("No")
					return

	proc
		TravelCooldown()
			src.travelcooldown = src.travelcooldown - 1
			sleep(10) //10 = 1 seg
			if(src.travelcooldown == 0)
				src.cantravel = 1
				return
			else
				src.TravelCooldown()