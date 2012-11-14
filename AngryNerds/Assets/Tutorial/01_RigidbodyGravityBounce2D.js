#pragma strict

function Start () {

	// 1) make me bouncy by modifying my "physic material"
	collider.material.bounciness=1f;

	// 2) add a rigidbody component, to have my motion effected by the included physics engine
	gameObject.AddComponent.<Rigidbody>();
	
	// 3) influence-able by gravity from the included physics engine
	rigidbody.useGravity=true;
	
	// 4) limit me to just planar motion, use bit-OR to add in more constraints
	rigidbody.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationY | RigidbodyConstraints.FreezePositionZ;	
	
	// 5) make my mesh invisible. everything else remains the same, including my spherical collider
	renderer.enabled=false;
	
}

