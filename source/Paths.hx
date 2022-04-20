package;

import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

// Forked From Friday Night Source Code
class Paths
{
	// Extensions
	inline public static var soundExt = ".ogg";
	inline public static var imageExt = ".png";
	inline public static var textExt = '.txt';

	static public function sound(key:String)
	{
		var sound = 'assets/sounds/$key' + soundExt;
		return sound;
	}

	static public function image(key:String)
	{
		var image = 'assets/images/$key' + imageExt;
		return image;
	}

	static public function txt(key:String)
	{
		var text = 'assets/txts/$key' + textExt;
		return text;
	}

	static public function music(key:String)
	{
		var music = 'assets/music/$key' + soundExt;
		return music;
	}

	inline static public function getSparrow(key:String):FlxAtlasFrames
	{
		return FlxAtlasFrames.fromSparrow(image(key), image(key + '.xml'));
	}

	inline static public function getData(key:String, ext:String)
	{
		var data = 'assets/data/$key.$ext';
		return data; // Gotta write the extension manually
	}
}
