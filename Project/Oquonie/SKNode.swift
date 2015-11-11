//
//  SKNode.swift
//  Oquonie
//
//  Created by Devine Lu Linvega on 2015-11-11.
//  Copyright © 2015 XXIIVV. All rights reserved.
//

import SpriteKit
import Foundation

extension SKNode
{
	func update()
	{
	
	}
	
	func _update()
	{
		for node in children {
			node._update()
		}
		update()
	}
}