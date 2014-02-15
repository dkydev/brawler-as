package engine.component {
	
	import engine.entity.Entity;
	import engine.GameEngine;
	import flash.geom.Vector3D;
	
	public class PositionComponent implements IComponent {
		
		public var position:Vector3D;
		public var dimension:Vector3D;

		public function PositionComponent(x:Number, y:Number, z:Number, width:Number, height:Number, depth:Number):void {
			
			position = new Vector3D(x, y, z);
			dimension = new Vector3D(width, height, depth);
			
		}
		public function toString():String {
			return position.x + ", " + position.y + ", " + position.z;
		}		
		public function get x():Number {
			return position.x;
		}
		public function get y():Number {
			return position.y;
		}
		public function get z():Number {
			return position.z;
		}
		public function set x(x:Number):void {
			position.x = x;
		}
		public function set y(y:Number):void {
			position.y = y;
		}
		public function set z(z:Number):void {
			position.z = z;
		}		
		public function get width():Number {
			return dimension.x;
		}
		public function get height():Number {
			return dimension.y;
		}
		public function get depth():Number {
			return dimension.z;
		}
		public function set width(width:Number):void {
			dimension.x = width;
		}
		public function set height(height:Number):void {
			dimension.y = height;
		}
		public function set depth(depth:Number):void {
			dimension.z = depth;
		}
	}
}