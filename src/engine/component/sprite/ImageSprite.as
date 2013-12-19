package engine.component.sprite {
	
	public class ImageSprite extends SpriteComponent {
		
		public function ImageSprite(imageId:String) {
			
			super();
			
			sprite.graphic 	= new Sprite();
			
			sprite.image 	= new Image(AssetManager.textureAtlas.getTexture(imageId));
			sprite.shadow 	= new Image(AssetManager.textureAtlas.getTexture("shadow"));
			
			sprite.addChild(sprite.graphic);
			sprite.graphic.addChild(sprite.image);
			
			sprite.image.pivotX = sprite.image.width * 0.5;
			sprite.image.pivotY = sprite.image.height * 0.5 + 50;
			
			sprite.shadow.pivotX = sprite.shadow.width * 0.5;
			sprite.shadow.pivotY = sprite.shadow.height * 0.5 - 15;			
			sprite.shadow.scaleX = sprite.shadow.scaleY = 2;
			
		}		
	}
}