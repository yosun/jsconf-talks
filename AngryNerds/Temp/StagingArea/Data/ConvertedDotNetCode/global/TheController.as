package global {
	
	import System.CLIArray;
	import System.CLIArrayFactory;
	import System.CLIObjectArray;
	import System.Type;
	import UnityEngine._Object;
	import UnityEngine.Camera;
	import UnityEngine.GameObject;
	import UnityEngine.GUI;
	import UnityEngine.Input;
	import UnityEngine.KeyCode;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Physics;
	import UnityEngine.Quaternion;
	import UnityEngine.Random;
	import UnityEngine.Ray;
	import UnityEngine.RaycastHit;
	import UnityEngine.Rect;
	import UnityEngine.Screen;
	import UnityEngine.Texture;
	import UnityEngine.Time;
	import UnityEngine.Transform;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	import UnityScript.Lang.Extensions;
	
	public class TheController extends MonoBehaviour implements IDeserializable {
		
		public var TheController$go$: GameObject;
		
		public var TheController$goCamT$: Transform;
		
		public var TheController$texFork$: Texture;
		
		public var TheController$texClone$: Texture;
		
		public var TheController$texBranch$: Texture;
		
		public var TheController$texPull$: Texture;
		
		public var TheController$texPlayAgain$: Texture;
		
		public var TheController$goNerd$: GameObject;
		
		public var TheController$posNerd$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var TheController$oNerd$: GameObject;
		
		public var TheController$goBull$: GameObject;
		
		public var TheController$posBull$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var TheController$oBull$: GameObject;
		
		public var TheController$goFork$: GameObject;
		
		public var TheController$rects$: CLIObjectArray;
		
		public var TheController$margin$: Number = 0;
		
		public var TheController$btnSize$: Number = 0;
		
		public var TheController$timeElapsed$: Number = 0;
		
		public function TheController_Constructor(): TheController {
			this.MonoBehaviour_Constructor();
			this.TheController$margin$ = 5;
			this.TheController$btnSize$ = 50;
			return this;
		}
		
		public function TheController_Awake(): void {
			this.TheController$posNerd$.cil2as::Assign(this.TheController$goNerd$.transform.position);
			this.TheController$posBull$.cil2as::Assign(this.TheController$goBull$.transform.position);
		}
		
		public function TheController_GarbageCollector(): void {
			var $array: CLIObjectArray = GameObject.GameObject_FindGameObjectsWithTag_String("Entities");
			for (var $i: int = 0; $i < Extensions.Extensions_get_length_CLIArray($array); $i = $i + 1) {
				if ((($array.elements[$i] as GameObject).Object_name != "goBull") && (($array.elements[$i] as GameObject).Object_name != "goNerd")) {
					_Object.Object_Destroy_Object(($array.elements[$i] as GameObject).gameObject);
				}
			}
		}
		
		public function TheController_Start(): void {
			GraphicsMan.GraphicsMan_LoadCharacterTextures();
			ScoreDaemon.ScoreDaemon_Init();
			ScoreDaemon.ScoreDaemon_AddNerd_Int32(1);
			this.TheController$goNerd$.transform.position = new Vector3().Constructor_Single_Single_Single(Number(-99999), Number(-9999), Number(-9999));
			this.TheController$oNerd$ = (_Object.Object_Instantiate_Object_Vector3_Quaternion(this.TheController$goNerd$, this.TheController$posNerd$, Quaternion.identity) as GameObject) as GameObject;
			(this.TheController$oNerd$.GameObject_GetComponent$1$1(EachEntity.$Type) as EachEntity).EachEntity_Init_String_Int32("Nerd", 0);
			this.TheController$oNerd$.transform.position = this.TheController$posNerd$.cil2as::Copy();
			this.TheController$oNerd$.Object_name_String = "Nerd";
			ScoreDaemon.ScoreDaemon_AddBull_Int32(1);
			this.TheController$goBull$.transform.position = new Vector3().Constructor_Single_Single_Single(Number(-99999), Number(9999), Number(-9999));
			this.TheController$oBull$ = (_Object.Object_Instantiate_Object_Vector3_Quaternion(this.TheController$goBull$, this.TheController$posBull$, Quaternion.identity) as GameObject) as GameObject;
			(this.TheController$oBull$.GameObject_GetComponent$1$1(EachEntity.$Type) as EachEntity).EachEntity_Init_String_Int32("Bull", 0);
			this.TheController$oBull$.transform.position = this.TheController$posBull$.cil2as::Copy();
			this.TheController$oBull$.Object_name_String = "Bull";
			this.TheController_GenRects_Int32(4);
		}
		
		public function TheController_Update(): void {
			if (ScoreDaemon.ScoreDaemon_ActiveGame()) {
				if (this.TheController$timeElapsed$ > Random.Random_Range_Single_Single(1.37, 20)) {
					this.TheController$timeElapsed$ = Number(0);
					if (_Object.Object_op_Inequality_Object_Object(this.TheController$oBull$, null)) {
						Actions_GameOffActions.GameOffActions_Branch_GameObject(this.TheController$oBull$);
					} else {
						this.TheController$timeElapsed$ = Number(-31337);
					}
				}
				this.TheController$timeElapsed$ = this.TheController$timeElapsed$ + Time.deltaTime;
				if (Input.Input_GetKey_KeyCode(KeyCode.DownArrow)) {
					this.TheController$goCamT$.position = Vector3.op_Subtraction_Vector3_Vector3(this.TheController$goCamT$.position, new Vector3().Constructor_Single_Single_Single(Number(0), 0.1, Number(0)));
				} else {
					if (Input.Input_GetKey_KeyCode(KeyCode.UpArrow)) {
						this.TheController$goCamT$.position = Vector3.op_Addition_Vector3_Vector3(this.TheController$goCamT$.position, new Vector3().Constructor_Single_Single_Single(Number(0), 0.1, Number(0)));
					}
				}
				if (Input.Input_GetMouseButtonDown_Int32(0) || (Actions.Actions$selectedAction$ == Actions_TheActions.Pull)) {
					var $ray: Ray = Camera.main.Camera_ScreenPointToRay_Vector3(Input.mousePosition.cil2as::Copy());
					var $raycastHit: RaycastHit = RaycastHit.cil2as::DefaultValue();
					if (Physics.Physics_Raycast_Ray_RaycastHitRef($ray, $raycastHit)) {
						var $name: String = $raycastHit.transform.Component_gameObject.Object_name;
						if (($name == "Bull") || ($name == "Nerd")) {
							Actions.Actions_PerformAction_GameObject_Vector3($raycastHit.transform.Component_gameObject, $raycastHit.point);
							if (Actions.Actions$selectedAction$ != Actions_TheActions.Pull) {
								ScoreDaemon.ScoreDaemon_AddTurn();
							}
						} else {
							if (($name == "Floor") && (Actions.Actions$selectedAction$ == Actions_TheActions.Fork)) {
								Actions_GameOffActions.GameOffActions_Fork_GameObject_Vector3(this.TheController$goFork$, new Vector3().Constructor_Single_Single_Single($raycastHit.point.x, -0.8612683, $raycastHit.point.z));
								ScoreDaemon.ScoreDaemon_AddTurn();
							}
						}
					}
				}
			}
		}
		
		public function TheController_OnGUI(): void {
			if (ScoreDaemon.ScoreDaemon$winState$ == WinState.Playing) {
				if (GUI.GUI_Button_Rect_Texture(this.TheController$rects$.elements[0] as Rect, this.TheController$texFork$)) {
					Actions.Actions_SelectAction_String("fork");
				}
				if (GUI.GUI_Button_Rect_Texture(this.TheController$rects$.elements[1] as Rect, this.TheController$texClone$)) {
					Actions.Actions_SelectAction_String("clone");
				}
				if (GUI.GUI_Button_Rect_Texture(this.TheController$rects$.elements[2] as Rect, this.TheController$texBranch$)) {
					Actions.Actions_SelectAction_String("branch");
				}
				if (GUI.GUI_Button_Rect_Texture(this.TheController$rects$.elements[3] as Rect, this.TheController$texPull$)) {
					Actions.Actions_SelectAction_String("pull");
				}
			} else {
				if (GUI.GUI_Button_Rect_Texture(new Rect().Constructor_Single_Single_Single_Single(Number(int(Screen.width / 2) - 100), Number(int(Screen.height / 2) - 175), Number(200), Number(100)), this.TheController$texPlayAgain$)) {
					this.TheController_GarbageCollector();
					this.TheController_Start();
				}
			}
		}
		
		public function TheController_GenRects_Int32($num: int): void {
			this.TheController$btnSize$ = Number(Screen.width) / 10;
			this.TheController$margin$ = Number(Screen.width) / 32;
			this.TheController$rects$ = CLIArrayFactory.NewArrayOfValueType(Rect.$Type, $num);
			for (var $i: int = 0; $i < $num; $i = $i + 1) {
				this.TheController$rects$.elements[$i] = new Rect().Constructor_Single_Single_Single_Single(((int(Screen.width / 4) as Number) + (Number($i) * this.TheController$btnSize$)) + (Number($i) * this.TheController$margin$), this.TheController$margin$, this.TheController$btnSize$, this.TheController$btnSize$);
			}
		}
		
		public function TheController_Main(): void {
		}
		
		cil2as static function DefaultValue(): TheController {
			return new TheController().TheController_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.TheController$go$ = reader.ReadUnityEngineObject() as GameObject;
			this.TheController$goCamT$ = reader.ReadUnityEngineObject() as Transform;
			this.TheController$texFork$ = reader.ReadUnityEngineObject() as Texture;
			this.TheController$texClone$ = reader.ReadUnityEngineObject() as Texture;
			this.TheController$texBranch$ = reader.ReadUnityEngineObject() as Texture;
			this.TheController$texPull$ = reader.ReadUnityEngineObject() as Texture;
			this.TheController$texPlayAgain$ = reader.ReadUnityEngineObject() as Texture;
			this.TheController$goNerd$ = reader.ReadUnityEngineObject() as GameObject;
			this.TheController$posNerd$ = Vector3.cil2as::DefaultValue();
			reader.ReadIDeserializable(this.TheController$posNerd$);
			this.TheController$oNerd$ = reader.ReadUnityEngineObject() as GameObject;
			this.TheController$goBull$ = reader.ReadUnityEngineObject() as GameObject;
			this.TheController$posBull$ = Vector3.cil2as::DefaultValue();
			reader.ReadIDeserializable(this.TheController$posBull$);
			this.TheController$oBull$ = reader.ReadUnityEngineObject() as GameObject;
			this.TheController$goFork$ = reader.ReadUnityEngineObject() as GameObject;
			this.TheController$rects$ = CLIArray.TakeOwnership(Rect.$Type, reader.ReadIDeserializableArray(Rect.cil2as::DefaultValue));
			this.TheController$margin$ = reader.ReadFloat();
			this.TheController$btnSize$ = reader.ReadFloat();
			this.TheController$timeElapsed$ = reader.ReadFloat();
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteUnityEngineObject(this.TheController$go$);
			writer.WriteUnityEngineObject(this.TheController$goCamT$);
			writer.WriteUnityEngineObject(this.TheController$texFork$);
			writer.WriteUnityEngineObject(this.TheController$texClone$);
			writer.WriteUnityEngineObject(this.TheController$texBranch$);
			writer.WriteUnityEngineObject(this.TheController$texPull$);
			writer.WriteUnityEngineObject(this.TheController$texPlayAgain$);
			writer.WriteUnityEngineObject(this.TheController$goNerd$);
			writer.WriteIDeserializable(this.TheController$posNerd$);
			writer.WriteUnityEngineObject(this.TheController$oNerd$);
			writer.WriteUnityEngineObject(this.TheController$goBull$);
			writer.WriteIDeserializable(this.TheController$posBull$);
			writer.WriteUnityEngineObject(this.TheController$oBull$);
			writer.WriteUnityEngineObject(this.TheController$goFork$);
			writer.WriteIDeserializableArray(CLIArray.ElementsOf(this.TheController$rects$));
			writer.WriteFloat(this.TheController$margin$);
			writer.WriteFloat(this.TheController$btnSize$);
			writer.WriteFloat(this.TheController$timeElapsed$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.TheController$go$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$go$) as GameObject;
			this.TheController$goCamT$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$goCamT$) as Transform;
			this.TheController$texFork$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$texFork$) as Texture;
			this.TheController$texClone$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$texClone$) as Texture;
			this.TheController$texBranch$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$texBranch$) as Texture;
			this.TheController$texPull$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$texPull$) as Texture;
			this.TheController$texPlayAgain$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$texPlayAgain$) as Texture;
			this.TheController$goNerd$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$goNerd$) as GameObject;
			this.TheController$oNerd$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$oNerd$) as GameObject;
			this.TheController$goBull$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$goBull$) as GameObject;
			this.TheController$oBull$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$oBull$) as GameObject;
			this.TheController$goFork$ = remapper.GetNewInstanceToReplaceOldInstance(this.TheController$goFork$) as GameObject;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.TheController, {"Awake" : "TheController_Awake", "GarbageCollector" : "TheController_GarbageCollector", "Start" : "TheController_Start", "Update" : "TheController_Update", "OnGUI" : "TheController_OnGUI", "GenRects" : "TheController_GenRects_Int32", "Main" : "TheController_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
