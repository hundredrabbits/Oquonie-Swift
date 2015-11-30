
//  Created by Devine Lu Linvega on 2015-11-30.
//  Copyright © 2015 XXIIVV. All rights reserved

import SpriteKit
import AVFoundation
import Foundation

class Audio : SKNode
{
	var effects = SKNode()
	var ambient = AVAudioPlayer()
	
	override init()
	{
		super.init()
		
		self.addChild(effects)
	}
	
	func play(route:soundType,name:String)
	{
		print("> PLAY - \(route).\(name)")
		effects.runAction(SKAction.playSoundFileNamed("\(route).\(name).wav", waitForCompletion: false))
	}
	
	var current:Soundtrack!
	
	func play_ambient(soundName:Soundtrack)
	{
		if current == soundName { return }
		
		let coinSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ambient.\(soundName)", ofType: "mp3")!)
		do{
			ambient = try AVAudioPlayer(contentsOfURL:coinSound)
			ambient.prepareToPlay()
			ambient.play()
			print("playing")
		}catch {
			print("Error getting the audio file")
		}
		
		current = soundName
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}