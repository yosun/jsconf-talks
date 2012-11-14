package global {
	
	import System.Type;
	import UnityEngine._Object;
	import UnityEngine.Collision;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class 06_Collisions extends MonoBehaviour implements IDeserializable {
		
		public function 06_Collisions_OnCollisionEnter_Collision($col: Collision): void {
			if (!_Object.Object_op_Equality_Object_Object($col.Collision_rigidbody, null)) {
				if ($col.Collision_rigidbody.mass != this.Component_rigidbody.mass) {
					MonoBehaviour.MonoBehaviour_print_Object((this.Component_gameObject.Object_name + " destroyed ") + $col.Collision_transform.Object_name);
					_Object.Object_Destroy_Object(this.Component_gameObject);
				}
			}
		}
		
		public function 06_Collisions_Main(): void {
		}
		
		cil2as static function DefaultValue(): 06_Collisions {
			return new 06_Collisions().06_Collisions_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function 06_Collisions_Constructor(): 06_Collisions {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.06_Collisions, {"OnCollisionEnter" : "06_Collisions_OnCollisionEnter_Collision", "Main" : "06_Collisions_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
