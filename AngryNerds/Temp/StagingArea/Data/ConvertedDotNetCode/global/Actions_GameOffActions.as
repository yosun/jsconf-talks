package global {
	
	import System.CLIObject;
	import System.Type;
	import UnityEngine._Object;
	import UnityEngine.GameObject;
	import UnityEngine.Quaternion;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class Actions_GameOffActions extends CLIObject implements IDeserializable {
		
		public static function GameOffActions_Fork_GameObject_Vector3($forkobj: GameObject, $where: Vector3): void {
			var $gameObject: GameObject = (_Object.Object_Instantiate_Object_Vector3_Quaternion($forkobj, $where, Quaternion.identity) as GameObject) as GameObject;
			$gameObject.Object_name_String = "Fork";
		}
		
		public static function GameOffActions_Clone_GameObject($what: GameObject): void {
			var $gameObject: GameObject = (_Object.Object_Instantiate_Object_Vector3_Quaternion($what, Vector3.op_Addition_Vector3_Vector3($what.transform.position, new Vector3().Constructor_Single_Single_Single(Number(0), Number(2), Number(0))), Quaternion.identity) as GameObject) as GameObject;
			$gameObject.Object_name_String = $what.Object_name;
			if ($what.Object_name == "Nerd") {
				($gameObject.GameObject_GetComponent$1$1(EachEntity.$Type) as EachEntity).EachEntity_Init_String_Int32("Nerd", -100);
				ScoreDaemon.ScoreDaemon_AddNerd_Int32(1);
			} else {
				if ($what.Object_name == "Bull") {
					($gameObject.GameObject_GetComponent$1$1(EachEntity.$Type) as EachEntity).EachEntity_Init_String_Int32("Bull", -100);
					ScoreDaemon.ScoreDaemon_AddBull_Int32(1);
				}
			}
		}
		
		public static function GameOffActions_Branch_GameObject($what: GameObject): void {
			var $gameObject: GameObject = (_Object.Object_Instantiate_Object_Vector3_Quaternion($what, Vector3.op_Addition_Vector3_Vector3($what.transform.position, new Vector3().Constructor_Single_Single_Single(Number(0), Number(2), Number(0))), Quaternion.identity) as GameObject) as GameObject;
			var $gameObject2: GameObject = (_Object.Object_Instantiate_Object_Vector3_Quaternion($what, Vector3.op_Addition_Vector3_Vector3($what.transform.position, new Vector3().Constructor_Single_Single_Single(Number(0), Number(2), Number(0))), Quaternion.identity) as GameObject) as GameObject;
			if (_Object.Object_op_Inequality_Object_Object($gameObject, null)) {
				$gameObject.Object_name_String = $what.Object_name;
			}
			if (_Object.Object_op_Inequality_Object_Object($gameObject2, null)) {
				$gameObject2.Object_name_String = $what.Object_name;
			}
			if ($what.Object_name == "Nerd") {
				if (_Object.Object_op_Inequality_Object_Object($gameObject, null)) {
					($gameObject.GameObject_GetComponent$1$1(EachEntity.$Type) as EachEntity).EachEntity_Init_String_Int32("Nerd", -100);
				}
				if (_Object.Object_op_Inequality_Object_Object($gameObject2, null)) {
					($gameObject2.GameObject_GetComponent$1$1(EachEntity.$Type) as EachEntity).EachEntity_Init_String_Int32("Nerd", -100);
				}
				ScoreDaemon.ScoreDaemon_AddNerd_Int32(2);
			} else {
				if ($what.Object_name == "Bull") {
					if (_Object.Object_op_Inequality_Object_Object($gameObject, null)) {
						($gameObject.GameObject_GetComponent$1$1(EachEntity.$Type) as EachEntity).EachEntity_Init_String_Int32("Bull", -100);
					}
					if (_Object.Object_op_Inequality_Object_Object($gameObject2, null)) {
						($gameObject2.GameObject_GetComponent$1$1(EachEntity.$Type) as EachEntity).EachEntity_Init_String_Int32("Bull", -100);
					}
					ScoreDaemon.ScoreDaemon_AddBull_Int32(2);
				}
			}
		}
		
		public static function GameOffActions_Pull_GameObject_Vector3($what: GameObject, $pos: Vector3): void {
			if ($what.Object_name == "Nerd") {
				if (_Object.Object_op_Inequality_Object_Object(Actions.Actions$selectedObj$, null)) {
					Actions.Actions$selectedObj$.rigidbody.isKinematic = false;
				}
				Actions.Actions$selectedObj$ = $what;
				Actions.Actions$selectedObj$.rigidbody.isKinematic = true;
				Actions.Actions$selectedObj$.transform.position = new Vector3().Constructor_Single_Single_Single($pos.x, $pos.y, Number(0));
			}
		}
		
		public function GameOffActions_Push(): void {
		}
		
		cil2as static function DefaultValue(): Actions_GameOffActions {
			return new Actions_GameOffActions().GameOffActions_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function GameOffActions_Constructor(): Actions_GameOffActions {
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.Actions_GameOffActions, {"Fork" : "GameOffActions_Fork_GameObject_Vector3", "Clone" : "GameOffActions_Clone_GameObject", "Branch" : "GameOffActions_Branch_GameObject", "Pull" : "GameOffActions_Pull_GameObject_Vector3", "Push" : "GameOffActions_Push"}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
