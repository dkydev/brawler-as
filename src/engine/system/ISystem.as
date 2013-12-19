package engine.system {
	
	import engine.entity.Entity;
	import engine.LevelManager;
	
	public interface ISystem {
		
		function update(levelManager:LevelManager):void;
		
		function addEntity(entity:Entity):void;
		function removeEntity(entity:Entity):void;
		
	}	
}