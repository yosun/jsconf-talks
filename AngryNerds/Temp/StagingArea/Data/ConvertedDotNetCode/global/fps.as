package global {
	
	import System.Type;
	import UnityEngine._Object;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Time;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class fps extends MonoBehaviour implements IDeserializable {
		
		public var fps$updateInterval$: Number = 0;
		
		public var fps$accum$: Number = 0;
		
		public var fps$frames$: int;
		
		public var fps$timeleft$: Number = 0;
		
		public function fps_Constructor(): fps {
			this.MonoBehaviour_Constructor();
			this.fps$updateInterval$ = 0.5;
			return this;
		}
		
		public function fps_Start(): void {
			if (!_Object.Object_op_Implicit_Object_Boolean(this.Component_guiText)) {
				MonoBehaviour.MonoBehaviour_print_Object("FramesPerSecond needs a GUIText component!");
				this.Behaviour_enabled_Boolean = false;
			} else {
				this.fps$timeleft$ = this.fps$updateInterval$;
			}
		}
		
		public function fps_Update(): void {
			this.fps$timeleft$ = this.fps$timeleft$ - Time.deltaTime;
			this.fps$accum$ = this.fps$accum$ + (Time.timeScale / Time.deltaTime);
			this.fps$frames$ = this.fps$frames$ + 1;
			if (this.fps$timeleft$ <= Number(0)) {
				this.Component_guiText.text = "" + (this.fps$accum$ / Number(this.fps$frames$)).toString("f2");
				this.fps$timeleft$ = this.fps$updateInterval$;
				this.fps$accum$ = Number(0);
				this.fps$frames$ = 0;
			}
		}
		
		public function fps_Main(): void {
		}
		
		cil2as static function DefaultValue(): fps {
			return new fps().fps_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.fps$updateInterval$ = reader.ReadFloat();
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteFloat(this.fps$updateInterval$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.fps, {"Start" : "fps_Start", "Update" : "fps_Update", "Main" : "fps_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
