package global {
	
	import System.Type;
	import UnityEngine.Color;
	import UnityEngine.GameObject;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Random;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class RandColors extends MonoBehaviour implements IDeserializable {
		
		public var RandColors$on$: Boolean;
		
		public var RandColors$go$: GameObject;
		
		public function RandColors_Start(): void {
			this.RandColors$go$ = GameObject.GameObject_Find_String("BouncingBall").transform.Transform_Find_String("Billboard").Component_gameObject;
		}
		
		public function RandColors_ToggleColors(): void {
			if (this.RandColors$on$) {
				this.RandColors$on$ = false;
			} else {
				this.RandColors$on$ = true;
			}
		}
		
		public function RandColors_Update(): void {
			if (this.RandColors$on$) {
				this.RandColors$go$.renderer.Renderer_material.Material_color_Color = new Color().Constructor_Single_Single_Single_Single(Random.Random_Range_Single_Single(Number(0), 1), Random.Random_Range_Single_Single(Number(0), 1), Random.Random_Range_Single_Single(Number(0), 1), Number(1));
			}
		}
		
		public function RandColors_Main(): void {
		}
		
		cil2as static function DefaultValue(): RandColors {
			return new RandColors().RandColors_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.RandColors$on$ = reader.ReadBool();
			reader.Align();
			this.RandColors$go$ = reader.ReadUnityEngineObject() as GameObject;
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteBool(this.RandColors$on$);
			writer.Align();
			writer.WriteUnityEngineObject(this.RandColors$go$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
			this.RandColors$go$ = remapper.GetNewInstanceToReplaceOldInstance(this.RandColors$go$) as GameObject;
		}
		
		public function RandColors_Constructor(): RandColors {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.RandColors, {"Start" : "RandColors_Start", "ToggleColors" : "RandColors_ToggleColors", "Update" : "RandColors_Update", "Main" : "RandColors_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
