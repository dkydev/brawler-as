package engine.component {
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import flash.utils.Dictionary;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class CollisionComponent implements IComponent {
		
		private var _bodyDef:b2BodyDef;
		private var _body:b2Body;
		private var _fixtureDef:b2FixtureDef;
		private var _fixture:b2Fixture;
		
		public var hitboxImage:Image;
		
		public function CollisionComponent(x:Number, y:Number, z:Number, width:Number, height:Number, depth:Number, fixed:Boolean = false):void {
			
			_bodyDef = new b2BodyDef();			
			_fixtureDef = new b2FixtureDef();
			_bodyDef.type = b2Body.b2_dynamicBody;
			_bodyDef.position.Set(x, z);
			
			var shape:b2PolygonShape = new b2PolygonShape();
			shape.SetAsBox(width*0.5, height*0.5);
			_fixtureDef.shape = shape;
			_fixtureDef.density = 1.0;
			
			hitboxImage = new Image(Texture.fromColor(width, height, 0x64ff0064));
			
		}
		public function get fixture():b2Fixture {
			return _fixture;
		}		
		public function set fixture(value:b2Fixture):void {
			_fixture = value;
		}
		public function get body():b2Body {
			return _body;
		}
		public function set body(value:b2Body):void {
			_body = value;
		}
		public function get bodyDef():b2BodyDef {
			return _bodyDef;
		}
		public function get fixtureDef():b2FixtureDef {
			return _fixtureDef;
		}
	}
}