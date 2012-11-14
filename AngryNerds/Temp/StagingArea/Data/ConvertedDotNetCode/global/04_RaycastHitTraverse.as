package global {
	
	import System.Type;
	import UnityEngine.Camera;
	import UnityEngine.Input;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Physics;
	import UnityEngine.Ray;
	import UnityEngine.RaycastHit;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class 04_RaycastHitTraverse extends MonoBehaviour implements IDeserializable {
		
		public function 04_RaycastHitTraverse_Update(): void {
			var $ray: Ray = Camera.main.Camera_ScreenPointToRay_Vector3(Input.mousePosition.cil2as::Copy());
			var $raycastHit: RaycastHit = RaycastHit.cil2as::DefaultValue();
			if (Physics.Physics_Raycast_Ray_RaycastHitRef($ray, $raycastHit)) {
				MonoBehaviour.MonoBehaviour_print_Object(((($raycastHit.point + " hits ") + $raycastHit.transform.Object_name) + ", which is a gameobject located at ") + $raycastHit.transform.position);
			}
		}
		
		public function 04_RaycastHitTraverse_Main(): void {
		}
		
		cil2as static function DefaultValue(): 04_RaycastHitTraverse {
			return new 04_RaycastHitTraverse().04_RaycastHitTraverse_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function 04_RaycastHitTraverse_Constructor(): 04_RaycastHitTraverse {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.04_RaycastHitTraverse, {"Update" : "04_RaycastHitTraverse_Update", "Main" : "04_RaycastHitTraverse_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
