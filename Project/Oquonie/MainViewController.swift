
//  Created by Devine Lu Linvega on 2015-11-22.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import SpriteKit

class MainViewController: UIViewController
{
	override func viewDidLoad()
	{
		super.viewDidLoad()
		splash_load()
	}
	
	// MARK: Flow -
	
	func splash_load()
	{
		if let scene = SplashGameScene(fileNamed:"Splash"){
			let skView = self.view as! SKView
			scene.viewController = self
			scene.scaleMode = .aspectFill
			skView.presentScene(scene)
			scene.start()
		}
	}
	
	func splash_exit()
	{
		game_load()
	}
	
	func game_load()
	{
		if let scene = MainGameScene(fileNamed:"Game"){
			let skView = self.view as! SKView
			scene.viewController = self
			scene.size = self.view.frame.size
			scene.scaleMode = .aspectFit
			skView.presentScene(scene)
			scene.start()
            self.installGestures()
		}
	}
	
	func game_exit()
	{
		
	}

    func installGestures() {}
}
