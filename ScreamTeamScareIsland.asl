state("MonstersInc")
{
	string20 level : 0x7383FE7;								//String of the level you are currently in.
	
	int nerve : "MonstersInc.exe", 0x07383EB0, 0x120;		//Shows the last nerve that was scared (each nerve has it's own number 1-8), Changes on nerve scare. 
															//Resets to 0 when exiting to Island. Overflows to 256 when entering Sphinx (for SOME reason!)
															
	int movable : 0x738EB84;								//Instantly changes to 0 whenever you loose ability to move (Any form of Cutscenes, scaring QTE, Medal Animations, Dying, etc)
															//Rapidly counts up from 1 to 10 when regaining control of movment (if game pauses this will pause as well.)
}

startup
{
	settings.Add("mike", true, "Start the timer when loading in as Mike");
	settings.Add("sully", true, "Start the timer when loading in as Sully");

	settings.Add("bronze", true, "Split on Level Exit, with Bronze Medal");
	settings.Add("gold", true, "Split on Level Exit, with Gold Medal");
	
	settings.Add("MO04B", true, "City Park", "bronze");
	settings.Add("MO05B", true, "Downtown", "bronze");
	settings.Add("MO06B", true, "The Docks", "bronze");
	settings.Add("MO07B", true, "The Marketplace", "bronze");
	settings.Add("BD08B", true, "The Sphinx", "bronze");
	settings.Add("BD09B", true, "Oasis", "bronze");
	settings.Add("BD10B", true, "The Tomb", "bronze");
	settings.Add("BD11B", true, "The Pyramid", "bronze");
	settings.Add("SP12B", true, "Surgar Shack", "bronze");
	settings.Add("SP13B", true, "The Ski Lift", "bronze");
	settings.Add("SP14B", true, "The Iceberg", "bronze");
	settings.Add("SP15B", true, "Hot Springs", "bronze");
	
	settings.Add("ACTR1G", true, "Orientation", "gold");
	settings.Add("MO04G", true, "City Park", "gold");
	settings.Add("MO05G", true, "Downtown", "gold");
	settings.Add("MO06G", true, "The Docks", "gold");
	settings.Add("MO07G", true, "The Marketplace", "gold");
	settings.Add("BD08G", true, "The Sphinx", "gold");
	settings.Add("BD09G", true, "Oasis", "gold");
	settings.Add("BD10G", true, "The Tomb", "gold");
	settings.Add("BD11G", true, "The Pyramid", "gold");
	settings.Add("SP12G", true, "Surgar Shack", "gold");
	settings.Add("SP13G", true, "The Ski Lift", "gold");
	settings.Add("SP14G", true, "The Iceberg", "gold");
	settings.Add("SP15G", true, "Hot Springs", "gold");
	
	settings.Add("randal", true, "Split on Arctic Pursuit Race Finish (Any% End)");
	settings.Add("hundo", true, "Split on Ski Lift 2 Gold Medal Cutscene (100% End)");
}

onStart
{
	//Reseting the Nerve Count Variables for each level on timer start. (Also creates these Variables)
	current.ACTR1 = 0;

	current.MO04 = 0;
	current.MO05 = 0;
	current.MO06 = 0;
	current.MO07 = 0;

	current.BD08 = 0;
	current.BD09 = 0;
	current.BD10 = 0;
	current.BD11 = 0;

	current.SP12 = 0;
	current.SP13 = 0;
	current.SP14 = 0;
	current.SP15 = 0;
}

