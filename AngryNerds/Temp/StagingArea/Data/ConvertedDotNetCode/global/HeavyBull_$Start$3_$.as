package global {
	
	import Boo.Lang.GenericGeneratorEnumerator$1;
	import System.Type;
	import System.Collections.IEnumerator;
	import UnityEngine._Object;
	import UnityEngine.WaitForSeconds;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	import upp.UPPReplace;
	
	public final class HeavyBull_$Start$3_$ extends GenericGeneratorEnumerator$1 implements IEnumerator, IDeserializable {
		
		public var $self_$4: HeavyBull;
		
		public function $_Constructor_HeavyBull($self_: HeavyBull): HeavyBull_$Start$3_$ {
			this.GenericGeneratorEnumerator$1_Constructor();
			this.$self_$4 = $self_;
			return this;
		}
		
		override public function IEnumerator_MoveNext(): Boolean {
			var _0: Boolean = false;
			switch (this.GenericGeneratorEnumerator$1$_state$) {
				case 1:
					{
						UPPReplace.UJump("IL_66");
					}
				case 2:
					{
						UPPReplace.UJump("IL_32");
					}
				default:
					{
						break;
					}
			}
			UPPReplace.ULabel("IL_32");
			var $arg_67_0: int;
			if (_Object.Object_op_Equality_Object_Object(this.$self_$4.Component_rigidbody, null)) {
				$arg_67_0 = this.GenericGeneratorEnumerator$1_Yield_Int32_T(2, new WaitForSeconds().WaitForSeconds_Constructor_Single(0.1)) ? 1 : 0;
				{
					_0 = $arg_67_0 != 0;
					UPPReplace.UJump("return");
				}
			}
			this.$self_$4.Component_rigidbody.mass = Number(1000);
			this.GenericGeneratorEnumerator$1_YieldDefault_Int32(1);
			UPPReplace.ULabel("IL_66");
			$arg_67_0 = 0;
			{
				_0 = $arg_67_0 != 0;
				UPPReplace.UJump("return");
			}
			UPPReplace.ULabel("return");
			return _0;
		}
		
		cil2as static function DefaultValue(): HeavyBull_$Start$3_$ {
			return new HeavyBull_$Start$3_$();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.HeavyBull_$Start$3_$, {"MoveNext" : "IEnumerator_MoveNext"}, GenericGeneratorEnumerator$1.$Type));
		}
		
		public static var _$Type: Type;
	}
}
