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
	settings.Add("Transitions", false);
	settings.Add("MRE", false, "MRE", "Transitions");
	settings.SetToolTip("MRE", "Split on entering the monolith room for the first time");
	settings.Add("warpnorth", false, "Warp North", "Transitions");
	settings.SetToolTip("warpnorth", "Split when warping north");
	settings.Add("westmodules", false, "West Module Transitions");
	settings.Add("prisonvault", false, "Prison Vault Exit", "westmodules");
	settings.SetToolTip("prisonvault", "Split when leaving PrisonHALVAULT");
	settings.Add("thewood", false, "The Wood Exit", "westmodules");
	settings.SetToolTip("thewood", "Split when leaving TheWood");
	settings.Add("meadowood", false, "Dog Module Exit", "westmodules");
	settings.SetToolTip("meadowood", "Split when leaving MeadowoodCorner");
	settings.Add("cliffsidecells", false, "Cliffside Cells Exit", "westmodules");
	settings.SetToolTip("cliffsidecells", "Split when leaving CliffsideCellsRedux");
	settings.Add("prisonhall", false, "Prison Hall Exit", "westmodules");
	settings.SetToolTip("prisonhall", "Split when leaving PrisonHallEnd");
	settings.Add("thinforest", false, "Icex Module Exit", "westmodules");
	settings.SetToolTip("thinforest", "Split when leaving ThinForestLowSecret");
	settings.Add("meadowvault", false, "Meadow Vault Exit", "westmodules");
	settings.SetToolTip("meadowvault", "Split when leaving BigMeadowVault");
	settings.Add("tanukitrouble", false, "Tanuki Trouble Exit", "westmodules");
	settings.SetToolTip("tanukitrouble", "Split when leaving TanukiTrouble");

	vars.mre = false;
	vars.modulerooms = new Dictionary<string, int>() {
		{"prisonvault", 210},
		{"thewood", 218},
		{"meadowood", 220},
		{"cliffsidecells", 226},
		{"prisonhall", 233},
		{"thinforest", 235},
		{"meadowvault", 240},
		{"tanukitrouble", 243}
	};
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

		int r;

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


		if (current.room == 53) {
			/* entered monolith room */
			if (settings["MRE"] && !vars.mre) {
				vars.mre = true;
				return true;
			}
		}
		if (current.room == 94 && (old.room < 93 || old.room > 124)) {
			/* warped to north */
			if (settings["warpnorth"]) return true;
		}		

		if (settings["prisonvault"]) {
			if (old.room == (r = vars.modulerooms["prisonvault"]) && current.room != r) return true;
		}
		if (settings["thewood"]) {
			if (old.room == (r = vars.modulerooms["thewood"]) && current.room != r) return true;
		}
		if (settings["meadowood"]) {
			if (old.room == (r = vars.modulerooms["meadowood"]) && current.room != r) return true;
		}
		if (settings["cliffsidecells"]) {
			if (old.room == (r = vars.modulerooms["cliffsidecells"]) && current.room != r) return true;
		}
		if (settings["prisonhall"]) {
			if (old.room == (r = vars.modulerooms["prisonhall"]) && current.room != r) return true;
		}
		if (settings["thinforest"]) {
			if (old.room == (r = vars.modulerooms["thinforest"]) && current.room != r) return true;
		}
		if (settings["meadowvault"]) {
			if (old.room == (r = vars.modulerooms["meadowvault"]) && current.room != r) return true;
		}
		if (settings["tanukitrouble"]) {
			if (old.room == (r = vars.modulerooms["tanukitrouble"]) && current.room != r) return true;
		}
	}
}

isLoading {

	if (version != "7/21/2017" && version != "2/7/2019") {
		return false;
	}

	return (current.isLoading == 1);

}
