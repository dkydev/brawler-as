package engine.component.render {
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class PlayerRenderable extends RenderComponent {
		
		public function PlayerRenderable() {
			
			super();
			
			container	= new Sprite();
			graphic 	= new Sprite();
			armature 	= AssetManager.getArmature("player");
			shadow 		= new Image(AssetManager.textureAtlas.getTexture("shadow"));
			
			var armatureSprite:Sprite = armature.display as Sprite;
			graphic.addChild(armatureSprite);
			
			armature.animation.gotoAndPlay("idle");
			
			container.addChild(shadow);
			container.addChild(graphic);
			
		}
	}
}