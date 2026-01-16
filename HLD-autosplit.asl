state("HyperLightDrifter", "7/21/2017") {
	/* optimal steam patch */
	uint room : 0x255B1F10;
	double isLoading : 0x255A7E24, 0x0, 0x0, 0x10, 0x0, 0xC, 0x28, 0x370;
	uint moduleCount : 0x255B2648, 0xA5C, 0x18, 0x24;
	uint gameState : 0x255A7E0C, 0xAC, 0xC, 0xC;
	uint hordeEnd : 0x255B2648, 0xA60, 0x18, 0x24;
	uint isPaused : 0x255AF150, 0x0, 0x144, 0x3C, 0xD8;
}

state("HyperLightDrifter", "2/7/2019") {
	/* optimal gog patch */
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
	uint room : 0x00C3CA38, 0x0;
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
	} else if (modules.First().ModuleMemorySize == 630644736) {
		version = "6/26/2017";
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

	settings.Add("start", false, "Start");
	settings.Add("ngstart", false, "File Creation", "start");
	settings.SetToolTip("ngstart", "Start the timer on creating a new file (any mode, including boss rush)");
	settings.Add("hordestart", false, "Horde Start", "start");
	settings.SetToolTip("hordestart", "Start the timer on entering any horde arena");
	settings.Add("anyload", false, "Any Transition", "start");
	settings.SetToolTip("anyload", "Start the timer on any transition");

	settings.Add("Alt Drifter", false);
	settings.SetToolTip("Alt Drifter", "Final split on entering the credits");
	settings.Add("horde", false, "Horde Complete");
	settings.SetToolTip("horde", "Split on beating the 10th wave in any horde mode arena");
	settings.Add("Rooms", false);
	settings.SetToolTip("Rooms", "Split on every room transition");

	settings.Add("Transitions", false);
	settings.Add("intro", false, "Intro Done", "Transitions");
	settings.SetToolTip("intro", "Split when completing the intro area");
	settings.Add("MRE", false, "MRE", "Transitions");
	settings.SetToolTip("MRE", "Split on entering the monolith room for the first time");
	settings.Add("lab", false, "Lab Elevator", "Transitions");
	settings.SetToolTip("lab", "Split when using the elevator after MeltyMashArena");
	settings.Add("altarquit", false, "AltarThrone Quitout", "Transitions");
	settings.SetToolTip("altarquit", "Split when quitting to menu from AltarThrone");
	settings.Add("looplab", false, "Loop Lab Elevator", "Transitions");
	settings.SetToolTip("looplab", "Split when using the elevator after LoopLAB");
	settings.Add("prison1", false, "Prison 1 Exit", "Transitions");
	settings.SetToolTip("prison1", "Split when leaving PrisonHAL");
	settings.Add("southelevator", false, "South Elevator", "Transitions");
	settings.SetToolTip("southelevator", "Split when taking an elevator from the main south room for the first time");

	settings.Add("eastmodules", false, "East Module Activations");
	settings.Add("watertunnelcl", false, "Water Tunnel Module", "eastmodules");
	settings.SetToolTip("watertunnelcl", "Split when activating the module in WaterTunnelLAB");
	settings.Add("megahugecl", false, "Megahuge Lab Module", "eastmodules");
	settings.SetToolTip("megahugecl", "Split when activating the module in MegaHugeLAB");
	settings.Add("flamepitcl", false, "Flamepit Lab Module", "eastmodules");
	settings.SetToolTip("flamepitcl", "Split when activating the module in FlamePitLAB");
	settings.Add("bigbogcl", false, "Bigbog Lab Module", "eastmodules");
	settings.SetToolTip("bigbogcl", "Split when activating the module in BigBogLab");
	settings.Add("bogtemplecl", false, "Bog Temple Module", "eastmodules");
	settings.SetToolTip("bogtemplecl", "Split when activating the module in BogTempleCamp");
	settings.Add("dockslabcl", false, "Docks Lab Module", "eastmodules");
	settings.SetToolTip("dockslabcl", "Split when activating the module in DocksLab");
	settings.Add("frogarenacl", false, "Frog Arena Module", "eastmodules");
	settings.SetToolTip("frogarenacl", "Split when activating the module in FrogArena");
	settings.Add("eastloopcl", false, "East Loop Module", "eastmodules");
	settings.SetToolTip("eastloopcl", "Split when activating the module in EastLoop");

	settings.Add("northmodules", false, "North Module Activations");
	settings.Add("northhallcl", false, "Dark Room Module", "northmodules");
	settings.SetToolTip("northhallcl", "Split when activating the module in NorthHall");
	settings.Add("shrinevaultcl", false, "Shrine Path Module", "northmodules");
	settings.SetToolTip("shrinevaultcl", "Split when activating the module in ShrinePath2VAULT");
	settings.Add("birdscl", false, "Birds Module", "northmodules");
	settings.SetToolTip("birdscl", "Split when activating the module in StairAscent");
	settings.Add("towerlockcl", false, "Pillar Room Module", "northmodules");
	settings.SetToolTip("towerlockcl", "Split when activating the module in TowerLock");
	settings.Add("crusharenacl", false, "Crush Arena Module", "northmodules");
	settings.SetToolTip("crusharenacl", "Split when activating the module in CrushArena");
	settings.Add("dropspiralcl", false, "Drop Spiral Module", "northmodules");
	settings.SetToolTip("dropspiralcl", "Split when activating the module in DropSpiralOpen");
	settings.Add("droparenacl", false, "Drop Arena Module", "northmodules");
	settings.SetToolTip("droparenacl", "Split when activating the module in DropArena");
	settings.Add("altarcl", false, "Cathedral Arena Module", "northmodules");
	settings.SetToolTip("altarcl", "Split when activating the module in AltarThrone");

	settings.Add("westmodules", false, "West Module Activations");
	settings.Add("prisonvaultcl", false, "Prison Vault Module", "westmodules");
	settings.SetToolTip("prisonvaultcl", "Split when activating the module in PrisonHALVAULT");
	settings.Add("thewoodcl", false, "The Wood Module", "westmodules");
	settings.SetToolTip("thewoodcl", "Split when activating the module in TheWood");
	settings.Add("meadowoodcl", false, "Dog Module", "westmodules");
	settings.SetToolTip("meadowoodcl", "Split when activating the module in MeadowoodCorner");
	settings.Add("cliffsidecellscl", false, "Cliffside Cells Module", "westmodules");
	settings.SetToolTip("cliffsidecellscl", "Split when activating the module in CliffsideCellsRedux");
	settings.Add("prisonhallcl", false, "Prison Hall Module", "westmodules");
	settings.SetToolTip("prisonhallcl", "Split when activating the module in PrisonHallEnd");
	settings.Add("thinforestcl", false, "Icex Module", "westmodules");
	settings.SetToolTip("thinforestcl", "Split when activating the module in ThinForestLowSecret");
	settings.Add("meadowvaultcl", false, "Meadow Vault Module", "westmodules");
	settings.SetToolTip("meadowvaultcl", "Split when activating the module in BigMeadowVault");
	settings.Add("tanukitroublecl", false, "Tanuki Trouble Module", "westmodules");
	settings.SetToolTip("tanukitroublecl", "Split when activating the module in TanukiTrouble");

	settings.Add("southmodules", false, "South Module Activations");
	settings.Add("bigonecl", false, "Big One Module", "southmodules");
	settings.SetToolTip("bigonecl", "Split when activating the module in TABigOne");
	settings.Add("gateblockcl", false, "Gate Block Module", "southmodules");
	settings.SetToolTip("gateblockcl", "Split when activating the module in CGateBlock");
	settings.Add("endhallcl", false, "Bullet Baker Module", "southmodules");
	settings.SetToolTip("endhallcl", "Split when activating the module in CEndHall");
	settings.Add("linkupcl", false, "Gauntlet Linkup Modules", "southmodules");
	settings.SetToolTip("linkupcl", "Split when activating either module in GauntletLinkup"); /* implement special case for this room? */
	settings.Add("pillarbirdcl", false, "Charles Room Module", "southmodules");
	settings.SetToolTip("pillarbirdcl", "Split when activating the module in APillarBird");
	settings.Add("cspiralcl", false, "CSpiral Module", "southmodules");
	settings.SetToolTip("cspiralcl", "Split when activating the module in CSpiral");
	settings.Add("dashmodulecl", false, "Dash Challenge Module", "southmodules");
	settings.SetToolTip("dashmodulecl", "Split when activating the module in Gauntlet_Elevator");

	settings.Add("eastmoduletransitions", false, "East Module Transitions");
	settings.Add("watertunnel", false, "Water Tunnel Exit", "eastmoduletransitions");
	settings.SetToolTip("watertunnel", "Split when leaving WaterTunnelLAB after activating module");
	settings.Add("megahuge", false, "Megahuge Lab Exit", "eastmoduletransitions");
	settings.SetToolTip("megahuge", "Split when leaving MegaHugeLAB after activating module");
	settings.Add("flamepit", false, "Flamepit Lab Exit", "eastmoduletransitions");
	settings.SetToolTip("flamepit", "Split when leaving FlamePitLAB after activating module");
	settings.Add("bigbog", false, "Bigbog Lab Exit", "eastmoduletransitions");
	settings.SetToolTip("bigbog", "Split when leaving BigBogLab after activating module");
	settings.Add("bogtemple", false, "Bog Temple Exit", "eastmoduletransitions");
	settings.SetToolTip("bogtemple", "Split when leaving BogTempleCamp after activating module");
	settings.Add("dockslab", false, "Docks Lab Exit", "eastmoduletransitions");
	settings.SetToolTip("dockslab", "Split when leaving DocksLab after activating module");
	settings.Add("frogarena", false, "Frog Arena Exit", "eastmoduletransitions");
	settings.SetToolTip("frogarena", "Split when leaving FrogArena after activating module");
	settings.Add("eastloop", false, "East Loop Exit", "eastmoduletransitions");
	settings.SetToolTip("eastloop", "Split when leaving EastLoop after activating module");

	settings.Add("northmoduletransitions", false, "North Module Transitions");
	settings.Add("northhall", false, "Dark Room Exit", "northmoduletransitions");
	settings.SetToolTip("northhall", "Split when leaving NorthHall after activating module");
	settings.Add("shrinevault", false, "Shrine Path Vault Exit", "northmoduletransitions");
	settings.SetToolTip("shrinevault", "Split when leaving ShrinePath2VAULT after activating module");
	settings.Add("birds", false, "Birds Module Exit", "northmoduletransitions");
	settings.SetToolTip("birds", "Split when leaving StairAscent after activating module");
	settings.Add("towerlock", false, "Pillar Room Exit", "northmoduletransitions");
	settings.SetToolTip("towerlock", "Split when leaving TowerLock after activating module");
	settings.Add("crusharena", false, "Crush Arena Exit", "northmoduletransitions");
	settings.SetToolTip("crusharena", "Split when leaving CrushArena after activating module");
	settings.Add("dropspiral", false, "Drop Spiral Exit", "northmoduletransitions");
	settings.SetToolTip("dropspiral", "Split when leaving DropSpiralOpen after activating module");
	settings.Add("droparena", false, "Drop Arena Exit", "northmoduletransitions");
	settings.SetToolTip("droparena", "Split when leaving DropArena after activating module");
	settings.Add("altar", false, "Cathedral Arena Exit", "northmoduletransitions");
	settings.SetToolTip("altar", "Split when leaving AltarThrone after activating module");

	settings.Add("westmoduletransitions", false, "West Module Transitions");
	settings.Add("prisonvault", false, "Prison Vault Exit", "westmoduletransitions");
	settings.SetToolTip("prisonvault", "Split when leaving PrisonHALVAULT after activating module");
	settings.Add("thewood", false, "The Wood Exit", "westmoduletransitions");
	settings.SetToolTip("thewood", "Split when leaving TheWood after activating module");
	settings.Add("meadowood", false, "Dog Module Exit", "westmoduletransitions");
	settings.SetToolTip("meadowood", "Split when leaving MeadowoodCorner after activating module");
	settings.Add("cliffsidecells", false, "Cliffside Cells Exit", "westmoduletransitions");
	settings.SetToolTip("cliffsidecells", "Split when leaving CliffsideCellsRedux after activating module");
	settings.Add("prisonhall", false, "Prison Hall Exit", "westmoduletransitions");
	settings.SetToolTip("prisonhall", "Split when leaving PrisonHallEnd after activating module");
	settings.Add("thinforest", false, "Icex Module Exit", "westmoduletransitions");
	settings.SetToolTip("thinforest", "Split when leaving ThinForestLowSecret after activating module");
	settings.Add("meadowvault", false, "Meadow Vault Exit", "westmoduletransitions");
	settings.SetToolTip("meadowvault", "Split when leaving BigMeadowVault after activating module");
	settings.Add("tanukitrouble", false, "Tanuki Trouble Exit", "westmoduletransitions");
	settings.SetToolTip("tanukitrouble", "Split when leaving TanukiTrouble after activating module");

	settings.Add("southmoduletransitions", false, "South Module Transitions");
	settings.Add("bigone", false, "Big One Exit", "southmoduletransitions");
	settings.SetToolTip("bigone", "Split when leaving TABigOne after activating module");
	settings.Add("gateblock", false, "Gate Block Exit", "southmoduletransitions");
	settings.SetToolTip("gateblock", "Split when leaving CGateBlock after activating module");
	settings.Add("endhall", false, "Baker Module Exit", "southmoduletransitions");
	settings.SetToolTip("endhall", "Split when leaving CEndHall after activating module");
	settings.Add("linkup", false, "Gauntlet Linkup Exit", "southmoduletransitions");
	settings.SetToolTip("linkup", "Split when leaving GauntletLinkup after activating module");
	settings.Add("pillarbird", false, "Charles Room Exit", "southmoduletransitions");
	settings.SetToolTip("pillarbird", "Split when leaving APillarBird after activating module");
	settings.Add("cspiral", false, "CSpiral Exit", "southmoduletransitions");
	settings.SetToolTip("cspiral", "Split when leaving CSpiral after activating module");
	settings.Add("dashmodule", false, "Dash Challenge Exit", "southmoduletransitions");
	settings.SetToolTip("dashmodule", "Split when leaving Gauntlet_Elevator after activating module");

	settings.Add("pillars", false, "Pillar Transitions");
	settings.Add("westpillar", false, "West Pillar Exit", "pillars");
	settings.SetToolTip("westpillar", "Split when leaving TowerEnter");
	settings.Add("southpillar", false, "South Pillar Warp", "pillars");
	settings.SetToolTip("southpillar", "Split when warping from TowerSouth to TowerSouth");

	vars.modulerooms = new Dictionary<string, int>() {
		{"watertunnel", 174},
		{"megahuge", 181},
		{"flamepit", 183},
		{"bigbog", 193},
        {"bogtemple", 194},
		{"dockslab", 188},
		{"frogarena", 191},
		{"eastloop", 198},
		{"northhall", 86},
		{"shrinevault", 91},
		{"birds", 123},
        {"towerlock", 95},
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

onStart {
	vars.mre = false;
	vars.modulestate = false;
	vars.southelevator = false;
}

start {
	if (current.gameState == 5 && old.gameState == 0 && settings["ngstart"]) return true;

	if (current.room >= 73 && current.room <= 77 && old.room != current.room && settings["hordestart"]) return true;

	if (current.isLoading == 1 && settings["anyload"]) return true;
}


split {

	/* horde mode */
	if (current.room >= 73 && current.room <= 77 && current.hordeEnd == 1 && old.hordeEnd == 0 && current.isPaused == 0) {
		if (settings["horde"]) return true;
	}

	if (current.moduleCount != old.moduleCount && current.moduleCount == 1) {
            foreach (KeyValuePair<string, int> pair in vars.modulerooms) {
                if (settings[pair.Key + "cl"] && current.room == pair.Value) return true;
            }
		}

	if (current.room != old.room) {

		int r;

		if (settings["Rooms"]) {
			return true;
		}


		if (current.room == 61 && (old.room < 53 || old.room > 80)) {
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

		/* intro done */
		if (current.room == 51 && old.room == 50) {
			if (settings["intro"]) {
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

		/* loop lab elevator */
		if (current.room == 79 && old.room == 199) {
			if (settings["looplab"]) {
				return true;
			}
		}

		/* prison 1 exit */
		if (current.room != old.room && old.room == 227) {
			if (settings["prison1"]) {
				return true;
			}
		}

		/* first south elevator */
		if (current.room == 79 && old.room == 130) {
			if (settings["southelevator"] && !vars.southelevator) {
				vars.southelevator = true;
				return true;
			}
		}

				
		/* module transitions */
		foreach (KeyValuePair<string, int> pair in vars.modulerooms) {
			bool settingvalue = settings.ContainsKey(pair.Key) ? settings[pair.Key] : false;
			if (settingvalue && old.room == pair.Value && current.room != pair.Value && vars.modulestate == true && current.room != 5) return true;
		}
		/* reset module state after a transition */
		if (current.room != old.room) vars.modulestate = false;

		/* west pillar */
		if (old.room == 246 && current.room != 246) {
			if (settings["westpillar"]) return true;
		}
	}

	if (current.isLoading == 1 && old.isLoading == 0 && current.room == old.room && current.room == 130) {
		if (settings["southpillar"]) return true;
	}
}

update {
	if (current.moduleCount != old.moduleCount && current.moduleCount == 1) vars.modulestate = true;
}

isLoading {

	if (version != "7/21/2017" && version != "2/7/2019" && version != "6/26/2017") {
		return false;
	}

	return (current.isLoading == 1);

}
