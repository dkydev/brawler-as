package engine {
	
	import engine.LevelManager;
	import engine.StarlingGame;
	import starling.core.Starling;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	
	public class GameEngine {
		
		// Input Manager
		// Sound Manager
		// Menu Manager
		private var _levelManager:LevelManager;
		
		private var _starling:Starling;
		private var _starlingGame:StarlingGame;
		
		public function GameEngine():void {
			
			_starling = new Starling(StarlingGame, Main.instance.stage);
			_starling.showStatsAt();
			_starling.addEventListener(Event.ROOT_CREATED, rootCreated);
			
		}		
		private function rootCreated(e:Event):void {
			
			AssetManager.initialize();
			_starlingGame = _starling.root as StarlingGame;
			
			_levelManager = new LevelManager();
			_levelManager.loadLevel("level-1");
			
			// load level events
			
			start();
			
		}
		public function start():void {
			
			_starlingGame.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrameListener);
			_starling.start();
			
		}
		public function stop():void {
			
			_starlingGame.removeEventListener(EnterFrameEvent.ENTER_FRAME, enterFrameListener);
			_starling.stop();
			
			// TODO: destroy everything
			
		}
		public function pause():void {
			
		}
		public function resume():void {
			
		}
		private function enterFrameListener(e:EnterFrameEvent):void {
			
			updateGameEngine();
			
		}
		public function updateGameEngine():void {
			
			_levelManager.update();
			
		}
	}
}