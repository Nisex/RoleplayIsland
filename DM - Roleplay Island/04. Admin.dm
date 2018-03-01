var/global/list/admins = list("Rubythemapper", "SoulReaver69")

mob
	Enforcer
		verb
			CheckSetting()
				if(setting)
					usr<<output("Current setting: [setting]", "ooc")
				else
					return
	Admin
		verb
			ChangeSetting(sett as text)
				set category = "Admin"
				if(sett)
					setting = sett
					world.status = "Current setting: [setting]"
					usr<<output("<font color='red'>You have changed the world status to '[setting]'</font>", "ooc")

			AddLocation(loc as text)
				set category = "Admin"
				if(loc)
					locations.Add(loc)
					usr<<output("<font color='red'>You have added the new location - [loc]!</font>", "ooc")