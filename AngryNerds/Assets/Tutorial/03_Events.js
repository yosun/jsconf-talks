#pragma strict

var randColors:RandColors;

var cam:Camera;

// this is the very first thing that happens 
function Awake(){
	randColors = GetComponent.<RandColors>();
}

// this happens before Update starts
function Start () {
	transform.localScale *= 0.5f; // make it start smaller	
	cam = GameObject.Find("Main Camera").camera;
}

// this happens once per frame, but fps is a fickle number
function Update(){
	if(Input.GetKey(KeyCode.UpArrow))
		cam.transform.position+=Vector3(0,0,0.1);
	else if(Input.GetKey(KeyCode.DownArrow))
		cam.transform.position-=Vector3(0,0,0.1);
	else if(Input.GetKey(KeyCode.LeftArrow))
		cam.transform.position-=Vector3(0.1,0,0);
	else if(Input.GetKey(KeyCode.RightArrow))
		cam.transform.position+=Vector3(0.1,0,0);				
				
}

// this is rendered several times per frame on the camera gui component
function OnGUI(){
	if(GUI.Button(Rect(10,Screen.height - 10 - 30,150,30),"Color Toggle"))
		randColors.ToggleColors();
}

// this happens at a fixed rate, Update happens before this... this is where physics methods should go
function FixedUpdate () {
	rigidbody.AddForce(1f,0,0); // a slight drift house right
}

