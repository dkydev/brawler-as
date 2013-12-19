package engine {
	
	import dragonBones.animation.WorldClock;
	import engine.entity.Entity;
	import engine.system.ISystem;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
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
			
			scaleX = scaleY = 0.5;
			
			addChild(_backgroundContainer);
			addChild(_shadowContainer);
			addChild(_entityContainer);
			
		}
		/* INTERFACE engine.system.ISystem */
		public function update(levelManager:LevelManager):void {
			
			for each (var entity:Entity in _entities) {
				entity.sprite.x = entity.position.x;
				entity.sprite.y = entity.position.y;
				entity.sprite.graphic.y = -entity.position.z;	
				entity.sprite.shadow.x = entity.position.x;
				entity.sprite.shadow.y = entity.position.y;
			}
			_entityContainer.sortChildren(depthSort); // TODO: sort more efficiently
			WorldClock.clock.advanceTime( -1);
			
		}
		public function addEntity(entity:Entity):void {
			
			removeEntity(entity);
			if (!entity.position || !entity.sprite) return;
			_entities.push(entity);
			_entityContainer.addChild(entity.sprite);
			_shadowContainer.addChild(entity.sprite.shadow);
			
		}
		public function removeEntity(entity:Entity):void {
			
			if (_entities.indexOf(entity) != -1) {
				_entities.splice(_entities.indexOf(entity), 1);
				_entityContainer.removeChild(entity.sprite);
				_shadowContainer.removeChild(entity.sprite.shadow);
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