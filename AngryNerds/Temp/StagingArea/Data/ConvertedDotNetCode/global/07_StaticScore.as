package global {
	
	import System.Type;
	import UnityEngine._Object;
	import UnityEngine.GameObject;
	import UnityEngine.GUI;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Quaternion;
	import UnityEngine.Rect;
	import UnityEngine.Screen;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class 07_StaticScore extends MonoBehaviour implements IDeserializable {
		
		public var 07_StaticScore$goBull$: GameObject;
		
		public function 07_StaticScore_Start(): void {
			this.07_StaticScore$goBull$ = GameObject.GameObject_Find_String("BouncingBull");
		}
		
		public function 07_StaticScore_OnGUI(): void {
			if (GUI.GUI_Button_Rect_String(new Rect().Constructor_Single_Single_Single_Single(Number(10), Number(int(Screen.height / 2) - 30), Number(100), Number(30)), "More Bull!")) {
				_Object.Object_Instantiate_Object_Vector3_Quaternion(this.07_StaticScore$goBull$, this.07_StaticScore$goBull$.transform.position, Quaternion.identity);
				ScoreKeeper.ScoreKeeper_ScoreUp();
			}
			GUI.GUI_Label_Rect_String(new Rect().Constructor_Single_Single_Single_Single(Number(10), Number(Screen.height - 30), Number(100), Number(30)), ScoreKeeper.ScoreKeeper_GetScore().toString() + " bulls added");
		}
		
		public function 07_StaticScore_Main(): void {
		}
		
		cil2as static function DefaultValue(): 07_StaticScore {
			return new 07_StaticScore().07_StaticScore_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.07_StaticScore$goBull$ = reader.ReadUnityEngineObject() as GameObject;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteUnityEngineObject(this.07_StaticScore$goBull$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.07_StaticScore$goBull$ = remapper.GetNewInstanceToReplaceOldInstance(this.07_StaticScore$goBull$) as GameObject;
		}
		
		public function 07_StaticScore_Constructor(): 07_StaticScore {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.07_StaticScore, {"Start" : "07_StaticScore_Start", "OnGUI" : "07_StaticScore_OnGUI", "Main" : "07_StaticScore_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
