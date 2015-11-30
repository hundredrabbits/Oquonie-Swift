
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
	
	func play_ambient(sound:Soundtrack)
	{
		var soundName = "\(sound)"
		
		if current == sound { return }
		
		if "\(sound)" == "lobby" {
			if player.hasPillar(pillar_nemedique) { soundName = "lobby.2"}
			else if player.isCompleted == true { soundName = "lobby.3"}
			else { soundName = "lobby.1"}
		}
		
		let coinSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ambient.\(soundName)", ofType: "mp3")!)
		do{
			ambient = try AVAudioPlayer(contentsOfURL:coinSound)
			ambient.prepareToPlay()
			ambient.play()
			ambient.numberOfLoops = -1
		}catch {
			print("Error getting the audio file")
		}
		
		current = sound
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}