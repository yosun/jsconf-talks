package global {
	
	import System.Type;
	import UnityEngine.GUI;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Rect;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class getsize extends MonoBehaviour implements IDeserializable {
		
		public function getsize_Size(): void {
			MonoBehaviour.MonoBehaviour_print_Object(this.Component_transform.localScale);
		}
		
		public function getsize_OnGUI(): void {
			if (GUI.GUI_Button_Rect_String(new Rect().Constructor_Single_Single_Single_Single(Number(10), Number(10), Number(50), Number(50)), "x")) {
				this.getsize_Size();
			}
		}
		
		public function getsize_Main(): void {
		}
		
		cil2as static function DefaultValue(): getsize {
			return new getsize().getsize_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function getsize_Constructor(): getsize {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.getsize, {"Size" : "getsize_Size", "OnGUI" : "getsize_OnGUI", "Main" : "getsize_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
