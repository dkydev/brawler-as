package engine.entity {
	
	import engine.component.collision.CollisionComponent;
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
			var height:Number = 100;
			var depth:Number = 60;
			
			motion 		= new MotionComponent(0, 0, 0);		
			position 	= new PositionComponent(x, y, z, width, height, depth);
			collision   = new CollisionComponent(0, 0, 0, width, height, depth);
			renderable 	= new ImageRenderable("crate", 0, height);
			
			renderable.shadow.scaleX = renderable.shadow.scaleY = 2;
			
		}
	}
}