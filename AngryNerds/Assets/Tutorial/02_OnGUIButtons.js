#pragma strict

var startingPos:Vector3 = Vector3(0,2.077713,0); // for re-setting the ball's position when we turn gravity back on again

var rectGravStop:Rect = Rect(10,10,200,30); // screen rectangle containing the button; xy from top left corner

var textGravStop:String = "Gravity is On"; // text displayed on button

function OnGUI(){
	// define a button and what it does when clicked
	if(GUI.Button(rectGravStop,textGravStop)){
		// toggles gravity on/off and changes the button display text
		if(rigidbody.useGravity){
			rigidbody.useGravity = false;
			textGravStop = "Gravity is Off"; 
		}else{
			MoveTo(startingPos);
			rigidbody.useGravity = true;
			textGravStop = "Gravity is On";
		}
	}
}

function MoveTo(p:Vector3){
	rigidbody.isKinematic = true;  // allows motion to be guided by changing the transform, i.e., set an exact position. included physics system no longer guides motion
	transform.position = p;
	rigidbody.isKinematic = false; // motion guided by included physics again (by default false)
}