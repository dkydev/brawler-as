package engine.component {
	
	public class Hitbox {
		
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		public var width:Number;
		public var height:Number;
		public var depth:Number;
		
		public function Hitbox(x:Number, y:Number, z:Number, width:Number, height:Number, depth:Number):void {
			
			this.x = x;
			this.y = y;
			this.z = z;
			
			this.width = width * 0.5; // only need half
			this.height = height * 0.5;
			this.depth = depth * 0.5;
			
		}
		public function isColliding(hitbox:Hitbox):Boolean {
			
			return (x - hitbox.x < width + hitbox.width && y - hitbox.y < height + hitbox.height && z - hitbox.z < depth + hitbox.depth);
			
		}		
	}
}