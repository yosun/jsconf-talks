package global {
	
	import System.Type;
	import UnityEngine.Camera;
	import UnityEngine.GameObject;
	import UnityEngine.GUI;
	import UnityEngine.Input;
	import UnityEngine.KeyCode;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Rect;
	import UnityEngine.Screen;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class 03_Events extends MonoBehaviour implements IDeserializable {
		
		public var 03_Events$randColors$: RandColors;
		
		public var 03_Events$cam$: Camera;
		
		public function 03_Events_Awake(): void {
			this.03_Events$randColors$ = this.Component_GetComponent$1$1(RandColors.$Type) as RandColors;
		}
		
		public function 03_Events_Start(): void {
			this.Component_transform.localScale = Vector3.op_Multiply_Vector3_Single(this.Component_transform.localScale, 0.5);
			this.03_Events$cam$ = GameObject.GameObject_Find_String("Main Camera").camera;
		}
		
		public function 03_Events_Update(): void {
			if (Input.Input_GetKey_KeyCode(KeyCode.UpArrow)) {
				this.03_Events$cam$.Component_transform.position = Vector3.op_Addition_Vector3_Vector3(this.03_Events$cam$.Component_transform.position, new Vector3().Constructor_Single_Single_Single(Number(0), Number(0), 0.1));
			} else {
				if (Input.Input_GetKey_KeyCode(KeyCode.DownArrow)) {
					this.03_Events$cam$.Component_transform.position = Vector3.op_Subtraction_Vector3_Vector3(this.03_Events$cam$.Component_transform.position, new Vector3().Constructor_Single_Single_Single(Number(0), Number(0), 0.1));
				} else {
					if (Input.Input_GetKey_KeyCode(KeyCode.LeftArrow)) {
						this.03_Events$cam$.Component_transform.position = Vector3.op_Subtraction_Vector3_Vector3(this.03_Events$cam$.Component_transform.position, new Vector3().Constructor_Single_Single_Single(0.1, Number(0), Number(0)));
					} else {
						if (Input.Input_GetKey_KeyCode(KeyCode.RightArrow)) {
							this.03_Events$cam$.Component_transform.position = Vector3.op_Addition_Vector3_Vector3(this.03_Events$cam$.Component_transform.position, new Vector3().Constructor_Single_Single_Single(0.1, Number(0), Number(0)));
						}
					}
				}
			}
		}
		
		public function 03_Events_OnGUI(): void {
			if (GUI.GUI_Button_Rect_String(new Rect().Constructor_Single_Single_Single_Single(Number(10), Number((Screen.height - 10) - 30), Number(150), Number(30)), "Color Toggle")) {
				this.03_Events$randColors$.RandColors_ToggleColors();
			}
		}
		
		public function 03_Events_FixedUpdate(): void {
			this.Component_rigidbody.Rigidbody_AddForce_Single_Single_Single(1, Number(0), Number(0));
		}
		
		public function 03_Events_Main(): void {
		}
		
		cil2as static function DefaultValue(): 03_Events {
			return new 03_Events().03_Events_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.03_Events$randColors$ = reader.ReadUnityEngineObject() as RandColors;
			this.03_Events$cam$ = reader.ReadUnityEngineObject() as Camera;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteUnityEngineObject(this.03_Events$randColors$);
			writer.WriteUnityEngineObject(this.03_Events$cam$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.03_Events$randColors$ = remapper.GetNewInstanceToReplaceOldInstance(this.03_Events$randColors$) as RandColors;
			this.03_Events$cam$ = remapper.GetNewInstanceToReplaceOldInstance(this.03_Events$cam$) as Camera;
		}
		
		public function 03_Events_Constructor(): 03_Events {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.03_Events, {"Awake" : "03_Events_Awake", "Start" : "03_Events_Start", "Update" : "03_Events_Update", "OnGUI" : "03_Events_OnGUI", "FixedUpdate" : "03_Events_FixedUpdate", "Main" : "03_Events_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
