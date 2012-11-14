package global {
	
	import System.Type;
	import UnityEngine._Object;
	import UnityEngine.Collision;
	import UnityEngine.Mathf;
	import UnityEngine.MonoBehaviour;
	import UnityEngine.Random;
	import UnityEngine.RigidbodyConstraints;
	import UnityEngine.Texture;
	import UnityEngine.Transform;
	import UnityEngine.Vector3;
	import UnityEngine.Serialization.IDeserializable;
	import UnityEngine.Serialization.PPtrRemapper;
	import UnityEngine.Serialization.SerializedStateReader;
	import UnityEngine.Serialization.SerializedStateWriter;
	
	public class EachEntity extends MonoBehaviour implements IDeserializable {
		
		public var EachEntity$myType$: String;
		
		public var EachEntity$ReactFunction$: Function;
		
		public var EachEntity$dir$: int;
		
		public var EachEntity$force$: Vector3 = Vector3.cil2as::DefaultValue();
		
		public var EachEntity$other$: String;
		
		public function EachEntity_Constructor(): EachEntity {
			this.MonoBehaviour_Constructor();
			this.EachEntity$dir$ = 1;
			return this;
		}
		
		public function EachEntity_ReactLikeBull(): Function {
			if (this.EachEntity$other$ == "Nerd") {
				ScoreDaemon.ScoreDaemon_KillBull_Int32(1);
				this.EachEntity_Die();
			}
			return null;
		}
		
		public function EachEntity_ReactLikeNerd(): Function {
			if (this.EachEntity$other$ == "Bull") {
				ScoreDaemon.ScoreDaemon_KillNerd_Int32(1);
				this.EachEntity_Die();
			}
			return null;
		}
		
		public function EachEntity_Init_String_Int32($type: String, $num: int): void {
			this.EachEntity$myType$ = $type;
			if ($num < -10) {
				this.EachEntity$dir$ = int(Mathf.Round_Single(Number(Random.Random_Range_Int32_Int32(-2, 2))));
			} else {
				this.EachEntity$dir$ = $num;
			}
			this.EachEntity$force$.cil2as::Assign(Vector3.op_Multiply_Single_Vector3(Number(this.EachEntity$dir$), new Vector3().Constructor_Single_Single_Single(Number(1), Number(0), Number(0))));
			if (this.EachEntity$myType$ == "Nerd") {
				this.EachEntity$ReactFunction$ = this.EachEntity_ReactLikeNerd;
				if (this.EachEntity$dir$ == -2) {
					this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texHD$, GraphicsMan.GraphicsMan$sizeHD$.cil2as::Copy());
				} else {
					if (this.EachEntity$dir$ == -1) {
						this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texKnerdby$, GraphicsMan.GraphicsMan$sizeKnerdby$.cil2as::Copy());
					} else {
						if (this.EachEntity$dir$ == 0) {
							this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texNerdbo$, GraphicsMan.GraphicsMan$sizeNerdbo$.cil2as::Copy());
						} else {
							if (this.EachEntity$dir$ == 1) {
								this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texProfTris$, GraphicsMan.GraphicsMan$sizeProfTris$.cil2as::Copy());
							} else {
								this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texNerdSumo$, GraphicsMan.GraphicsMan$sizeNerdSumo$.cil2as::Copy());
							}
						}
					}
				}
			} else {
				this.EachEntity$ReactFunction$ = this.EachEntity_ReactLikeBull;
				if (this.EachEntity$dir$ == -2) {
					this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texBullbo$, GraphicsMan.GraphicsMan$sizeBullbo$.cil2as::Copy());
				} else {
					if (this.EachEntity$dir$ == -1) {
						this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texBullzo$, GraphicsMan.GraphicsMan$sizeBullzo$.cil2as::Copy());
					} else {
						if (this.EachEntity$dir$ == 0) {
							this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texCamo$, GraphicsMan.GraphicsMan$sizeCamo$.cil2as::Copy());
						} else {
							this.EachEntity_SetTex_Texture_Vector3(GraphicsMan.GraphicsMan$texMrBull$, GraphicsMan.GraphicsMan$sizeMrBull$.cil2as::Copy());
						}
					}
				}
			}
			this.Component_rigidbody.useGravity = true;
			this.Component_rigidbody.isKinematic = false;
			this.Component_rigidbody.constraints = RigidbodyConstraints.ValueOf(56);
		}
		
		public function EachEntity_SetTex_Texture_Vector3($tex: Texture, $size: Vector3): void {
			var $transform: Transform = this.Component_transform.Transform_Find_String("Billboard");
			$transform.Component_renderer.Renderer_material.Material_mainTexture_Texture = $tex;
			$transform.parent.localScale = $size.cil2as::Copy();
			$transform.localScale = Vector3.op_Multiply_Vector3_Single($transform.localScale, Number(1) / $size.x);
		}
		
		public function EachEntity_OnCollisionEnter_Collision($col: Collision): void {
			var $name: String = $col.Collision_transform.Object_name;
			this.EachEntity$other$ = $name;
			this.EachEntity$ReactFunction$();
			this.EachEntity$other$ = null;
			if (($name == "Wall") || ($name == "Fork")) {
				this.EachEntity$dir$ = this.EachEntity$dir$ * -1;
				this.EachEntity$force$.cil2as::Assign(Vector3.op_Multiply_Vector3_Single(this.EachEntity$force$, Number(this.EachEntity$dir$)));
				this.Component_rigidbody.Rigidbody_AddForce_Vector3(this.EachEntity$force$.cil2as::Copy());
			}
		}
		
		public function EachEntity_Die(): void {
			_Object.Object_Destroy_Object(this.Component_gameObject);
		}
		
		public function EachEntity_FixedUpdate(): void {
			this.Component_rigidbody.Rigidbody_AddForce_Vector3(this.EachEntity$force$.cil2as::Copy());
		}
		
		public function EachEntity_Main(): void {
		}
		
		cil2as static function DefaultValue(): EachEntity {
			return new EachEntity().EachEntity_Constructor();
		}
		
		public function Deserialize(reader: SerializedStateReader): void {
			this.EachEntity$dir$ = reader.ReadInt();
			this.EachEntity$force$ = Vector3.cil2as::DefaultValue();
			reader.ReadIDeserializable(this.EachEntity$force$);
			this.EachEntity$other$ = reader.ReadString();
		}
		
		public function Serialize(writer: SerializedStateWriter): void {
			writer.WriteInt(this.EachEntity$dir$);
			writer.WriteIDeserializable(this.EachEntity$force$);
			writer.WriteString(this.EachEntity$other$);
		}
		
		public function RemapPPtrs(remapper: PPtrRemapper): void {
		}
		
		public static function get $Type(): Type {
			return _$Type != null ? _$Type : (_$Type = new Type(global.EachEntity, {"ReactLikeBull" : "EachEntity_ReactLikeBull", "ReactLikeNerd" : "EachEntity_ReactLikeNerd", "Init" : "EachEntity_Init_String_Int32", "SetTex" : "EachEntity_SetTex_Texture_Vector3", "OnCollisionEnter" : "EachEntity_OnCollisionEnter_Collision", "Die" : "EachEntity_Die", "FixedUpdate" : "EachEntity_FixedUpdate", "Main" : "EachEntity_Main"}, MonoBehaviour.$Type));
		}
		
		public static var _$Type: Type;
	}
}
