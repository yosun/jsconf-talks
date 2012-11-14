#pragma strict

function Update(){
	// conditional compile will omit/include code depending on platform. 
	// we want to do an early exit if we don't have a mouse button or finger down
	#if UNITY_IPHONE || UNITY_ANDROID
	if(Input.touchCount<1)
		return;
	if(Input.GetTouch(0).phase!=TouchPhase.Began)
		return;
	#else
	if(!Input.GetMouseButtonDown(0))
		return;
	#endif
	
	// see 04_RaycastHitTraverse
	var ray:Ray = Camera.main.ScreenPointToRay(Input.mousePosition); // touchscreens: Input.mousePosition is equivalent to the first finger touch position 
	var hit:RaycastHit;
	if(Physics.Raycast(ray,hit)){
		var name = hit.transform.gameObject.name;
		
		// we clone only objects named BouncingBall
		if(name == "BouncingBall"){
			Instantiate(hit.transform.gameObject,hit.transform.position + Vector3(0,2,0),Quaternion.identity);
		}
	}
}