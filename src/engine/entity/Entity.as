package engine.entity {
	
	import engine.component.action.ActionComponent;
	import engine.component.collision.CollisionComponent;
	import engine.component.InputComponent;
	import engine.component.MotionComponent;
	import engine.component.PositionComponent;
	import engine.component.render.RenderComponent;
	
	public class Entity {
		
		private var _input:InputComponent;
		private var _action:ActionComponent;
		private var _motion:MotionComponent;
		private var _position:PositionComponent;
		private var _renderable:RenderComponent;
		private var _collision:CollisionComponent;
		private var _entityID:String;
		
		public function Entity(entityID:String):void {
			
			_entityID = entityID;
			
		}
		public function toString():String {
			return "(Entity) " + _entityID;
		}
		public function get entityID():String {
			return _entityID;
		}
		public function get renderable():RenderComponent {
			return _renderable;
		}
		public function set renderable(value:RenderComponent):void {
			_renderable = value;
		}
		public function get position():PositionComponent {
			return _position;
		}
		public function set position(value:PositionComponent):void {
			_position = value;
		}
		public function get motion():MotionComponent {
			return _motion;
		}
		public function set motion(value:MotionComponent):void {
			_motion = value;
		}
		public function get action():ActionComponent {
			return _action;
		}
		public function set action(value:ActionComponent):void {
			_action = value;
		}
		public function get input():InputComponent {
			return _input;
		}
		public function set input(value:InputComponent):void {
			_input = value;
		}		
		public function get collision():CollisionComponent {
			return _collision;
		}		
		public function set collision(value:CollisionComponent):void {
			_collision = value;
		}
	}	
}