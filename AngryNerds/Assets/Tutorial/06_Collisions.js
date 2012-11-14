#pragma strict

function OnCollisionEnter(col:Collision){
	if(col.rigidbody==null)
		return; // we hit the floor or something without a rigidbody
		
	if(col.rigidbody.mass!=rigidbody.mass){
		print(gameObject.name + " destroyed " + col.transform.name);
		Destroy(gameObject); // the bulls and balls have different masses. when a bull collides with a ball, they eliminate each other.
	}
}
