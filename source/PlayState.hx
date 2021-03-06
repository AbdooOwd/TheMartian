package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	// var quit:FlxText = new FlxText(20, 20, FlxG.width, 'Press ESC to quit', 15);
	var player:Player;

	var map:FlxOgmo3Loader;
	var walls:FlxTilemap;

	public var camGame:FlxCamera;
	public var camHUD:FlxCamera;

	override function openSubState(SubState:FlxSubState)
	{
		super.openSubState(SubState);
	}

	override function closeSubState()
	{
		super.closeSubState();
	}

	function placeEntities(entity:EntityData)
	{
		if (entity.name == "player")
		{
			player.setPosition(entity.x, entity.y);
		}
	}

	override public function create()
	{
		FlxG.autoPause = false;
		FlxG.camera.fade(FlxColor.BLACK, 0.33, true, null, true);

		super.create();

		map = new FlxOgmo3Loader(AssetPaths.mars__ogmo, AssetPaths.mars__json);
		walls = map.loadTilemap(AssetPaths.tiles__png, "walls");
		walls.follow();
		walls.setTileProperties(1, NONE);
		walls.setTileProperties(2, ANY);
		add(walls);

		player = new Player();
		map.loadEntities(placeEntities, "entities");

		camGame = new FlxCamera();
		FlxG.cameras.reset(camGame);
		camGame.target = player;
		camGame.zoom = 2;

		camHUD = new FlxCamera();
		FlxG.cameras.add(camHUD);
		camHUD.bgColor.alpha = 0;

		FlxCamera.defaultCameras = [camGame];
		camGame.setScrollBoundsRect(0, 0, camGame.width, camGame.height);

		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.collide(player, walls);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			// FlxG.switchState(new PauseScreen());
			FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
			{
				FlxG.switchState(new MenuState());
			});
		}
	}
}
// DO NOT COPY THIS CODE FOR YOUR GAME EXCEPT FOR UNDERSTANDING AND LEARNING
// DO NOT COPY FOR JUST BEING LAZY
