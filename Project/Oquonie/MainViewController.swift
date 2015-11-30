
//  Created by Devine Lu Linvega on 2015-11-22.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import SpriteKit

class MainViewController: UIViewController
{
	override func viewDidLoad()
	{
		super.viewDidLoad()
		game_load()
	}
	
	// MARK: Flow -
	
	func splash_load()
	{
		if let scene = SplashGameScene(fileNamed:"Splash"){
			let skView = self.view as! SKView
			scene.viewController = self
			scene.scaleMode = .AspectFill
			skView.presentScene(scene)
			scene.start()
		}
	}
	
	func splash_exited()
	{
		game_load()
	}
	
	func game_load()
	{
		if let scene = MainGameScene(fileNamed:"Game"){
			let skView = self.view as! SKView
			scene.viewController = self
			scene.size = self.view.frame.size
			scene.scaleMode = .AspectFit
			skView.presentScene(scene)
			scene.start()
		}
	}
	
	func game_exit()
	{
		
	}
	
	// MARK: Defaults -
	
	override func shouldAutorotate() -> Bool
	{
		return true
	}
	
	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
	{
		if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
			return .AllButUpsideDown
		} else {
			return .All
		}
	}
	
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
	}
	
	override func prefersStatusBarHidden() -> Bool
	{
		return true
	}
}
