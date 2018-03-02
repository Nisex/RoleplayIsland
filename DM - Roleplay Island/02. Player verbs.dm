mob
	Player
		verb
			Say(msg as text) // There is a bar for this.
				set name="Say"
				set hidden = 1
				set desc="Talk to those on your location."
				if(msg)
					for(var/mob/v in world)
						if(v.location == usr.location)
							v<<output("<font color='[usr.setcolor]'>[usr.charname]</font> says: [msg]","ic")

			OOC(msg as text) //There is a bar for this.
				set name="OOC"
				set hidden = 1
				set desc="Talk to those on the server, out of character."
				if(msg)
					for(var/mob/v in world)
						v<<output("<font color='[usr.setcolor]'>[usr] </font>:[msg]", "ooc")

			ChangeName(msg as text)
				set hidden = 1 //ChangeName and PickNameColor are both on the interface, no need to show them
				if(msg)
					src.charname = msg
					src << output("You have changed your name to [msg]","ooc")

			PickNameColor(c as color)
				set hidden = 1
				if(c)
					src << output("[c]", "ooc")
					src.setcolor = c





