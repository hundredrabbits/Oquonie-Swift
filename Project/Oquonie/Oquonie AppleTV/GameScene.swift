
//  Created by Devine Lu Linvega on 2015-11-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import SpriteKit

class GameScene: SKScene
{
	var time:NSTimer!

    override func didMoveToView(view: SKView)
	{
		start()
		time = NSTimer.scheduledTimerWithTimeInterval(0.025, target: self, selector: "_fixedUpdate", userInfo: nil, repeats: true)
		templates.stage = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - (0.5 * templates.wall.height))
		stage.position = templates.stage
    }
	
	func start()
	{
		_addStage()
		_addPlayer()
		_addSpellbook()
		_addDialog()
		
		// debug
		spellbook.addSpell(Wizard(x:0,y:0,spell:Personas.nephtaline))
		spellbook.addSpell(Wizard(x:0,y:0,spell:Personas.nephtaline))
		player.persona = Personas.nephtaline
		stage.enter(world.all[39])
	}
	
	func _addPlayer()
	{
		player.position = CGPoint(x: 0, y: 0)
		player.zPosition = 90
		stage.events_root.addChild(player)
	}
	
	func _addStage()
	{
		stage.position = templates.stage
		addChild(stage)
	}
	
	func _addSpellbook()
	{
		spellbook.position = CGPoint(x: 0, y: (CGRectGetMidY(self.frame) * 2) - (templates.spell.height + 20) )
		spellbook.zPosition = 900
		self.addChild(spellbook)
	}
	
	func _addDialog()
	{
		dialog.position = CGPoint(x: 0, y: (CGRectGetMidY(self.frame) * 2) - (templates.spell.height + 20) )
		dialog.zPosition = 9000
		self.addChild(dialog)
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
