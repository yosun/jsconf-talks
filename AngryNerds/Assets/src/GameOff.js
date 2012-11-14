#pragma strict

class Actions{

	enum TheActions{
		None,
		Fork,
		Clone,
		Branch,
		Pull
	}
	public static var selectedAction:TheActions = TheActions.None;
	
	static var selectedObj:GameObject;
	
	// action states assigned by TheController OnGUI buttons
	public static function SelectAction(selectwhat:String):void{
		if(selectwhat == "fork")
			selectedAction = TheActions.Fork;
		else if(selectwhat == "clone")
			selectedAction = TheActions.Clone;
		else if(selectwhat == "branch")
			selectedAction = TheActions.Branch;
		else if(selectwhat == "pull")
			selectedAction = TheActions.Pull;
	}
	
	// actionize via TheController Update RaycastHit on game objects
	public static function PerformAction(go:GameObject,pos:Vector3):void{
		if(selectedAction == TheActions.Clone)
			GameOffActions.Clone(go);
		else if(selectedAction == TheActions.Branch)
			GameOffActions.Branch(go);
		else if(selectedAction == TheActions.Pull)
			GameOffActions.Pull(go,pos);
	}	
	
	// define the actions specific to this GameOff
	class GameOffActions {
	
		public static function Fork(forkobj:GameObject,where:Vector3){
			var g:GameObject = GameObject.Instantiate(forkobj,where,Quaternion.identity) as GameObject;
			g.name="Fork";
		}
		
		public static function Clone(what:GameObject){
			var g:GameObject = GameObject.Instantiate(what,what.transform.position+Vector3(0,2,0),Quaternion.identity) as GameObject;
			g.name = what.name;
			
			if(what.name=="Nerd"){
				g.GetComponent.<EachEntity>().Init("Nerd",-100);
				ScoreDaemon.AddNerd(1);
			}else if(what.name=="Bull"){
				g.GetComponent.<EachEntity>().Init("Bull",-100);
				ScoreDaemon.AddBull(1);
			}
		}	
		
		public static function Branch(what:GameObject){
			var g1:GameObject = GameObject.Instantiate(what,what.transform.position+Vector3(0,2,0),Quaternion.identity) as GameObject;
			var g2:GameObject = GameObject.Instantiate(what,what.transform.position+Vector3(0,2,0),Quaternion.identity) as GameObject;
			if(g1!=null)g1.name = what.name;
			if(g2!=null)g2.name = what.name;
			
			if(what.name=="Nerd"){
				if(g1!=null)g1.GetComponent.<EachEntity>().Init("Nerd",-100);
				if(g2!=null)g2.GetComponent.<EachEntity>().Init("Nerd",-100);
				ScoreDaemon.AddNerd(2);
			}else if(what.name=="Bull"){
				if(g1!=null)g1.GetComponent.<EachEntity>().Init("Bull",-100);
				if(g2!=null)g2.GetComponent.<EachEntity>().Init("Bull",-100);
				ScoreDaemon.AddBull(2);
			}		
		}
		
		public static function Pull(what:GameObject,pos:Vector3){
			if(what.name == "Nerd"){
				if(selectedObj!=null)
					selectedObj.rigidbody.isKinematic=false;
				selectedObj = what;
				selectedObj.rigidbody.isKinematic=true;
				selectedObj.transform.position = Vector3(pos.x,pos.y,0);
			}
		}
		
		private function Push(){
			// for now, this is a vestigial function, as push happens when something that is pulled hits something else that is mobile (and a nerd)
		}

	}
}