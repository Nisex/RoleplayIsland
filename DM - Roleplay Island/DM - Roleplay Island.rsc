�   l�-A_s�Z�Z;
  Simple interface.dmf macro "macro1"
	elem 
		name = "Return"
		command = "Say "
	elem 
		name = "O"
		command = "OOC "


menu "menu"
	elem 
		name = "Character"
		command = ""
		saved-params = "is-checked"
	elem 
		name = "Change Name"
		command = "ChangeName"
		category = "Character"
		saved-params = "is-checked"
	elem 
		name = "Name Color"
		command = "PickNameColor "
		category = "Character"
		saved-params = "is-checked"
	elem 
		name = "File"
		command = ""
		saved-params = "is-checked"
	elem 
		name = "Save"
		command = "Save "
		category = "File"
		saved-params = "is-checked"
	elem 
		name = "&Quit"
		command = ".quit"
		category = "File"
		saved-params = "is-checked"


window "default"
	elem "default"
		type = MAIN
		pos = 281,0
		size = 878x650
		anchor1 = none
		anchor2 = none
		background-color = #000000
		is-default = true
		saved-params = "pos;size;is-minimized;is-maximized"
		keep-aspect = true
		macro = "macro"
		menu = "menu"
	elem "info1"
		type = INFO
		pos = 566,40
		size = 296x408
		anchor1 = 65,6
		anchor2 = 98,69
		text-color = #ffffff
		background-color = #000000
		border = sunken
		drop-zone = false
		saved-params = ""
		highlight-color = #00ffff
		tab-text-color = #ffffff
		tab-background-color = #000000
	elem "label2"
		type = LABEL
		pos = 16,596
		size = 28x20
		anchor1 = 2,91
		anchor2 = 5,94
		text-color = #ffffff
		background-color = #000000
		saved-params = ""
		text = "Say:"
		align = right
		text-wrap = true
	elem "input2"
		type = INPUT
		pos = 48,596
		size = 496x20
		anchor1 = 5,91
		anchor2 = 62,94
		text-color = #ffffff
		background-color = #000000
		border = sunken
		saved-params = ""
		command = "Say"
	elem "label1"
		type = LABEL
		pos = 16,620
		size = 28x20
		anchor1 = 2,95
		anchor2 = 5,98
		text-color = #ffffff
		background-color = #000000
		saved-params = ""
		text = "OOC:"
		align = right
		text-wrap = true
	elem "input1"
		type = INPUT
		pos = 48,622
		size = 496x20
		anchor1 = 5,95
		anchor2 = 62,98
		text-color = #ffffff
		background-color = #000000
		border = sunken
		saved-params = ""
		command = "OOC"
	elem "ooc"
		type = OUTPUT
		pos = 16,464
		size = 528x120
		anchor1 = 2,71
		anchor2 = 62,89
		text-color = #ffffff
		background-color = #000000
		border = sunken
		saved-params = "max-lines"
	elem "ic"
		type = OUTPUT
		pos = 16,40
		size = 528x408
		anchor1 = 2,6
		anchor2 = 62,69
		text-color = #ffffff
		background-color = #000000
		border = sunken
		saved-params = "max-lines"
		enable-http-images = true


		pos = 16,464
		size = 528x120
		anchor1 = 2,71
		anchor2 = 62,89
		text-color = #ffffff
		background-color = #000000
		border = sunken
		saved-params = "max-lines"
	elem "ic"
		type = OUTPUT
		pos = 16,40
		size = 528x408
		anchor1 = 2,6
		anchor2 = 62,69
		text-color = #ffffff
		background-color = #000000
		border = sunken
		saved-params = "max-lines"
		enable-http-images = true

e

