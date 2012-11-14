package global {
	
	import System.Type;
	import UnityEngine.Camera;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class RealBillboard extends MonoBehaviour implements IDeserializable {
		
		public var RealBillboard$cam$: Camera;
		
		public function RealBillboard_Main(): void {
		}
		
		cil2as static function DefaultValue(): RealBillboard {
			return new RealBillboard().RealBillboard_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.RealBillboard$cam$ = reader.ReadUnityEngineObject() as Camera;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteUnityEngineObject(this.RealBillboard$cam$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.RealBillboard$cam$ = remapper.GetNewInstanceToReplaceOldInstance(this.RealBillboard$cam$) as Camera;
		}
		
		public function RealBillboard_Constructor(): RealBillboard {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.RealBillboard, {"Main" : "RealBillboard_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
