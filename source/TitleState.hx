package;

// NOTE: always put code under 'super(), super.create()...'
import Funcs;
import flash.media.Sound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.system.FlxAssets.FlxSoundAsset;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.Assets;

class TitleState extends FlxState
{
	// Variables
	var introText:FlxText;
	private var caseShit:Int = 0;
	var fartText:Array<String> = [];

	// Functions, DIE
	// Thanks  - ninjamuffin99 -

	function getIntroText():Array<Array<String>>
	{
		var text:String = Assets.getText(Paths.txt('introText'));
		var daArray:Array<String> = text.split('\n');

		var textArray:Array<Array<String>> = [];

		for (i in daArray)
		{
			textArray.push(i.split('=='));
		}

		return textArray;
	}

	function createText(text:String)
	{
		introText = new FlxText(0, 0, FlxG.width, text, 40);
		introText.x = FlxG.width - 800;
		introText.y = FlxG.height - 600;

		add(introText);
	}

	function removeText()
	{
		remove(introText);
	}

	function menu()
	{
		// Just a Test
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new MenuState());
		});
	}

	override public function create()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, true, null);
		super.create();

		fartText = FlxG.random.getObject(getIntroText());

		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(Paths.music('menu'), 0, true);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		caseShit++;

		switch (caseShit)
		{
			case 1:
				createText('   Engine:\n\nHaxeFlixel');
			case 71:
				removeText();
			case 85:
				createText('   Owner:\n\nAbdooOwd');
			case 135:
				removeText();
			case 151:
				createText(fartText[0]);
			case 211:
				createText('\n\n' + fartText[1]);
			case 271:
				menu();
		}
		if (FlxG.keys.justPressed.ENTER)
		{
			menu();
		}

		#if debug
		if (FlxG.keys.justPressed.P)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
			{
				FlxG.switchState(new PlayState());
			});
		}
		#end
	}

	// Functions
	// Nothin );
}
