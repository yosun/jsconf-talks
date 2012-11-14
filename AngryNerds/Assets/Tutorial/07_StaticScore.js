#pragma strict

var goBull:GameObject;

function Start(){
	goBull = GameObject.Find("BouncingBull");
}

function OnGUI(){
	// produce more bull. and keep track of it.
	if(GUI.Button(Rect(10,Screen.height/2-30,100,30),"More Bull!")){
		Instantiate(goBull,goBull.transform.position,Quaternion.identity);
		ScoreKeeper.ScoreUp();
	}
	
	// display bull number
	GUI.Label(Rect(10,Screen.height - 30,100,30),ScoreKeeper.GetScore().ToString()+" bulls added");
}