package engine {
	
	import dragonBones.animation.WorldClock;
	import engine.entity.Entity;
	import engine.system.ISystem;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class StarlingGame extends Sprite implements ISystem {
		
		private var _entities:Vector.<Entity>;
		private var _backgroundContainer:Sprite;
		private var _shadowContainer:Sprite;
		private var _entityContainer:Sprite;
		private var _foregroundContainer:Sprite;
		private var _menuContainer:Sprite;
		
		public function StarlingGame():void {
			
			_entities = new Vector.<Entity>();
			
			_backgroundContainer = new Sprite();
			_shadowContainer = new Sprite();
			_entityContainer = new Sprite();
			_foregroundContainer = new Sprite();
			_menuContainer = new Sprite();
			
			scaleX = scaleY = 0.5;
			
			addChild(_backgroundContainer);
			addChild(_shadowContainer);
			addChild(_entityContainer);
			addChild(_foregroundContainer);
			addChild(_menuContainer);
			
		}
		/* INTERFACE engine.system.ISystem */
		public function update(levelManager:LevelManager):void {
			
			for each (var entity:Entity in _entities) {
				entity.renderable.container.x = entity.position.x;
				entity.renderable.container.y = entity.position.y;
				entity.renderable.graphic.y = entity.position.z;
				entity.renderable.shadow.x = entity.position.x;
				entity.renderable.shadow.y = entity.position.y;
				entity.collision.hitboxImage.x = entity.position.x;
				entity.collision.hitboxImage.y = entity.position.z;
			}
			_entityContainer.sortChildren(depthSort); // TODO: sort more efficiently
			WorldClock.clock.advanceTime( -1);
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			if (!entity.position || !entity.renderable) return;
			_entities.push(entity);
			_entityContainer.addChild(entity.renderable.container);
			_shadowContainer.addChild(entity.renderable.shadow);
			
			_foregroundContainer.addChild(entity.collision.hitboxImage);
			
			WorldClock.clock.add(entity.renderable.armature);
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
				_entityContainer.removeChild(entity.renderable.container);
				_shadowContainer.removeChild(entity.renderable.shadow);
				
				_foregroundContainer.removeChild(entity.collision.hitboxImage);
				
				WorldClock.clock.remove(entity.renderable.armature);
			}
			
		}
		private function depthSort(a:DisplayObject, b:DisplayObject):int {
			return a.y > b.y ? 1 : -1;
		}
		public function get entityContainer():Sprite {
			return _entityContainer;
		}
		public function get backgroundContainer():Sprite {
			return _backgroundContainer;
		}
	}
}