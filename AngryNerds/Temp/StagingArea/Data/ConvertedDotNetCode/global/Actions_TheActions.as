package global {
	
	import System.Enum;
	import System.Type;
	
	public final class Actions_TheActions extends Enum {
		
		public static const None: Actions_TheActions = new Actions_TheActions("None", 0);
		
		public static const Fork: Actions_TheActions = new Actions_TheActions("Fork", 1);
		
		public static const Clone: Actions_TheActions = new Actions_TheActions("Clone", 2);
		
		public static const Branch: Actions_TheActions = new Actions_TheActions("Branch", 3);
		
		public static const Pull: Actions_TheActions = new Actions_TheActions("Pull", 4);
		
		public static function ValueOf($value: int): Actions_TheActions {
			switch ($value) {
				case 0:
					return None;
				case 1:
					return Fork;
				case 2:
					return Clone;
				case 3:
					return Branch;
				case 4:
					return Pull;
			}
			return new Actions_TheActions($value.toString(), $value);
		}
		
		public function Actions_TheActions($name: String, $value: int) {
			super($name, $value);
		}
		
		cil2as static function DefaultValue(): Actions_TheActions {
			return ValueOf(0);
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.Actions_TheActions, {}, Enum.$Type));
		}
		
		public static var _$Type: Type;
	}
}
