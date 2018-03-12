mob
	Login()
		winset(src,"perkwindow","is-visible=false;loc=1,1")
		winset(src,"itemwindow", "is-visible=false;loc=1,1")
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
		if(!fexists("Saves/[src.ckey].sav"))
			src.charname = input("What is your character's name?", "Character name")
		else
			Load()
			src.TravelCooldown()
		..()

	Logout()
		src.Save()
		..()

mob
	verb
		SaveGame()
			set name = "Save"
			src.Save()
	proc
		Save()
			var/savefile/F = new("Saves/[src.ckey].sav")
			Write(F)
			src <<output("<font color='yellow'>Your game was saved.</font>", "ooc")
			sleep(1200)
			src.Save()
			..()

		Load()
			if(!src)
				return
			if(fexists("Saves/[src.ckey].sav"))
				var/savefile/F = new("Saves/[src.ckey].sav")
				Read(F)
proc
	WorldSave()
		var/savefile/F = new("Saves/world.sav")
		F["setting"] << setting
		F["locations"] << locations
		F["locationDescriptions"] << locationDescriptions
		F["admins"] << admins
		F["database"] << database
		F["itemDatabase"] << itemDatabase
		F["techniqueDatabase"] << techniqueDatabase


	LoadWorld()
		if(fexists("Saves/world.sav"))
			var/savefile/F = new("Saves/world.sav")
			F["setting"] >> setting
			F["locations"] >> locations
			F["locationDescriptions"] >> locationDescriptions
			F["admins"] >> admins
			F["database"] >> database
			F["itemDatabase"] >> itemDatabase
			F["techniqueDatabase"] >> techniqueDatabase