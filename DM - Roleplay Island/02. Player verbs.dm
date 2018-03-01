mob
	Player
		verb
			Say(msg as text)
				set name="Say"
				set hidden = 1
				set desc="Talk to those on your location."
				if(msg)
					for(var/mob/v in world)
						if(v.location == usr.location)
							v<<output("<font color='[usr.setcolor]'>[usr.charname]</font> says: [msg]","ic")

			OOC(msg as text)
				set name="OOC"
				set hidden = 1
				set desc="Talk to those on the server, out of character."
				if(msg)
					for(var/mob/v in world)
						v<<output("<font color='[usr.setcolor]'>[usr] </font>:[msg]", "ooc")

			ChangeName(msg as text)
				if(msg)
					usr.charname = msg
					usr << output("You have changed your name to [msg]","ooc")

			PickNameColor(c as color)
				set hidden = 1
				if(c)
					usr.setcolor = c





