#pragma strict

function Size () {
	print(transform.localScale);
}

function OnGUI () {
if(GUI.Button(Rect(10,10,50,50),"x"))
	Size();
}