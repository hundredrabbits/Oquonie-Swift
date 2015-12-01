
//  Created by Devine Lu Linvega on 2015-11-30.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification)
	{
        if let scene = SplashGameScene(fileNamed:"Splash") {
            scene.scaleMode = .AspectFill
            self.skView!.presentScene(scene)
			scene.start()
        }
    }

    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool
	{
        return true
    }
}
