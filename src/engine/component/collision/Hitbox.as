package engine.component.collision {
	
	import flash.geom.Vector3D;
	
	public class Hitbox {
		
		public var min:Vector3D;
		public var max:Vector3D;
		
		public function Hitbox(x1:Number, y1:Number, z1:Number, x2:Number, y2:Number, z2:Number):void {
			
			this.min = new Vector3D(x1, y1, z1);
			this.max = new Vector3D(x2, y2, z2);
			
		}
	}
}