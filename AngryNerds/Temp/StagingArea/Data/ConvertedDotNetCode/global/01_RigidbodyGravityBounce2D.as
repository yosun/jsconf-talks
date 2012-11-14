package global {
	
	import System.Type;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Rigidbody;
	import UnityEngine.RigidbodyConstraints;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class 01_RigidbodyGravityBounce2D extends MonoBehaviour implements IDeserializable {
		
		public function 01_RigidbodyGravityBounce2D_Start(): void {
			this.Component_collider.Collider_material.bounciness = 1;
			this.Component_gameObject.GameObject_AddComponent$1$1(Rigidbody.$Type);
			this.Component_rigidbody.useGravity = true;
			this.Component_rigidbody.constraints = RigidbodyConstraints.ValueOf(56);
			this.Component_renderer.Renderer_enabled_Boolean = false;
		}
		
		public function 01_RigidbodyGravityBounce2D_Main(): void {
		}
		
		cil2as static function DefaultValue(): 01_RigidbodyGravityBounce2D {
			return new 01_RigidbodyGravityBounce2D().01_RigidbodyGravityBounce2D_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function 01_RigidbodyGravityBounce2D_Constructor(): 01_RigidbodyGravityBounce2D {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.01_RigidbodyGravityBounce2D, {"Start" : "01_RigidbodyGravityBounce2D_Start", "Main" : "01_RigidbodyGravityBounce2D_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
