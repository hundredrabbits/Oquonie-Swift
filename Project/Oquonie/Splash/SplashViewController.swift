
//  Created by Devine Lu Linvega on 2015-11-22.
//  Copyright (c) 2015 Devine Lu Linvega. All rights reserved.

import UIKit
import SpriteKit

class SplashViewController: UIViewController
{
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
        if let scene = SplashGameScene(fileNamed:"splash"){
            let skView = self.view as! SKView
            scene.scaleMode = .AspectFill
			skView.presentScene(scene)
			scene.start()
        }
    }

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
