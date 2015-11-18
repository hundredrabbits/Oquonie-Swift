
//  Created by Devine Lu Linvega on 2015-11-09.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class Dialog : SKNode
{
	var isActive:Bool = false
	let background = SKShapeNode(rectOfSize: CGSize(width: gameScene.frame.width, height: gameScene.frame.height))
	var bubble:SKSpriteNode!
	var portrait:SKSpriteNode!
	var letter1:SKSpriteNode!
	var letter2:SKSpriteNode!
	var letter3:SKSpriteNode!
	
	override init()
	{
		super.init()
		
		bubble = SKSpriteNode(texture: textureWithName("fx.dialog.bubble"), color: UIColor.redColor(), size: templates.dialog)
		bubble.position = CGPoint(x: 0, y: -gameScene.frame.height/2 + templates.dialog.height/2 + templates.spell.height/2 )
		bubble.alpha = 0
		addChild(bubble)
		
		portrait = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: templates.dialog)
		portrait.position = CGPoint(x: 0, y: -gameScene.frame.height/2 + templates.dialog.height/2 + templates.spell.height/2 )
		portrait.alpha = 0
		addChild(portrait)
		
		background.fillColor = UIColor(white: 0, alpha: 0.4)
		background.alpha = 0
		addChild(background)
		
		letter1 = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: templates.spell)
		letter1.position = CGPoint(x: -templates.spell.width * 1.825, y: -templates.spell.height * 0.65)
		bubble.addChild(letter1)
		
		letter2 = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: templates.spell)
		letter2.position = CGPoint(x: -templates.spell.width * 0.975, y: -templates.spell.height * 0.65)
		bubble.addChild(letter2)
		
		letter3 = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: templates.spell)
		letter3.position = CGPoint(x: -templates.spell.width * 0.125, y: -templates.spell.height * 0.65)
		bubble.addChild(letter3)
		
		portrait.zPosition = 9000
		bubble.zPosition = 9000
	}
	
	func showModal(letters:Array<String>, eventName:String)
	{
		print("show: \(letters) -> \(eventName)")
		
		letter1.texture = textureWithName("letter.\(letters[0]).png")
		letter2.texture = textureWithName("letter.\(letters[1]).png")
		letter3.texture = textureWithName("letter.\(letters[2]).png")
		portrait.texture = textureWithName("event.\(eventName).portrait.png")
		
		let action_fade = SKAction.fadeAlphaTo(1, duration: 0.25)
		
		portrait.runAction(action_fade)
		background.runAction(action_fade)
		bubble.runAction(action_fade)
		isActive = true
	}
	
	func hideModal()
	{
		let action_fade = SKAction.fadeAlphaTo(0, duration: 0.25)
		
		portrait.runAction(action_fade)
		background.runAction(action_fade)
		bubble.runAction(action_fade)
		isActive = false
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}