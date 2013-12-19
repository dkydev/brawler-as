package engine.component.render {
	
	import dragonBones.animation.WorldClock;
	import engine.component.RenderComponent;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class PlayerRenderable extends RenderComponent {
		
		public function PlayerRenderable() {
			
			super();
			
			container	= new Sprite();
			graphic 	= new Sprite();
			armature 	= AssetManager.getArmature("player");
			shadow 		= new Image(AssetManager.textureAtlas.getTexture("shadow"));
			
			graphic.addChild(armature.display as Sprite);
			
			shadow.pivotX = shadow.width * 0.5;
			shadow.pivotY = shadow.height * 0.5 - 10;
			
			armature.animation.gotoAndPlay("idle");
			
			container.addChild(shadow);
			container.addChild(graphic);
			
		}
	}
}