update
{
	//Checks if a nerve is scared (If "nerve" changes number, and new number is not 0 or 256 (cause reasons)). Increments Nerve Count Variables for the given level.
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "ACTR1M.BZE;1" || current.level == "ACTR1.BZE;1")) {current.ACTR1++;}
	
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "MO04M.BZE;1" || current.level == "MO04.BZE;1")) {current.MO04++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "MO05M.BZE;1" || current.level == "MO05.BZE;1")) {current.MO05++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "MO06M.BZE;1" || current.level == "MO06.BZE;1")) {current.MO06++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "MO07M.BZE;1" || current.level == "MO07.BZE;1")) {current.MO07++;}
	
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "BD08M.BZE;1" || current.level == "BD08.BZE;1")) {current.BD08++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "BD09M.BZE;1" || current.level == "BD09.BZE;1")) {current.BD09++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "BD10M.BZE;1" || current.level == "BD10.BZE;1")) {current.BD10++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "BD11M.BZE;1" || current.level == "BD11.BZE;1")) {current.BD11++;}
	
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "SP12M.BZE;1" || current.level == "SP12.BZE;1")) {current.SP12++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "SP13M.BZE;1" || current.level == "SP13.BZE;1")) {current.SP13++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "SP14M.BZE;1" || current.level == "SP14.BZE;1")) {current.SP14++;}
	if (current.nerve != old.nerve && current.nerve != 0 && current.nerve != 256 && (current.level == "SP15M.BZE;1" || current.level == "SP15.BZE;1")) {current.SP15++;}
}

