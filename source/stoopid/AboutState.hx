package stoopid;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import lime.utils.Assets;

class AboutState extends FlxState
{
	var title:FlxText = new FlxText(0, 150, FlxG.width, 'The Martian', 64);
	var about:FlxText = new FlxText(0, 0, FlxG.width, null, 28);

	override public function create()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, true, null);
		super.create();

		title.setFormat(null, 64, FlxColor.WHITE, CENTER);
		add(title);

		about.setFormat(null, 28, FlxColor.WHITE, CENTER);
		about.y = title.y + 200;
		about.text = 'This game is inspired by the movie\n\"The Martian\", so i made a game about it\n(plz don\'t sue me)';
		add(about);
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
