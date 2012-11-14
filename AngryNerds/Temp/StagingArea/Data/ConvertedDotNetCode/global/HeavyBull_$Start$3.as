package global {
	
	import Boo.Lang.GenericGenerator$1;
	import System.Type;
	import System.Collections.Generic.IEnumerator$1;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public final class HeavyBull_$Start$3 extends GenericGenerator$1 implements IDeserializable {
		
		public var $self_$5: HeavyBull;
		
		public function $Start$3_Constructor_HeavyBull($self_: HeavyBull): HeavyBull_$Start$3 {
			this.GenericGenerator$1_Constructor();
			this.$self_$5 = $self_;
			return this;
		}
		
		override public function IEnumerable$1_GetEnumerator(): IEnumerator$1 {
			return new HeavyBull_$Start$3_$().$_Constructor_HeavyBull(this.$self_$5);
		}
		
		cil2as static function DefaultValue(): HeavyBull_$Start$3 {
			return new HeavyBull_$Start$3();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.HeavyBull_$Start$3, {"GetEnumerator" : "IEnumerable$1_GetEnumerator"}, GenericGenerator$1.$Type));
		}
		
		public static var _$Type: Type;
	}
}
