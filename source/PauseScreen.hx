import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PauseScreen extends FlxState
{
	public function new()
	{
		super(0x52000000);
	}

	override public function create()
	{
		super.create();
		final pauseTxt = new FlxText(0, 0, FlxG.width, 'Game Paused', 42);
		pauseTxt.setFormat(null, 42, FlxColor.WHITE, CENTER);
		pauseTxt.screenCenter(XY);
		// FlxG.sound.music.pause();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
		{
			// FlxG.sound.music.play();
			FlxG.switchState(new PlayState());
		}
	}
}
