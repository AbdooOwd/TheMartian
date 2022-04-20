package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import lime.utils.Assets;
import stoopid.Variables;

class CreditState extends FlxState
{
	var quit:FlxText = new FlxText(20, 20, FlxG.width, 'Press ESC to quit', 15);

	// Variables
	var title:FlxText = new FlxText(0, 150, FlxG.width, 'Credits', 64);
	var abdoo:FlxText = new FlxText(0, 150, FlxG.width, 'Abdoo', 30);
	var abdooSub:FlxText = new FlxText(0, 150, FlxG.width, 'Owner', 15);
	var vGame = new FlxText(0, 150, FlxG.width, Variables.version, 20);

	override public function create()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, true, null);
		super.create();

		add(quit);

		// Variables Things Other
		title.screenCenter(X);
		abdoo.screenCenter(X);
		abdooSub.screenCenter(X);
		vGame.screenCenter(X);

		title.setFormat(null, 64, FlxColor.WHITE, CENTER);
		abdoo.setFormat(null, 30, FlxColor.WHITE, CENTER);
		abdooSub.setFormat(null, 15, FlxColor.WHITE, CENTER);
		vGame.setFormat(null, 30, FlxColor.WHITE, CENTER);

		title.y -= 100;
		abdoo.y = title.y + 100;
		abdooSub.y = abdoo.y + 35;
		vGame.y = abdooSub.y + 500;

		add(title);
		add(abdoo);
		add(abdooSub);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
			{
				FlxG.switchState(new MenuState());
			});
		}
	}
}
