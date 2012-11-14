package global {
	
	import System.Enum;
	import System.Type;
	
	public final class WinState extends Enum {
		
		public static const Playing: WinState = new WinState("Playing", 0);
		
		public static const Won: WinState = new WinState("Won", 1);
		
		public static const Lost: WinState = new WinState("Lost", 2);
		
		public static function ValueOf($value: int): WinState {
			switch ($value) {
				case 0:
					return Playing;
				case 1:
					return Won;
				case 2:
					return Lost;
			}
			return new WinState($value.toString(), $value);
		}
		
		public function WinState($name: String, $value: int) {
			super($name, $value);
		}
		
		cil2as static function DefaultValue(): WinState {
			return ValueOf(0);
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.WinState, {}, Enum.$Type));
		}
		
		public static var _$Type: Type;
	}
}
