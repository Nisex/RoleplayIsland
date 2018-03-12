/*
	These are simple defaults for your project.
 */
var
	global
		setting
		list/admins = list("Rubythemapper", "SoulReaver69", "Niise")

		list/database = list()
		list/itemDatabase = list()
		list/techniqueDatabase = list()

		list/locations = list("Main Area")
		list/locationDescriptions = list("A beginning area that everyone starts on.")
		/* Perhaps these locations should be changed by an object, which holds a name, description and a group */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default
	view = 6		// show up to 6 tiles outward from center (13x13 view)
	loop_checks=0
	//--- After default
	name = "Roleplay Island"
	status = "Current setting: Original"
	visibility = 0 //It won't be seen in the hub or the launcher
	hub = "Playtard.RoleplayIsland"
	hub_password = "donottemptmefrodo"

	New()
		LoadWorld()
		..()
	Del()
		WorldSave()
		..()


// Make objects move 8 pixels per tick when walking
mob
	step_size = 8

obj
	step_size = 8

