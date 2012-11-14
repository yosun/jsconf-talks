package global {
	
	import System.Type;
	import UnityEngine.GameObject;
	import UnityEngine.GUIText;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class ScoreDaemon extends MonoBehaviour implements IDeserializable {
		
		public static var ScoreDaemon$winState$: WinState = WinState.Playing;
		
		public static var ScoreDaemon$Bulls$: int;
		
		public static var ScoreDaemon$Nerds$: int;
		
		public static var ScoreDaemon$turns$: int;
		
		public static var ScoreDaemon$guiNerds$: GUIText;
		
		public static var ScoreDaemon$guiBulls$: GUIText;
		
		public static var ScoreDaemon$guiTurns$: GUIText;
		
		public static var ScoreDaemon$guiWinLose$: GUIText;
		
		public static function ScoreDaemon_Init(): void {
			ScoreDaemon$Bulls$ = 0;
			ScoreDaemon$Nerds$ = 0;
			ScoreDaemon$turns$ = 0;
			ScoreDaemon$guiNerds$ = GameObject.GameObject_Find_String("ScoreNerds").guiText;
			ScoreDaemon$guiBulls$ = GameObject.GameObject_Find_String("ScoreBulls").guiText;
			ScoreDaemon$guiTurns$ = GameObject.GameObject_Find_String("ScoreTurns").guiText;
			ScoreDaemon$guiWinLose$ = GameObject.GameObject_Find_String("ScoreWinLose").guiText;
			ScoreDaemon$winState$ = WinState.Playing;
			ScoreDaemon_UpdateScores();
		}
		
		public static function ScoreDaemon_AddBull_Int32($num: int): void {
			ScoreDaemon$Bulls$ = ScoreDaemon$Bulls$ + $num;
			ScoreDaemon$guiBulls$.text = ScoreDaemon$Bulls$.toString();
		}
		
		public static function ScoreDaemon_KillBull_Int32($num: int): void {
			ScoreDaemon$Bulls$ = ScoreDaemon$Bulls$ - $num;
			ScoreDaemon$guiBulls$.text = ScoreDaemon$Bulls$.toString();
			if (ScoreDaemon$Bulls$ <= 0) {
				ScoreDaemon_Win();
			}
		}
		
		public static function ScoreDaemon_AddNerd_Int32($num: int): void {
			ScoreDaemon$Nerds$ = ScoreDaemon$Nerds$ + $num;
			ScoreDaemon$guiNerds$.text = ScoreDaemon$Nerds$.toString();
		}
		
		public static function ScoreDaemon_KillNerd_Int32($num: int): void {
			ScoreDaemon$Nerds$ = ScoreDaemon$Nerds$ - $num;
			ScoreDaemon$guiNerds$.text = ScoreDaemon$Nerds$.toString();
			if (ScoreDaemon$Nerds$ <= 0) {
				ScoreDaemon_Lose();
			}
		}
		
		public static function ScoreDaemon_AddTurn(): void {
			ScoreDaemon$turns$ = ScoreDaemon$turns$ + 1;
			ScoreDaemon$guiTurns$.text = ScoreDaemon$turns$.toString();
		}
		
		public static function ScoreDaemon_UpdateScores(): void {
			ScoreDaemon$guiBulls$.text = ScoreDaemon$Bulls$.toString();
			ScoreDaemon$guiNerds$.text = ScoreDaemon$Nerds$.toString();
			ScoreDaemon$guiTurns$.text = ScoreDaemon$turns$.toString();
			ScoreDaemon$guiWinLose$.text = "";
		}
		
		public static function ScoreDaemon_Win(): void {
			ScoreDaemon$winState$ = WinState.Won;
			ScoreDaemon$guiWinLose$.text = "NERDS WIN!";
		}
		
		public static function ScoreDaemon_Lose(): void {
			ScoreDaemon$winState$ = WinState.Lost;
			ScoreDaemon$guiWinLose$.text = "BULLS WIN!";
		}
		
		public static function ScoreDaemon_ActiveGame(): Boolean {
			return ScoreDaemon$winState$ == WinState.Playing;
		}
		
		public function ScoreDaemon_Main(): void {
		}
		
		cil2as static function DefaultValue(): ScoreDaemon {
			return new ScoreDaemon().ScoreDaemon_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function ScoreDaemon_Constructor(): ScoreDaemon {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.ScoreDaemon, {"Init" : "ScoreDaemon_Init", "AddBull" : "ScoreDaemon_AddBull_Int32", "KillBull" : "ScoreDaemon_KillBull_Int32", "AddNerd" : "ScoreDaemon_AddNerd_Int32", "KillNerd" : "ScoreDaemon_KillNerd_Int32", "AddTurn" : "ScoreDaemon_AddTurn", "UpdateScores" : "ScoreDaemon_UpdateScores", "Win" : "ScoreDaemon_Win", "Lose" : "ScoreDaemon_Lose", "ActiveGame" : "ScoreDaemon_ActiveGame", "Main" : "ScoreDaemon_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
