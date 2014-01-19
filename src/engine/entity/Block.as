package engine.entity {
	
	import engine.component.collision.CollisionComponent;
	import engine.component.MotionComponent;
	import engine.component.PositionComponent;
	import engine.component.render.ImageRenderable;
	import engine.component.render.RenderComponent;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class Block extends Entity {
		
		public function Block(x:Number, y:Number, z:Number, width:Number, height:Number, depth:Number, mass:Number = 1):void {
			
			super("block");
			position = new PositionComponent(x, y, z, width, height, depth);
			motion = new MotionComponent(0, 0, 0, 0);
			collision = new CollisionComponent(0, 0, 0, width, height, depth, true);
			motion.gravity = 0;
			
			renderable = new RenderComponent();
			
			var bmpData:BitmapData = new BitmapData(width, height + depth, false, 0xff1333BF);
			bmpData.fillRect(new Rectangle(0, depth, width, height), 0xff061452);
			
			renderable.container = new Sprite();
			renderable.graphic = new Sprite();
			
			renderable.image = new Image(Texture.fromBitmapData(bmpData, true));
			renderable.image.pivotY = height;
			
			renderable.graphic.addChild(renderable.image);
			renderable.container.addChild(renderable.graphic);
			
		}		
	}
}