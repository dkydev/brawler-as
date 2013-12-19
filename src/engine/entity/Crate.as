package engine.entity {
	
	import engine.component.CollisionComponent;
	import engine.component.Hitbox;
	import engine.component.sprite.ImageSprite;
	import engine.component.MotionComponent;
	import engine.component.PositionComponent;
	import engine.component.SpriteComponent;
	import engine.LevelManager;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Crate extends Entity {
		
		public function Crate(x:Number, y:Number, z:Number):void {
			
			super("crate");
			
			motion 		= new MotionComponent(0, 0, 0);		
			position 	= new PositionComponent(x, y, z, 160, 60, 100);
			collision   = new CollisionComponent(new Hitbox(x, y, z, 160, 60, 100));
			sprite 		= new ImageSprite("crate");
			
		}
	}
}