package engine.component {
	
	import dragonBones.animation.WorldClock;
	import dragonBones.Armature;
	import engine.entity.Entity;
	import engine.GameEngine;
	import engine.LevelManager;
	import engine.StarlingGame;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class SpriteComponent extends Sprite implements IComponent {
		
		private var _graphic:Sprite;
		private var _image:Image;
		private var _armature:Armature;
		private var _shadow:Image;
		
		public function SpriteComponent():void {
			
			super();
			
		}
		public function playAnimation(animationName:String):void {
			
			if (_armature.animation.lastAnimationState.name != animationName) {
				_armature.animation.gotoAndPlay(animationName);
			}
			
		}
		public function get armature():Armature {
			return _armature;
		}		
		public function set armature(value:Armature):void {
			_armature = value;
		}		
		public function get shadow():Image {
			return _shadow;
		}		
		public function set shadow(value:Image):void {
			_shadow = value;
		}		
		public function get graphic():Sprite {
			return _graphic;
		}		
		public function set graphic(value:Sprite):void {
			_graphic = value;
		}
		public function get image():Image {
			return _image;
		}		
		public function set image(value:Image):void {
			_image = value;
		}
	}
}