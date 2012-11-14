package global {
	
	import System.Type;
	import System.Collections.IEnumerator;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class HeavyBull extends MonoBehaviour implements IDeserializable {
		
		public function HeavyBull_Start(): IEnumerator {
			return new HeavyBull_$Start$3().$Start$3_Constructor_HeavyBull(this).IEnumerable$1_GetEnumerator();
		}
		
		public function HeavyBull_Main(): void {
		}
		
		cil2as static function DefaultValue(): HeavyBull {
			return new HeavyBull().HeavyBull_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function HeavyBull_Constructor(): HeavyBull {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.HeavyBull, {"Start" : "HeavyBull_Start", "Main" : "HeavyBull_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
