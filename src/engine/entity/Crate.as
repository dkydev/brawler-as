package engine.entity {
	
	import engine.component.CollisionComponent;
	import engine.component.Hitbox;
	import engine.component.render.ImageRenderable;
	import engine.component.MotionComponent;
	import engine.component.PositionComponent;
	import engine.LevelManager;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Crate extends Entity {
		
		public function Crate(x:Number, y:Number, z:Number):void {
			
			super("crate");
			
			var width:Number = 160;
			var height:Number = 60;
			var depth:Number = 100;
			
			motion 		= new MotionComponent(0, 0, 0);		
			position 	= new PositionComponent(x, y, z, width, height, depth);
			//collision   = new CollisionComponent(0, 0, 0, 160, 60, 100));
			renderable 	= new ImageRenderable("crate");
			
		}
	}
}