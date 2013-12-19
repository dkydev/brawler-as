package engine.system {
	
	import engine.entity.Entity;
	import engine.LevelManager;
	
	public class ActionSystem implements ISystem {
		
		private var _entities:Vector.<Entity>;
		
		public function ActionSystem():void {
			
			_entities = new Vector.<Entity>();
			
		}
		/* INTERFACE engine.system.ISystem */
		public function update(levelManager:LevelManager):void {
			
			for each (var entity:Entity in _entities) {
				entity.action.update(levelManager, entity);
			}
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			
			if (!entity.action) return;
			
			_entities.push(entity);
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
			}
			
		}
	}
}