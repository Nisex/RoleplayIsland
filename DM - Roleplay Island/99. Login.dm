mob
	Login()
		if(src.location == "")
			src.location = locations[1]
		src << "Welcome to Roleplay Island - Current setting: [setting]. Your current location: [location]"
		src.verbs += typesof(/mob/Player/verb)
		// if(src.ley in enforcers)
		// if(src.key in moderators)
		if(src.key in admins)
			src.verbs += typesof(/mob/Enforcer/verb)
			src.verbs += typesof(/mob/Admin/verb)
			src.gm = 3
		..()