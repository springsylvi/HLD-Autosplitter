state("HyperLightDrifter", "7/21/2017") {
	/* latest Steam patch */
	uint room : 0x255B1F10;
	double isLoading : 0x255A7E24, 0x0, 0x0, 0x10, 0x0, 0xC, 0x28, 0x370;
	uint moduleCount : 0x255B2648, 0xA5C, 0x18, 0x24;
	uint gameState : 0x255A7E0C, 0xAC, 0xC, 0xC;
	uint hordeEnd : 0x255B2648, 0xA60, 0x18, 0x24;
	uint isPaused : 0x255AF150, 0x0, 0x144, 0x3C, 0xD8;
}

state("HyperLightDrifter", "2/7/2019") {
	/* current patch */
	uint room : 0x255C60C0;
	double isLoading : 0x255BBFD4, 0x0, 0x0, 0x10, 0x0, 0xC, 0x28, 0x370;
	uint moduleCount : 0x255C67F8, 0xA5C, 0x18, 0x24;
	uint gameState : 0x255BBFBC, 0xAC, 0xC, 0xC;
	uint hordeEnd : 0x255C67F8, 0xA60, 0x18, 0x24;
	uint isPaused : 0x255C3300, 0x0, 0x144, 0x3C, 0xD8;
}

state("HyperLightDrifter", "4/1/2016") {
	/* release patch */
	uint room : 0x2564C318;
}

