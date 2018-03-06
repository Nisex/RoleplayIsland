mob
	var
		setcolor = "#FFFFFF"	//For default beliefs
		gm = 0					//For GM purposes. 3 = Admin, 2 = Moderator, 1 = Enforcer
		location = ""			//Current location, followed by the character's name, if they can travel or not and the cooldown as to when they can travel again.
		charname = "placeholder"
		travelcooldown = 0
		cantravel = 1
		ryo = 100
