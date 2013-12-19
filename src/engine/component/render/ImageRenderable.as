package engine.component.render {
	
	import engine.component.RenderComponent;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class ImageRenderable extends RenderComponent {
		
		public function ImageRenderable(imageId:String) {
			
			super();
			
			container 	= new Sprite();
			graphic 	= new Sprite();
			image 		= new Image(AssetManager.textureAtlas.getTexture(imageId));
			shadow 		= new Image(AssetManager.textureAtlas.getTexture("shadow"));
			
			image.pivotX = image.width * 0.5;
			image.pivotY = image.height * 0.5 + 50;
			shadow.pivotX = shadow.width * 0.5;
			shadow.pivotY = shadow.height * 0.5 - 15;
			shadow.scaleX = shadow.scaleY = 2;
			
			graphic.addChild(image);
			container.addChild(graphic);
			
		}		
	}
}