state("HyperLightDrifter", "6/26/2017") {
	/* controller test patch */
	uint room : 0x00C3CA38, 0x0; /* DONE */
	double isLoading : 0x25504848, 0x34, 0x10, 0x10, 0x440;
	uint moduleCount : 0x25515990, 0xA5C, 0x18, 0x24;
	uint gameState : 0x2550CC04, 0xAC, 0xC, 0xC;
	uint hordeEnd : 0x25515990, 0xA60, 0x18, 0x24;
	uint isPaused : 0x255125B8, 0x0, 0x144, 0x3C, 0xC8;
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


startup {
	settings.Add("Warps", false);
	settings.SetToolTip("Warps", "Split when warping to an area from outside that area");
	settings.Add("warptown", false, "Warp Town", "Warps");
	settings.SetToolTip("warptown", "Split when warping to town");
	settings.Add("warpeast", false, "Warp East", "Warps");
	settings.SetToolTip("warpeast", "Split when warping east");
	settings.Add("warpnorth", false, "Warp North", "Warps");
	settings.SetToolTip("warpnorth", "Split when warping north");
	settings.Add("warpwest", false, "Warp West", "Warps");
	settings.SetToolTip("warpwest", "Split when warping west");
	settings.Add("warpsouth", false, "Warp South", "Warps");
	settings.SetToolTip("warpsouth", "Split when warping south");

	settings.Add("Alt Drifter", false);
	settings.SetToolTip("Alt Drifter", "Final split on entering the credits");
	settings.Add("horde", false, "Horde Complete");
	settings.SetToolTip("horde", "Split on beating the 10th wave in any horde mode arena");
	settings.Add("Rooms", false);
	settings.SetToolTip("Rooms", "Split on every room transition");
	settings.Add("Transitions", false);
	settings.Add("MRE", false, "MRE", "Transitions");
	settings.SetToolTip("MRE", "Split on entering the monolith room for the first time");
	settings.Add("lab", false, "Lab Elevator", "Transitions");
	settings.SetToolTip("lab", "Split when using the elevator after MeltyMashArena");
	settings.Add("altarquit", false, "AltarThrone Quitout", "Transitions");
	settings.SetToolTip("altarquit", "Split when quitting to menu from AltarThrone");

	settings.Add("eastmodules", false, "East Module Transitions");
	settings.Add("watertunnel", false, "Water Tunnel Exit", "eastmodules");
	settings.SetToolTip("watertunnel", "Split when leaving WaterTunnelLAB");
	settings.Add("megahuge", false, "Megahuge Lab Exit", "eastmodules");
	settings.SetToolTip("megahuge", "Split when leaving MegaHugeLAB");
	settings.Add("flamepit", false, "Flamepit Lab Exit", "eastmodules");
	settings.SetToolTip("flamepit", "Split when leaving FlamePitLAB");
	settings.Add("bigbog", false, "Bigbog Lab Exit", "eastmodules");
	settings.SetToolTip("bigbog", "Split when leaving BigBogLab");
	settings.Add("dockslab", false, "Docks Lab Exit", "eastmodules");
	settings.SetToolTip("dockslab", "Split when leaving DocksLab");
	settings.Add("frogarena", false, "Frog Arena Exit", "eastmodules");
	settings.SetToolTip("frogarena", "Split when leaving FrogArena");
	settings.Add("eastloop", false, "East Loop Exit", "eastmodules");
	settings.SetToolTip("eastloop", "Split when leaving EastLoop");

	settings.Add("northmodules", false, "North Module Transitions");
	settings.Add("northhall", false, "Dark Room Exit", "northmodules");
	settings.SetToolTip("northhall", "Split when leaving NorthHall");
	settings.Add("shrinevault", false, "Shrine Path Vault Exit", "northmodules");
	settings.SetToolTip("shrinevault", "Split when leaving ShrinePath2VAULT");
	settings.Add("birds", false, "Birds Module Exit", "northmodules");
	settings.SetToolTip("birds", "Split when leaving StairAscent");
	settings.Add("crusharena", false, "Crush Arena Exit", "northmodules");
	settings.SetToolTip("crusharena", "Split when leaving CrushArena");
	settings.Add("dropspiral", false, "Drop Spiral Exit", "northmodules");
	settings.SetToolTip("dropspiral", "Split when leaving DropSpiralOpen");
	settings.Add("droparena", false, "Drop Arena Exit", "northmodules");
	settings.SetToolTip("droparena", "Split when leaving DropArena");
	settings.Add("altar", false, "Cathedral Arena Exit", "northmodules");
	settings.SetToolTip("altar", "Split when leaving AltarThrone");

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

	settings.Add("southmodules", false, "South Module Transitions");
	settings.Add("bigone", false, "Big One Exit", "southmodules");
	settings.SetToolTip("bigone", "Split when leaving TABigOne");
	settings.Add("gateblock", false, "Gate Block Exit", "southmodules");
	settings.SetToolTip("gateblock", "Split when leaving CGateBlock");
	settings.Add("endhall", false, "Baker Module Exit", "southmodules");
	settings.SetToolTip("endhall", "Split when leaving CEndHall");
	settings.Add("linkup", false, "Gauntlet Linkup Exit", "southmodules");
	settings.SetToolTip("linkup", "Split when leaving GauntletLinkup");
	settings.Add("pillarbird", false, "Charles Room Exit", "southmodules");
	settings.SetToolTip("pillarbird", "Split when leaving APillarBird");
	settings.Add("cspiral", false, "CSpiral Exit", "southmodules");
	settings.SetToolTip("cspiral", "Split when leaving CSpiral");
	settings.Add("dashmodule", false, "Dash Challenge Exit", "southmodules");
	settings.SetToolTip("dashmodule", "Split when leaving Gauntlet_Elevator");

	settings.Add("pillars", false, "Pillar Transitions");
	settings.Add("westpillar", false, "West Pillar Exit", "pillars");
	settings.SetToolTip("westpillar", "Split when leaving TowerEnter");

	vars.mre = false;
	vars.modulerooms = new Dictionary<string, int>() {
		{"watertunnel", 174},
		{"megahuge", 181},
		{"flamepit", 183},
		{"bigbog", 193},
		{"dockslab", 188},
		{"frogarena", 191},
		{"eastloop", 198},
		{"northhall", 86},
		{"shrinevault", 91},
		{"birds", 123},
		{"crusharena", 104},
		{"dropspiral", 106},
		{"droparena", 109},
		{"altar", 118},
		{"prisonvault", 210},
		{"thewood", 218},
		{"meadowood", 220},
		{"cliffsidecells", 226},
		{"prisonhall", 233},
		{"thinforest", 235},
		{"meadowvault", 240},
		{"tanukitrouble", 243},
		{"bigone", 139},
		{"gateblock", 140},
		{"endhall", 144},
		{"linkup", 158},
		{"pillarbird", 160},
		{"cspiral", 161},
		{"dashmodule", 132}
	};
}


start {
	if (current.gameState == 5 && old.gameState == 0) return true;
}


split {

	/* horde mode */
	if (current.room >= 73 && current.room <= 77 && current.hordeEnd == 1 && old.hordeEnd == 0 && current.isPaused == 0) {
		if (settings["horde"]) return true;
	}

	if (current.room != old.room) {

		int r;

		if (settings["Rooms"]) {
			return true;
		}


		if (current.room == 61 && (old.room < 60 || old.room > 80)) {
			if (settings["warptown"]) return true;
		}
		if (current.room == 175 && (old.room < 172 || old.room > 200)) {
			if (settings["warpeast"]) return true;
		}
		if (current.room == 94 && (old.room < 93 || old.room > 124)) {
			if (settings["warpnorth"]) return true;
		}
		if (current.room == 219 && (old.room < 218 || old.room > 253)) {
			if (settings["warpwest"]) return true;
		}
		if (current.room == 130 && (old.room < 128 || old.room > 165)) {
			if (settings["warpsouth"]) return true;
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

		/* lab elevator */
		if (current.room == 79 && old.room == 184) {
			if (settings["lab"]) {
				return true;
			}
		}

		/* altarthrone quitout */
		if (current.room == 5 && old.room == 118) {
			if (settings["altarquit"]) {
				return true;
			}
		}
				
		/* module transitions */
		foreach (KeyValuePair<string, int> pair in vars.modulerooms) {
			if (settings[pair.Key] && old.room == pair.Value && current.room != pair.Value && current.room != 5) return true;
		}

		/* west pillar */
		if (old.room == 246 && current.room != 246) {
			if (settings["westpillar"]) return true;
		}
	}
}

isLoading {

	if (version != "7/21/2017" && version != "2/7/2019") {
		return false;
	}

	return (current.isLoading == 1);

}
