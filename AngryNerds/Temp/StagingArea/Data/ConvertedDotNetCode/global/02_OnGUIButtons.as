package global {
	
	import System.Type;
	import UnityEngine.GUI;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Rect;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class 02_OnGUIButtons extends MonoBehaviour implements IDeserializable {
		
		public var 02_OnGUIButtons$startingPos$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var 02_OnGUIButtons$rectGravStop$: Rect = Rect.cil2as::DefaultValue();
		
		public var 02_OnGUIButtons$textGravStop$: String;
		
		public function 02_OnGUIButtons_Constructor(): 02_OnGUIButtons {
			this.MonoBehaviour_Constructor();
			this.02_OnGUIButtons$startingPos$.cil2as::Assign(new Vector3().Constructor_Single_Single_Single(Number(0), 2.077713, Number(0)));
			this.02_OnGUIButtons$rectGravStop$.cil2as::Assign(new Rect().Constructor_Single_Single_Single_Single(Number(10), Number(10), Number(200), Number(30)));
			this.02_OnGUIButtons$textGravStop$ = "Gravity is On";
			return this;
		}
		
		public function 02_OnGUIButtons_OnGUI(): void {
			if (GUI.GUI_Button_Rect_String(this.02_OnGUIButtons$rectGravStop$, this.02_OnGUIButtons$textGravStop$)) {
				if (this.Component_rigidbody.useGravity) {
					this.Component_rigidbody.useGravity = false;
					this.02_OnGUIButtons$textGravStop$ = "Gravity is Off";
				} else {
					this.02_OnGUIButtons_MoveTo_Vector3(this.02_OnGUIButtons$startingPos$.cil2as::Copy());
					this.Component_rigidbody.useGravity = true;
					this.02_OnGUIButtons$textGravStop$ = "Gravity is On";
				}
			}
		}
		
		public function 02_OnGUIButtons_MoveTo_Vector3($p: Vector3): void {
			this.Component_rigidbody.isKinematic = true;
			this.Component_transform.position = $p.cil2as::Copy();
			this.Component_rigidbody.isKinematic = false;
		}
		
		public function 02_OnGUIButtons_Main(): void {
		}
		
		cil2as static function DefaultValue(): 02_OnGUIButtons {
			return new 02_OnGUIButtons().02_OnGUIButtons_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.02_OnGUIButtons$startingPos$ = Vector3.cil2as::DefaultValue();
			reader.ReadIDeserializable(this.02_OnGUIButtons$startingPos$);
			this.02_OnGUIButtons$rectGravStop$ = Rect.cil2as::DefaultValue();
			reader.ReadIDeserializable(this.02_OnGUIButtons$rectGravStop$);
			this.02_OnGUIButtons$textGravStop$ = reader.ReadString();
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteIDeserializable(this.02_OnGUIButtons$startingPos$);
			writer.WriteIDeserializable(this.02_OnGUIButtons$rectGravStop$);
			writer.WriteString(this.02_OnGUIButtons$textGravStop$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.02_OnGUIButtons, {"OnGUI" : "02_OnGUIButtons_OnGUI", "MoveTo" : "02_OnGUIButtons_MoveTo_Vector3", "Main" : "02_OnGUIButtons_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
