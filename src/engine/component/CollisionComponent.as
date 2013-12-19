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
		
		public var hitbox:Hitbox; // maybe an array for more complex collisions? (i.e headshots)
		
		// somehow map this hitbox with certain other hitboxes
		// to limit checks and collision events
		
		//public var mass:Number;
		
		public var fixed:Boolean;
		
		public var hitboxImage:Image;
		
		public function CollisionComponent(x:Number, y:Number, z:Number, width:Number, height:Number, depth:Number, fixed:Boolean = false):void {
			
			this.hitbox = new Hitbox(x, y, z, width, height, depth);
			this.fixed = fixed;
			
			hitboxImage = new Image(Texture.fromColor(width, height, 0x64ff0064));
			hitboxImage.pivotX = width * 0.5;
			hitboxImage.pivotY = height;
		
		}
	}
}