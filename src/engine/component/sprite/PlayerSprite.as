package engine.component.sprite {
	
	import dragonBones.animation.WorldClock;
	import starling.display.Image;
	import starling.display.Sprite;
	import engine.component.SpriteComponent;
	
	public class PlayerSprite extends SpriteComponent {
		
		public function PlayerSprite() {
			
			super();
			
			graphic 	= new Sprite();
			armature 	= AssetManager.getArmature("player");
			shadow 		= new Image(AssetManager.textureAtlas.getTexture("shadow"));	
			
			addChild(shadow);
			addChild(graphic);
			
			graphic.addChild(armature.display as Sprite);
			
			shadow.pivotX = shadow.width * 0.5;
			shadow.pivotY = shadow.height * 0.5 - 10;
			
			armature.animation.gotoAndPlay("idle");
			WorldClock.clock.add(armature);
			
		}		
	}
}