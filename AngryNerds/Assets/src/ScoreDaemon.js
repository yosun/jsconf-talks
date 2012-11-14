#pragma strict

// This is a singleton that manages and render-guitexts the global state of the game as well as scoring.

enum WinState{
	Playing,
	Won,
	Lost
}
static var winState:WinState = WinState.Playing;

static var Bulls:int=0;
static var Nerds:int=0;
static var turns:int=0;

static var guiNerds:GUIText;
static var guiBulls:GUIText;
static var guiTurns:GUIText;
static var guiWinLose:GUIText;

public static function Init(){
	Bulls=0;Nerds=0;turns=0;
	guiNerds = GameObject.Find("ScoreNerds").guiText;
	guiBulls = GameObject.Find("ScoreBulls").guiText;
	guiTurns = GameObject.Find("ScoreTurns").guiText;
	guiWinLose = GameObject.Find("ScoreWinLose").guiText;
	winState = WinState.Playing;
	UpdateScores();
}

public static function AddBull(num:int){
	Bulls+=num;
	guiBulls.text = Bulls.ToString();
}

public static function KillBull(num:int){
	Bulls-=num;
	guiBulls.text = Bulls.ToString();
	if(Bulls<=0)
		Win();
}

public static function AddNerd(num:int){
	Nerds+=num;
	guiNerds.text = Nerds.ToString();
}

public static function KillNerd(num:int){
	Nerds-=num;
	guiNerds.text = Nerds.ToString();
	if(Nerds<=0)
		Lose();
}

public static function AddTurn(){
	turns++;
	guiTurns.text = turns.ToString();
}

public static function UpdateScores(){
	guiBulls.text = Bulls.ToString();
	guiNerds.text = Nerds.ToString();
	guiTurns.text = turns.ToString();
	guiWinLose.text="";
}

static function Win(){
	winState = WinState.Won;
	guiWinLose.text = "NERDS WIN!";
}

static function Lose(){
	winState = WinState.Lost;
	guiWinLose.text = "BULLS WIN!";
}

public static function ActiveGame(){
	if(winState == WinState.Playing)
		return true;
	else{
		// TO-DO: activate bonus level, bejeweled or character-crosswords if there is a critical mass of nerds or bulls
		
		return false;
	}
}	