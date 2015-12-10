
//  Created by Devine Lu Linvega on 2015-11-29.
//  Copyright © 2015 XXIIVV. All rights reserved.

import SpriteKit
import Foundation

class TVViewController : MainViewController
{
    override func installGestures()
	{
        let panGesture = UIPanGestureRecognizer(target: self, action: "respondToPanGesture:")
        self.view.addGestureRecognizer(panGesture)
	}

    func respondToPanGesture(gesture: UIGestureRecognizer)
    {
        if player == nil { return }

        // Only use the gesture if it's over.
        if gesture.state != UIGestureRecognizerState.Ended
        {
            return
        }

        if let gesture = gesture as? UIPanGestureRecognizer
        {
            // Normalize the points to the remote size.
            var point = gesture.translationInView(view)
            point.x = point.x / view.bounds.width
            point.y = point.y / view.bounds.height

            // Cancel on smalll accidental pans.
            if distanceBetweenTwoPoints(CGPoint.zero, b: point) < 0.05
            {
                return
            }

            // Offset the angle so 'right' starts at 15 degrees from straight up and goes clockwise. And is always between 0 and 360
            let angle = fmod((Double(atan2(point.y, point.x)) * 180.0 / M_PI) + 720.0 + 75.0, 360.0)

            if overlay.alpha > 0 {
                player.hideOverlay()
            }

            if dialog.isActive == true {
                dialog.hideModal()
                return
            }

            // Go around the touch area clockwise.
            if angle < 90
            {
                player.move(1, y: 0)
            }
            else if angle < 180
            {
                player.move(0, y: -1)
            }
            else if angle < 270
            {
                player.move(-1, y: 0)
            }
            else
            {
                player.move(0, y: 1)
            }
        }
    }

	override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?)
	{
		if player == nil { return }
		
		if overlay.alpha > 0 {
			player.hideOverlay()
		}
		
		if dialog.isActive == true {
			dialog.hideModal()
			return
		}
		
		super.pressesEnded(presses, withEvent: event)
		for press in presses
		{
			switch press.type {
			case UIPressType.LeftArrow:
				player.move(-1, y: 0)
			case UIPressType.RightArrow:
				player.move(1, y: 0)
			case UIPressType.UpArrow:
				player.move(0, y: 1)
			case UIPressType.DownArrow:
				player.move(0, y: -1)
			default:
				break
			}
		}
	}
}