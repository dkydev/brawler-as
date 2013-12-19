package engine.component {
	
	import flash.utils.Dictionary;
	
	public class CollisionComponent implements IComponent {
		
		private var _hitbox:Hitbox;
		
		public function CollisionComponent(hitbox:Hitbox):void {
			
			_hitbox = hitbox;
			
		}
		public function get hitbox():Hitbox {
			return _hitbox;
		}
		public function set hitbox(value:Hitbox):void {
			_hitbox = value;
		}
	}
}