package;

// NOTE: always put code under 'super(), super.create()...'
// import flash.media.Sound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxSoundAsset;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import lime.utils.Assets;
import stoopid.AboutState;

class MenuState extends FlxState
{
	// Variables
	var title:FlxText;
	var credit:FlxText;

	var bg:FlxSprite;

	var playButton:FlxButton;
	var aboutButton:FlxButton;
	var creditButton:FlxButton;

	override public function create()
	{
		// bg
		bg = new FlxSprite(0, 0, Paths.image('menu'));
		bg.scale.set(10, 10);
		bg.screenCenter(XY);
		add(bg);

		FlxG.camera.fade(FlxColor.BLACK, 0.33, true, null);
		super.create();

		// FlxG.camera.flash(FlxColor.GRAY, 1.5);

		// Title
		title = new FlxText(0, 150, FlxG.width, 'The Martian', 64);
		title.setFormat(null, 64, FlxColor.WHITE, CENTER);
		title.y -= 100;
		add(title);

		// Credit Text
		credit = new FlxText(0, 0, FlxG.width, 'By AbdooOwd', 11);
		credit.setFormat(null, 11, FlxColor.WHITE, CENTER);
		credit.y = FlxG.height - 35;
		add(credit);

		// Buttons
		playButton = new FlxButton(0, 0, 'Play', ntrPlay);
		playButton.y = title.y + 260;
		playButton.screenCenter(X);
		// playButton.scale.set(3, 3);
		// playButton.updateHitbox();
		add(playButton);

		aboutButton = new FlxButton(0, 0, 'About', ntrAbout);
		aboutButton.y = playButton.y + 90;
		aboutButton.screenCenter(X);
		add(aboutButton);

		creditButton = new FlxButton(0, 0, 'Credits', ntrCredit);
		creditButton.y = playButton.y + 40;
		creditButton.screenCenter(X);
		add(creditButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
			{
				FlxG.switchState(new TitleState());
			});
		}

		// title.y++;
		if (title.y > FlxG.height)
		{
			title.y = 0 - 64;
		}

		if (FlxG.keys.justPressed.F)
		{
			lime.app.Application.current.window.alert('Current State: ' + 'MenuState');
		}

		/*if (FlxG.sound.music == null)
			{
				FlxG.sound.playMusic(Paths.music(''), 0);

				FlxG.sound.music.fadeIn(4, 0, 0.7);
		}*/
	}

	// Functions
	function ntrPlay()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new PlayState());
		});
	}

	function ntrAbout()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new AboutState());
		});
		// FlxG.sound.play(Paths.sound('ESCAPE'));
	}

	function ntrCredit()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new CreditState());
		});
	}
}
