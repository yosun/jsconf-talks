#pragma strict

// reference to each of the graphical elements, initialize via LoadCharacterTextures();

public static var texBullbo:Texture; public static var sizeBullbo:Vector3=Vector3(0.6,0.6,0); //public static var sizeBullbo:Vector3=Vector3(1.0, 1.0, 1.0);
public static var texBullzo:Texture; public static var sizeBullzo:Vector3=Vector3(1.3,1.3,0); //public static var sizeBullzo:Vector3=Vector3(1.3, 1.3, 0.0);
public static var texCamo:Texture; public static var sizeCamo:Vector3=Vector3(0.85,0.85,0); //public static var sizeCamo:Vector3=Vector3(1.9, 1.9, 0.0);
public static var texMrBull:Texture; public static var sizeMrBull:Vector3=Vector3(1.1,1.1,0); //public static var sizeMrBull:Vector3=Vector3(2.0, 2.0, 0.0);

public static var texHD:Texture; public static var sizeHD:Vector3=Vector3(0.3,0.3,0); //public static var sizeHD:Vector3=Vector3(2.0, 2.0, 0.0);
public static var texKnerdby:Texture; public static var sizeKnerdby:Vector3=Vector3(1.1,1.1,0); //public static var sizeKnerdby:Vector3=Vector3(1.3, 1.3, 0.0);
public static var texNerdbo:Texture; public static var sizeNerdbo:Vector3=Vector3(0.8,0.8,0); //public static var sizeNerdbo:Vector3=Vector3(1.3, 1.3, 0.0);
public static var texProfTris:Texture; public static var sizeProfTris:Vector3=Vector3(0.8,0.8,0); //public static var sizeProfTris:Vector3=Vector3(1.6, 1.6, 0.0);
public static var texNerdSumo:Texture; public static var sizeNerdSumo:Vector3=Vector3(1.3,1.3,0); //public static var sizeNerdSumo:Vector3=Vector3(1.3, 1.3, 0.0);

// asset loading functions

public static function LoadCharacterTextures () {
	texBullbo = NegAssign(texBullbo,"bully_bullbo");
	texBullzo = NegAssign(texBullzo,"bully_bullzo");
	texCamo = NegAssign(texCamo,"bully_camo");
	texMrBull = NegAssign(texMrBull,"bully_mrbull");
	texHD = NegAssign(texHD,"nerd_humptydumpty");
	texKnerdby = NegAssign(texKnerdby,"nerd_knerdby");
	texNerdbo = NegAssign(texNerdbo,"nerd_nerdbo");
	texProfTris = NegAssign(texProfTris,"nerd_proftris");
	texNerdSumo = NegAssign(texNerdSumo,"nerd_sumonerd");
}

public static function NegAssign(check:Texture,filename:String):Texture{
	if(check==null)
		return Resources.Load("Graphics/"+filename) as Texture;
	else return check;
}

