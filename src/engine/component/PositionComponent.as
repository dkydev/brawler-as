package engine.component {
	
	import engine.entity.Entity;
	import engine.GameEngine;
	
	public class PositionComponent implements IComponent {
		
		private var _x:Number;
		private var _y:Number;
		private var _z:Number;
		private var _width:Number;
		private var _height:Number;
		private var _depth:Number;

		public function PositionComponent(x:Number, y:Number, z:Number, width:Number, depth:Number, height:Number):void {
			
			_x = x;
			_y = y;
			_z = z;
			_width = width;
			_depth = depth;
			_height = height;
			
		}
		public function toString():String {
			return _x + ", " + _y + ", " + _z;
		}
		public function get depth():Number {
			return _depth;
		}		
		public function set depth(value:Number):void {
			_depth = value;
		}		
		public function get height():Number {
			return _height;
		}		
		public function set height(value:Number):void {
			_height = value;
		}		
		public function get width():Number {
			return _width;
		}		
		public function set width(value:Number):void {
			_width = value;
		}		
		public function get z():Number {
			return _z;
		}		
		public function set z(value:Number):void {
			_z = value;
		}		
		public function get y():Number {
			return _y;
		}		
		public function set y(value:Number):void {
			_y = value;
		}		
		public function get x():Number {
			return _x;
		}		
		public function set x(value:Number):void {
			_x = value;
		}
	}
}