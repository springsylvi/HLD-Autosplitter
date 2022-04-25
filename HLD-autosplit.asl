state("HyperLightDrifter", "7/21/2017") {
	/* latest Steam patch */
	uint room : 0x255B1F10;
	double isLoading : 0x255A7E24, 0x0, 0x0, 0x10, 0x0, 0xC, 0x28, 0x370;
}

state("HyperLightDrifter", "2/7/2019") {
	/* current patch */
	uint room : 0x255C60C0;
	double isLoading : 0x255BBFD4, 0x0, 0x0, 0x10, 0x0, 0xC, 0x28, 0x370;
}

state("HyperLightDrifter", "4/1/2016") {
	/* release patch */
	uint room : 0x2564C318;
}

startup {
	settings.Add("Warps", false);
	settings.SetToolTip("Warps", "Split when warping back to town");
	settings.Add("Alt Drifter", false);
	settings.SetToolTip("Alt Drifter", "Final split on entering the credits");
	settings.Add("Rooms", false);
	settings.SetToolTip("Rooms", "Split on every room transition");
	setting.Add("MRE", false);
	settings.SetToolTip("MRE", "Split on entering the monolith room from the front");
}

init {

	if (modules.First().ModuleMemorySize == 631357440) {
		version = "7/21/2017";
	} else if (modules.First().ModuleMemorySize == 629932032) {
		version = "2/7/2019";
	} else if (modules.First().ModuleMemorySize == 631992320) {
		version = "4/1/2016";
	} else {
		version = "unknown";
		print("module size = " + modules.First().ModuleMemorySize.ToString());
	}
}

/*
no path for newGame var?

start {
	if (current.newGame == 1 && old.newGame == 0) {
		return true;
	}
	return false;
}
*/

split {
	if (current.room != old.room) {

		if (settings["Rooms"]) {
			return true;
		}

		if (current.room == 61 && old.room > 80) {
			/* warping to town */
			if (settings["Warps"]) {
				return true;
			}
		}

		if (current.room == 8 && old.room == 262) {
			/* start of credits */
			if (settings["Alt Drifter"]) {
				return true;
			}
		}

		if (current.room == 53 && old.room == 50) {
			/* entered monolith room from front */
			if (settings["MRE"]) {
				return true;
			}
		}
	}
}

isLoading {

	if (version != "7/21/2017" && version != "2/7/2019") {
		return false;
	}

	return (current.isLoading == 1);

}
