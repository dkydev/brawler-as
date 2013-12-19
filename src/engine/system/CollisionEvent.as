package engine.system {
	
	import engine.entity.Entity;
	
	public class CollisionEvent {
		
		private var _e1:Entity;
		private var _e2:Entity;
		private var _dX:Number;
		private var _dY:Number;
		private var _dZ:Number;
		
		public function CollisionEvent(e1:Entity, e2:Entity, dX:Number, dY:Number, dZ:Number) {
			
			_e1 = e1;
			_e2 = e2;
			_dX = dX;
			_dY = dY;
			_dZ = dZ;
		
		}
		public function get e1():Entity {
			return _e1;
		}
		public function get e2():Entity {
			return _e2;
		}
		public function get dX():Number {
			return _dX;
		}		
		public function get dY():Number {
			return _dY;
		}		
		public function get dZ():Number {
			return _dZ;
		}
	}
}