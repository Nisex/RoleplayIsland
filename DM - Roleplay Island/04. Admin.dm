var/global/list/Admin = {"Rubythemapper"}

mob
	Admin
		verb
			changeStatus(setting as text)
				if(setting)
					world.status = "Current setting: [setting]"

			addLocation(loc as text)
				if(loc)
					locations.Add(loc)