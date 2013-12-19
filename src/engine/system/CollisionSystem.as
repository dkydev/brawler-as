package engine.system {
	
	import dragonBones.animation.WorldClock;
	import engine.component.CollisionComponent;
	import engine.component.Hitbox;
	import engine.entity.Entity;
	import engine.LevelManager;
	import starling.display.Image;
	
	public class CollisionSystem implements ISystem {
		
		private var _entities:Vector.<Entity>;
		private var _hitboxes:Vector.<Hitbox>;
		
		public function CollisionSystem():void {
			
			_entities = new Vector.<Entity>();
			
		}		
		/* INTERFACE engine.system.ISystem */		
		public function update(levelManager:LevelManager):void {
			
			//var h1:Hitbox, h2:Hitbox;
			//var dx:Number, dy:Number, dz:Number;
			//for each (var e1:Entity in _entities) {				
				//h1 = e1.collision.hitbox;
				//for (var e2:Entity in _entities) {
					//h2 = e2.collision.hitbox;
					//
					//
					//
					//
					//
				//}
			//}
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			
			if (!entity.position || !entity.motion || !entity.collision || !entity.action) return;
			
			_entities.push(entity);
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
			}
			
		}	
	}
}