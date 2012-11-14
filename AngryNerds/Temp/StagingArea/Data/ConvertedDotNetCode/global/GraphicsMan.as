package global {
	
	import System.Type;
	import UnityEngine._Object;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Resources;
	import UnityEngine.Texture;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class GraphicsMan extends MonoBehaviour implements IDeserializable {
		
		public static var GraphicsMan$texBullbo$: Texture;
		
		public static var GraphicsMan$sizeBullbo$: Vector3 = new Vector3().Constructor_Single_Single_Single(0.6, 0.6, Number(0));
		
		public static var GraphicsMan$texBullzo$: Texture;
		
		public static var GraphicsMan$sizeBullzo$: Vector3 = new Vector3().Constructor_Single_Single_Single(1.3, 1.3, Number(0));
		
		public static var GraphicsMan$texCamo$: Texture;
		
		public static var GraphicsMan$sizeCamo$: Vector3 = new Vector3().Constructor_Single_Single_Single(0.85, 0.85, Number(0));
		
		public static var GraphicsMan$texMrBull$: Texture;
		
		public static var GraphicsMan$sizeMrBull$: Vector3 = new Vector3().Constructor_Single_Single_Single(1.1, 1.1, Number(0));
		
		public static var GraphicsMan$texHD$: Texture;
		
		public static var GraphicsMan$sizeHD$: Vector3 = new Vector3().Constructor_Single_Single_Single(0.3, 0.3, Number(0));
		
		public static var GraphicsMan$texKnerdby$: Texture;
		
		public static var GraphicsMan$sizeKnerdby$: Vector3 = new Vector3().Constructor_Single_Single_Single(1.1, 1.1, Number(0));
		
		public static var GraphicsMan$texNerdbo$: Texture;
		
		public static var GraphicsMan$sizeNerdbo$: Vector3 = new Vector3().Constructor_Single_Single_Single(0.8, 0.8, Number(0));
		
		public static var GraphicsMan$texProfTris$: Texture;
		
		public static var GraphicsMan$sizeProfTris$: Vector3 = new Vector3().Constructor_Single_Single_Single(0.8, 0.8, Number(0));
		
		public static var GraphicsMan$texNerdSumo$: Texture;
		
		public static var GraphicsMan$sizeNerdSumo$: Vector3 = new Vector3().Constructor_Single_Single_Single(1.3, 1.3, Number(0));
		
		public static function GraphicsMan_LoadCharacterTextures(): void {
			GraphicsMan$texBullbo$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texBullbo$, "bully_bullbo");
			GraphicsMan$texBullzo$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texBullzo$, "bully_bullzo");
			GraphicsMan$texCamo$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texCamo$, "bully_camo");
			GraphicsMan$texMrBull$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texMrBull$, "bully_mrbull");
			GraphicsMan$texHD$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texHD$, "nerd_humptydumpty");
			GraphicsMan$texKnerdby$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texKnerdby$, "nerd_knerdby");
			GraphicsMan$texNerdbo$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texNerdbo$, "nerd_nerdbo");
			GraphicsMan$texProfTris$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texProfTris$, "nerd_proftris");
			GraphicsMan$texNerdSumo$ = GraphicsMan_NegAssign_Texture_String(GraphicsMan$texNerdSumo$, "nerd_sumonerd");
		}
		
		public static function GraphicsMan_NegAssign_Texture_String($check: Texture, $filename: String): Texture {
			return !_Object.Object_op_Equality_Object_Object($check, null) ? $check : (Resources.Resources_Load_String("Graphics/" + $filename) as Texture);
		}
		
		public function GraphicsMan_Main(): void {
		}
		
		cil2as static function DefaultValue(): GraphicsMan {
			return new GraphicsMan().GraphicsMan_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public function GraphicsMan_Constructor(): GraphicsMan {
			this.MonoBehaviour_Constructor();
			return this;
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.GraphicsMan, {"LoadCharacterTextures" : "GraphicsMan_LoadCharacterTextures", "NegAssign" : "GraphicsMan_NegAssign_Texture_String", "Main" : "GraphicsMan_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
