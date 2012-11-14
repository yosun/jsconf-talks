package global {
	
	import System.Type;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class ScoreKeeper extends MonoBehaviour implements IDeserializable {
		
		public static var ScoreKeeper$score$: int;
		
		public static function ScoreKeeper_GetScore(): int {
			return ScoreKeeper$score$;
		}
		
		public static function ScoreKeeper_ScoreUp(): void {
			ScoreKeeper$score$ = ScoreKeeper$score$ + 1;
		}
		
		public static function ScoreKeeper_ScoreDown(): void {
			ScoreKeeper$score$ = ScoreKeeper$score$ - 1;
		}
		
		public static function ScoreKeeper_ScoreReset(): void {
			ScoreKeeper$score$ = 0;
		}
		
		public function ScoreKeeper_Main(): void {
		}
		
		cil2as static function DefaultValue(): ScoreKeeper {
			return new ScoreKeeper().ScoreKeeper_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function ScoreKeeper_Constructor(): ScoreKeeper {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.ScoreKeeper, {"GetScore" : "ScoreKeeper_GetScore", "ScoreUp" : "ScoreKeeper_ScoreUp", "ScoreDown" : "ScoreKeeper_ScoreDown", "ScoreReset" : "ScoreKeeper_ScoreReset", "Main" : "ScoreKeeper_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
