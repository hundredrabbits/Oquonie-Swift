
//  Created by Devine Lu Linvega on 2015-11-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import SpriteKit

class GameScene: SKScene
{
	var time:NSTimer!

    override func didMoveToView(view: SKView)
	{
		time = NSTimer.scheduledTimerWithTimeInterval(0.025, target: self, selector: "_fixedUpdate", userInfo: nil, repeats: true)
		templates.stage = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - (0.5 * templates.wall.height))
		start()
    }
	
	func start()
	{
		_addStage()
		_addPlayer()
		_addSpellbook()
		_addDialog()
		_addParalax()
		_addOverlay()
		_addFx()
		
		// debug
		ramen_necomedre.isKnown = true
		ramen_nephtaline.isKnown = true
		ramen_neomine.isKnown = true
		ramen_nemedique.isKnown = true
		ramen_nestorine.isKnown = true
		player.collectibles.append(pillar_necomedre)
		player.collectibles.append(pillar_nephtaline)
		player.collectibles.append(pillar_neomine)
		player.collectibles.append(pillar_nestorine)
		player.collectibles.append(pillar_nemedique)
		player.persona = .catfishbird
		player.isFinishedPart1 = true
		stage.enter(68)
	}
	
	func _addPlayer()
	{
		player.persona = .necomedre
		player.position = CGPoint(x: 0, y: 0)
		player.zPosition = stage.eventDepthAtPosition(0, y: 0)
		stage.events_root.addChild(player)
		
		player.appear()
	}
	
	func _addStage()
	{
		stage.position = templates.stage
		addChild(stage)
	}
	
	func _addSpellbook()
	{
		spellbook.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.height - templates.spell.height)
		spellbook.zPosition = 1000
		addChild(spellbook)
	}
	
	func _addDialog()
	{
		dialog.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
		dialog.zPosition = 9000
		self.addChild(dialog)
	}
	
	func _addParalax()
	{
		parallaxBack = SKSpriteNode(texture: textureWithName("parallax.1.png"), color: UIColor.redColor(), size: CGSize(width: templates.stage.x, height: templates.stage.x))
		parallaxBack.position = CGPoint(x: CGRectGetMidX(self.frame),y: CGRectGetMidY(self.frame))
		parallaxBack.zPosition = -900
		self.addChild(parallaxBack)
		
		parallaxFront = SKSpriteNode(texture: textureWithName("parallax.2.png"), color: UIColor.redColor(), size: CGSize(width: templates.stage.x, height: templates.stage.x))
		parallaxFront.position = CGPoint(x: CGRectGetMidX(self.frame),y: CGRectGetMidY(self.frame))
		parallaxFront.zPosition = 9000
		self.addChild(parallaxFront)
	}
	
	func _addOverlay()
	{
		overlay = SKSpriteNode(color: UIColor.whiteColor(), size: CGSize(width: gameScene.size.width, height: gameScene.size.width))
		overlay.position = CGPoint(x: CGRectGetMidX(self.frame),y: CGRectGetMidY(self.frame))
		overlay.zPosition = 1500
		overlay_image = SKSpriteNode(texture: nil, color: UIColor.blueColor(), size: CGSize(width: overlay.size.width/2, height: gameScene.size.width/2))
		overlay_image.position = CGPoint(x: 0,y: 0)
		overlay_image.zPosition = 1600
		overlay.addChild(overlay_image)
		overlay.alpha = 0
		self.addChild(overlay)
	}
	
	func _addFx()
	{
		fx = SKSpriteNode(color: UIColor.redColor(), size: self.frame.size)
		fx.position = CGPoint(x: CGRectGetMidX(self.frame),y: CGRectGetMidY(self.frame))
		fx.zPosition = 1200
		fx.alpha = 0
		self.addChild(fx)
	}

    override func update(currentTime: CFTimeInterval)
	{
		super.update(currentTime)
		stage._fixedUpdate()
	}
	
	override func _fixedUpdate()
	{
		
	}
}
