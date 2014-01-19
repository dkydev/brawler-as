package engine.component.collision {
	
	import engine.component.IComponent;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class CollisionComponent implements IComponent {
		
		public var hitbox:Hitbox; // maybe an array for more complex collisions? (i.e headshots)
		
		// somehow map this hitbox with certain other hitboxes
		// to limit checks and collision events
		
		//public var mass:Number;
		
		public var block:Boolean;
		
		public var hitboxImage:Image;
		
		public function CollisionComponent(x:Number, y:Number, z:Number, width:Number, height:Number, depth:Number, block:Boolean = false):void {
			
			this.hitbox = new Hitbox(x, y, z, width, height, depth);
			
			var bmpData:BitmapData = new BitmapData(width, height + depth, true, 0x64ff0064);
			bmpData.fillRect(new Rectangle(0, depth, width, height), 0x648A0036);
			
			hitboxImage = new Image(Texture.fromBitmapData(bmpData));
			//hitboxImage.pivotX = width * 0.5;
			hitboxImage.pivotY = height;
			
			this.block = block;
		
		}
	}
}