
//  Created by Devine Lu Linvega on 2015-11-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import SpriteKit

class MainGameScene: SKScene
{
	var viewController: MainViewController!
	
	var time:NSTimer!

    override func didMoveToView(view: SKView)
	{
		
    }
	
	func start()
	{
		let scale:CGFloat = self.view!.frame.width/720
		print("\(self.view!.frame.width) -> \(self.frame.width) = \(self.frame.width/self.view!.frame.width) (\(scale))")
		
		templates.floor = CGSize(width: 200 * scale, height: 141 * scale)
		templates.step = CGSize(width: 200 * scale, height: 141 * scale)
		templates.wall = CGSize(width: 200 * scale, height: 281 * scale)
		templates.player = CGSize(width: 200 * scale, height: 281 * scale)
		templates.spell = CGSize(width: 120 * scale, height: 120 * scale)
		templates.dialog = CGSize(width: 640 * scale, height: 390 * scale)
		
		//
			
		time = NSTimer.scheduledTimerWithTimeInterval(0.025, target: self, selector: "_fixedUpdate", userInfo: nil, repeats: true)
		templates.screen = self.frame
		templates.stage = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - (0.5 * templates.wall.height))
		
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
		player.persona = .necomedre
		player.isFinishedPart1 = true
		stage.enter(35)
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
		stage.gameScene = self
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
		overlay = SKSpriteNode(color: UIColor.whiteColor(), size: self.size)
		overlay.position = CGPoint(x: CGRectGetMidX(self.frame),y: CGRectGetMidY(self.frame))
		overlay.zPosition = 1500
		overlay_image = SKSpriteNode(texture: nil, color: UIColor.blueColor(), size: CGSize(width: overlay.size.width, height: self.size.width))
		overlay_image.position = CGPoint(x: 0,y: 0)
		overlay_image.zPosition = 1600
		overlay.addChild(overlay_image)
		overlay.alpha = 0
		self.addChild(overlay)
	}
	
	func _addFx()
	{
		fx = SKSpriteNode(color: UIColor.redColor(), size: frame.size)
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