split
{
	//Checks if level has changed when 5 Nerves have been scared in the given level. (Bronze)
	if ((current.level != old.level) && (old.level == "MO04M.BZE;1" || old.level == "MO04.BZE;1") && (current.MO04 == 5) && (settings["MO04B"]) && (current.level != "MO04BM.BZE;1") && (current.level != "MO04B.BZE;1")) {return true;}
	if ((current.level != old.level) && (old.level == "MO05M.BZE;1" || old.level == "MO05.BZE;1") && (current.MO05 == 5) && (settings["MO05B"])) {return true;}
	if ((current.level != old.level) && (old.level == "MO06M.BZE;1" || old.level == "MO06.BZE;1") && (current.MO06 == 5) && (settings["MO06B"])) {return true;}
	if ((current.level != old.level) && (old.level == "MO07M.BZE;1" || old.level == "MO07.BZE;1") && (current.MO07 == 5) && (settings["MO07B"])) {return true;}
																												   
	if ((current.level != old.level) && (old.level == "BD08M.BZE;1" || old.level == "BD08.BZE;1") && (current.BD08 == 5) && (settings["BD08B"])) {return true;}
	if ((current.level != old.level) && (old.level == "BD09M.BZE;1" || old.level == "BD09.BZE;1") && (current.BD09 == 5) && (settings["BD09B"])) {return true;}
	if ((current.level != old.level) && (old.level == "BD10M.BZE;1" || old.level == "BD10.BZE;1") && (current.BD10 == 5) && (settings["BD10B"])) {return true;}
	if ((current.level != old.level) && (old.level == "BD11M.BZE;1" || old.level == "BD11.BZE;1") && (current.BD11 == 5) && (settings["BD11B"])) {return true;}
																												   
	if ((current.level != old.level) && (old.level == "SP12M.BZE;1" || old.level == "SP12.BZE;1") && (current.SP12 == 5) && (settings["SP12B"])) {return true;}
	if ((current.level != old.level) && (old.level == "SP13M.BZE;1" || old.level == "SP13.BZE;1") && (current.SP13 == 5) && (settings["SP13B"]) && (current.level != "SP13BM.BZE;1") && (current.level != "SP13B.BZE;1")) {return true;}
	if ((current.level != old.level) && (old.level == "SP14M.BZE;1" || old.level == "SP14.BZE;1") && (current.SP14 == 5) && (settings["SP14B"])) {return true;}
	if ((current.level != old.level) && (old.level == "SP15M.BZE;1" || old.level == "SP15.BZE;1") && (current.SP15 == 5) && (settings["SP15B"])) {return true;}
	
	
	//Checks if level has changed when 8 Nerves have been scared in the given level. (Gold)
	if ((current.level != old.level) && (old.level == "ACTR1M.BZE;1" || old.level == "ACTR1.BZE;1") && (current.ACTR1 == 8) && (settings["ACTR1G"])) {return true;}
	
	if ((current.level != old.level) && (old.level == "MO04M.BZE;1" || old.level == "MO04.BZE;1") && (current.MO04 == 7) && (settings["MO04G"]) && (current.level != "MO04BM.BZE;1") && (current.level != "MO04B.BZE;1")) {return true;} //7 cause game dosn't count one.
	if ((current.level != old.level) && (old.level == "MO05M.BZE;1" || old.level == "MO05.BZE;1") && (current.MO05 == 8) && (settings["MO05G"])) {return true;}
	if ((current.level != old.level) && (old.level == "MO06M.BZE;1" || old.level == "MO06.BZE;1") && (current.MO06 == 8) && (settings["MO06G"])) {return true;}
	if ((current.level != old.level) && (old.level == "MO07M.BZE;1" || old.level == "MO07.BZE;1") && (current.MO07 == 8) && (settings["MO07G"])) {return true;}
																												   
	if ((current.level != old.level) && (old.level == "BD08M.BZE;1" || old.level == "BD08.BZE;1") && (current.BD08 == 8) && (settings["BD08G"])) {return true;}
	if ((current.level != old.level) && (old.level == "BD09M.BZE;1" || old.level == "BD09.BZE;1") && (current.BD09 == 8) && (settings["BD09G"])) {return true;}
	if ((current.level != old.level) && (old.level == "BD10M.BZE;1" || old.level == "BD10.BZE;1") && (current.BD10 == 8) && (settings["BD10G"])) {return true;}
	if ((current.level != old.level) && (old.level == "BD11M.BZE;1" || old.level == "BD11.BZE;1") && (current.BD11 == 8) && (settings["BD11G"])) {return true;}
																												   
	if ((current.level != old.level) && (old.level == "SP12M.BZE;1" || old.level == "SP12.BZE;1") && (current.SP12 == 8) && (settings["SP12G"])) {return true;}
	if ((current.level != old.level) && (old.level == "SP13M.BZE;1" || old.level == "SP13.BZE;1") && (current.SP13 == 8) && (settings["SP13G"]) && (old.level != "SP13BM.BZE;1") && (old.level != "SP13B.BZE;1")) {return true;}
	if ((current.level != old.level) && (old.level == "SP14M.BZE;1" || old.level == "SP14.BZE;1") && (current.SP14 == 8) && (settings["SP14G"])) {return true;}
	if ((current.level != old.level) && (old.level == "SP15M.BZE;1" || old.level == "SP15.BZE;1") && (current.SP15 == 8) && (settings["SP15G"])) {return true;}
	
	
	//Checks if you loose control of movement in Snow Randal Race, or in Ski Lift 2 after 8 nerves. Ending splits for Any% and 100% (I can't belive it worked for 100% so perfectly. Wasn't even expecting that lol)
	if ((current.level == "MP03M.BZE;1") && (old.movable == 10) && (current.movable == 0) && (settings["randal"])) {return true;}
	if ((current.level == "SP13M.BZE;1" || current.level == "SP13.BZE;1") && (current.SP13 == 8) && (old.movable == 10) && (current.movable == 0) && (settings["hundo"])) {return true;}
}

start
{
	//Checks if current level is Mike or Sully orientation & checks if level has changed.
	//Sets timer offset to correct value based on character and starts the timer.
	if ((old.level != current.level) && (current.level == "ACTR1M.BZE;1") && (settings["mike"]))
	{
	timer.Run.Offset = TimeSpan.FromSeconds(-5.17);
	return true;
	}
	
	if ((old.level != current.level) && (current.level == "ACTR1.BZE;1") && (settings["sully"]))
	{
	timer.Run.Offset = TimeSpan.FromSeconds(-5.10);
	return true;
	}
}