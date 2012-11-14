#pragma strict

function Start () {
	while(rigidbody==null)
		yield WaitForSeconds(0.1f);
	rigidbody.mass = 1000;
}
