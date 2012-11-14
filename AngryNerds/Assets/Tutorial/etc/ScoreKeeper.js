#pragma strict

public static var score:int = 0;

static function GetScore(){
	return score;
}

static function ScoreUp(){
	score++;
}

static function ScoreDown(){
	score--;
}

static function ScoreReset(){
	score = 0;
}