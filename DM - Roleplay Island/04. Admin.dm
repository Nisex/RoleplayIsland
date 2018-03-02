var/global/list/admins = list("Rubythemapper", "SoulReaver69")

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