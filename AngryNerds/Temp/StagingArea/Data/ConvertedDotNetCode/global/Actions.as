package global {
	
	import System.CLIObject;
	import System.Type;
	import UnityEngine.GameObject;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class Actions extends CLIObject implements IDeserializable {
		
		public static var Actions$selectedAction$: Actions_TheActions = Actions_TheActions.None;
		
		public static var Actions$selectedObj$: GameObject;
		
		public static function Actions_SelectAction_String($selectwhat: String): void {
			if ($selectwhat == "fork") {
				Actions$selectedAction$ = Actions_TheActions.Fork;
			} else {
				if ($selectwhat == "clone") {
					Actions$selectedAction$ = Actions_TheActions.Clone;
				} else {
					if ($selectwhat == "branch") {
						Actions$selectedAction$ = Actions_TheActions.Branch;
					} else {
						if ($selectwhat == "pull") {
							Actions$selectedAction$ = Actions_TheActions.Pull;
						}
					}
				}
			}
		}
		
		public static function Actions_PerformAction_GameObject_Vector3($go: GameObject, $pos: Vector3): void {
			if (Actions$selectedAction$ == Actions_TheActions.Clone) {
				Actions_GameOffActions.GameOffActions_Clone_GameObject($go);
			} else {
				if (Actions$selectedAction$ == Actions_TheActions.Branch) {
					Actions_GameOffActions.GameOffActions_Branch_GameObject($go);
				} else {
					if (Actions$selectedAction$ == Actions_TheActions.Pull) {
						Actions_GameOffActions.GameOffActions_Pull_GameObject_Vector3($go, $pos);
					}
				}
			}
		}
		
		cil2as static function DefaultValue(): Actions {
			return new Actions().Actions_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function Actions_Constructor(): Actions {
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.Actions, {"SelectAction" : "Actions_SelectAction_String", "PerformAction" : "Actions_PerformAction_GameObject_Vector3"}, CLIObject.$Type));
		}
		
		public static var _$Type: Type;
	}
}
