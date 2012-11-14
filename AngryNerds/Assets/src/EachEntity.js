#pragma strict

// This goes inside each instantiated bull or nerd "entity" in the game. 
// 
// establish each character via Init("Nerd"||"Bull",-10 or less generates random direction|0 for non-moving)

private var myType:String;

var ReactFunction:Function;

var dir:int=1; var force:Vector3; var other:String;


function ReactLikeBull():Function{
	if(other=="Nerd"){
		ScoreDaemon.KillBull(1);
		Die();
	}
}

function ReactLikeNerd():Function{
	if(other=="Bull"){
		ScoreDaemon.KillNerd(1);
		Die();	
	}
}


public function Init (type:String,num:int) {
	myType = type;
	
	// define motion parameters
	if(num<-10)
		dir = Mathf.Round(Random.Range(-2,2));
	else
		dir = num;
	force = dir * Vector3(1,0,0);
	
	// define tendency and visuals
	if(myType == "Nerd"){
		ReactFunction = ReactLikeNerd;
		if(dir==-2){
			SetTex(GraphicsMan.texHD,GraphicsMan.sizeHD);
		}else if(dir==-1){
			SetTex(GraphicsMan.texKnerdby,GraphicsMan.sizeKnerdby);	
		}else if(dir==0){
			SetTex(GraphicsMan.texNerdbo,GraphicsMan.sizeNerdbo);
		}else if(dir==1){
			SetTex(GraphicsMan.texProfTris,GraphicsMan.sizeProfTris);	
		}else{ 
			SetTex(GraphicsMan.texNerdSumo,GraphicsMan.sizeNerdSumo);	
		}				
	}else {
		ReactFunction = ReactLikeBull;
		if(dir==-2){
			SetTex(GraphicsMan.texBullbo,GraphicsMan.sizeBullbo);
		}else if(dir==-1){
			SetTex(GraphicsMan.texBullzo,GraphicsMan.sizeBullzo);	
		}else if(dir==0){
			SetTex(GraphicsMan.texCamo,GraphicsMan.sizeCamo);
		}else{
			SetTex(GraphicsMan.texMrBull,GraphicsMan.sizeMrBull);	
		}		
	}
	
	// establish physics constraints for a 2d system
	rigidbody.useGravity=true;
	rigidbody.isKinematic=false;
	rigidbody.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationY | RigidbodyConstraints.FreezePositionZ;	
}

function SetTex(tex:Texture,size:Vector3){
	//renderer.material.mainTexture = tex;
	var tr:Transform=transform.Find("Billboard");
	tr.renderer.material.mainTexture = tex;
	tr.parent.localScale=size;
	tr.localScale *= 1/size.x;
}

function OnCollisionEnter(col:Collision){
	var name:String = col.transform.name;
	
	other = name;
	ReactFunction();
	other=null;
	
	if(name == "Wall" || name == "Fork"){
		dir*=-1; force*=dir;
		rigidbody.AddForce(force);
	}
}

function Die(){
	Destroy(gameObject);
}

function FixedUpdate(){
	rigidbody.AddForce(force);
}