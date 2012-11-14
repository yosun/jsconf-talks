#pragma strict


function Update () {
	var ray:Ray = Camera.main.ScreenPointToRay(Input.mousePosition); // ray that we are casting from the screen 
	var hit:RaycastHit; // struct that stores a lot of useful info of what we hit
	if(Physics.Raycast(ray,hit)){
		// hit.point - point that we hit (not necessarily position of the object)
		// hit.transform.name - name of the object
		// hit.transform.position - position of the object
		print(hit.point+" hits "+hit.transform.name+", which is a gameobject located at "+hit.transform.position);
	} 
}