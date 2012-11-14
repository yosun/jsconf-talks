#pragma strict

var on:boolean = false;
var go:GameObject;

// find the object reference for go. this must be assigned before Update to avoid null reference issues
function Start(){
	go = GameObject.Find("BouncingBall").transform.Find("Billboard").gameObject;
}

// toggles on/off the color changer
function ToggleColors(){
	if(on)
		on = false;
	else
		on = true;
}

// this changes go's color every frame
function Update(){
	if(on)
		go.renderer.material.color = Color(Random.Range(0f,1f),Random.Range(0f,1f),Random.Range(0f,1f),1);
}
