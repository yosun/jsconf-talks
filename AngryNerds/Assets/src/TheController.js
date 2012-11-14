#pragma strict

public var go:GameObject;
public var goCamT:Transform;

var texFork:Texture;
var texClone:Texture;
var texBranch:Texture;
var texPull:Texture;
var texPlayAgain:Texture;

public var goNerd:GameObject; var posNerd:Vector3; var oNerd:GameObject;
public var goBull:GameObject; var posBull:Vector3; var oBull:GameObject;

public var goFork:GameObject;

var rects:Rect[]; var margin:float=5f; var btnSize:float=50f;

var timeElapsed:float=0f;

function Awake(){
	posNerd = goNerd.transform.position;
	posBull = goBull.transform.position;
}

function GarbageCollector(){
	var deleteall:GameObject[] = GameObject.FindGameObjectsWithTag("Entities");
	for(var i:int = 0 ; i < deleteall.length ; i++){
		if(deleteall[i].name!="goBull"&&deleteall[i].name!="goNerd")
			Destroy(deleteall[i].gameObject);
	}
}

function Start(){
	GraphicsMan.LoadCharacterTextures();
	ScoreDaemon.Init();
	
	//goNerd.GetComponent.<EachEntity>().Init("Nerd",0); 
	ScoreDaemon.AddNerd(1); 
	 goNerd.transform.position = Vector3(-99999,-9999,-9999);
	oNerd = Instantiate(goNerd,posNerd,Quaternion.identity) as GameObject; oNerd.GetComponent.<EachEntity>().Init("Nerd",0); oNerd.transform.position = posNerd; oNerd.name="Nerd";
	
	//goBull.GetComponent.<EachEntity>().Init("Bull",0); 
	ScoreDaemon.AddBull(1);
	 goBull.transform.position = Vector3(-99999,9999,-9999);
	oBull = Instantiate(goBull,posBull,Quaternion.identity) as GameObject; oBull.GetComponent.<EachEntity>().Init("Bull",0); oBull.transform.position = posBull; oBull.name="Bull";
	
	GenRects(4); // rect positions for 4 buttons
}

function Update () {
	if(!ScoreDaemon.ActiveGame())
		return; // game over

	// spawn bulls between 1.37f and 20f seconds... TO-DO: vary max-inclusive for more advance levels
	if(timeElapsed>Random.Range(1.37f,20f)){
		timeElapsed=0;
		if(oBull!=null)Actions.GameOffActions.Branch(oBull);
		else timeElapsed=-31337;
	}
	timeElapsed+=Time.deltaTime;

#if UNITY_IPHONE || UNITY_ANDROID
	// return if we don't have any finger touching
	if(Input.touchCount<1)
		if(Actions.selectedAction!=Actions.TheActions.Pull)
			if(Input.GetTouch(0).phase!=TouchPhase.Began)
				return; // pull is the only state that continues to activate after touch starts
#else
	// move the camera by arrow keys
	if(Input.GetKey(KeyCode.DownArrow))
		goCamT.position-=Vector3(0,0.1,0);
	else if(Input.GetKey(KeyCode.UpArrow))
		goCamT.position+=Vector3(0,0.1,0);
	
	// return if mousebutton is not down, 
	if(!Input.GetMouseButtonDown(0)){
		if(Actions.selectedAction!=Actions.TheActions.Pull)
			return; // with the exception of pull which drags the selectedObj based on the cursor
	}
#endif

	// detect/actionize what we have touched/clicked in the game
    var ray:Ray = Camera.main.ScreenPointToRay(Input.mousePosition);
    var hit:RaycastHit;
    if (Physics.Raycast(ray, hit)){
    	var name:String = hit.transform.gameObject.name;
    	if(name=="Bull"||name=="Nerd"){
    		Actions.PerformAction(hit.transform.gameObject,hit.point);
    		if(Actions.selectedAction!=Actions.TheActions.Pull)
    			ScoreDaemon.AddTurn();
    	}else if(name=="Floor"){
    		if(Actions.selectedAction==Actions.TheActions.Fork){
    			Actions.GameOffActions.Fork(goFork,Vector3(hit.point.x,-0.8612683f,hit.point.z));
    			ScoreDaemon.AddTurn();
    		}
    	}
    }
}

function OnGUI(){

	if(ScoreDaemon.winState == WinState.Playing){
		if(GUI.Button(rects[0],texFork)){
			Actions.SelectAction("fork");
		}
		if(GUI.Button(rects[1],texClone)){
			Actions.SelectAction("clone");
		}
		if(GUI.Button(rects[2],texBranch)){
			Actions.SelectAction("branch");
		}
		if(GUI.Button(rects[3],texPull)){
			Actions.SelectAction("pull");
		}	
	}else{
		if(GUI.Button(Rect(Screen.width/2 - 100,Screen.height/2-175,200,100),texPlayAgain)){
			GarbageCollector();
			Start();
		}
	}		
	
}

function GenRects(num:int){
	btnSize = Screen.width / 10f; margin = Screen.width/32f;
	rects = new Rect[num];
	for(var i:int = 0 ; i<num;i++){
		rects[i] = new Rect(Screen.width/4+i*btnSize+i*margin,margin,btnSize,btnSize);
	}
}


