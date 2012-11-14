package global {
	
	import System.Type;
	import UnityEngine._Object;
	import UnityEngine.Camera;
	import UnityEngine.Input;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Physics;
	import UnityEngine.Quaternion;
	import UnityEngine.Ray;
	import UnityEngine.RaycastHit;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class 05_RaycastHitInstantiate extends MonoBehaviour implements IDeserializable {
		
		public function 05_RaycastHitInstantiate_Update(): void {
			if (Input.Input_GetMouseButtonDown_Int32(0)) {
				var $ray: Ray = Camera.main.Camera_ScreenPointToRay_Vector3(Input.mousePosition.cil2as::Copy());
				var $raycastHit: RaycastHit = RaycastHit.cil2as::DefaultValue();
				if (Physics.Physics_Raycast_Ray_RaycastHitRef($ray, $raycastHit)) {
					var $name: String = $raycastHit.transform.Component_gameObject.Object_name;
					if ($name == "BouncingBall") {
						_Object.Object_Instantiate_Object_Vector3_Quaternion($raycastHit.transform.Component_gameObject, Vector3.op_Addition_Vector3_Vector3($raycastHit.transform.position, new Vector3().Constructor_Single_Single_Single(Number(0), Number(2), Number(0))), Quaternion.identity);
					}
				}
			}
		}
		
		public function 05_RaycastHitInstantiate_Main(): void {
		}
		
		cil2as static function DefaultValue(): 05_RaycastHitInstantiate {
			return new 05_RaycastHitInstantiate().05_RaycastHitInstantiate_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function 05_RaycastHitInstantiate_Constructor(): 05_RaycastHitInstantiate {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.05_RaycastHitInstantiate, {"Update" : "05_RaycastHitInstantiate_Update", "Main" : "05_RaycastHitInstantiate_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
