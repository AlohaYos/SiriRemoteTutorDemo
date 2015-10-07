//
//  ViewController.swift
//  SiriRemoteTutor
//
//  Created by Yos Hashimoto on 2015/10/07.
//  Copyright © 2015 Newton Japan. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
	
	// MARK: Properties

	var remoteTutor : SiriRemoteTutor?
	var config : NSDictionary?
	var demoTimer : NSTimer?
	var demoIndex = 0
	
	// MARK: View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// init scene
		let demoScene = SKScene(size:view.bounds.size)
		demoScene.backgroundColor = UIColor.clearColor()
		let skFrame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
		let skView  = SKView(frame: skFrame)
		skView.presentScene(demoScene, transition: SKTransition.crossFadeWithDuration(0.5))
		view.addSubview(skView)
		
		// load config
		let path = NSBundle.mainBundle().pathForResource("configDemo", ofType: "json")!
		let data = NSData(contentsOfFile: path)!
		do {
			let json = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments) as! NSDictionary
			config = NSDictionary.init(dictionary: json)
		} catch {
			// json read error !
		}
		
		// Create Siri Remote Node
		let remoteDic = config?["siri_remote_tutor"] as! NSDictionary
		
	#if true	// center of the screen
		let x = CGRectGetMidX(view.frame)
		let y = CGRectGetMidY(view.frame)
			
	#else		// anywhere you want
		let x = remoteDic["x"] as! CGFloat
		let y = remoteDic["y"] as! CGFloat
	#endif

		let w = remoteDic["width"] as! CGFloat
		let h = remoteDic["height"] as! CGFloat
		remoteTutor = SiriRemoteTutor.init(rect: CGRectMake(x, y, w, h), scene: demoScene)
		
		startDemo()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: Demo

	func startDemo() {
		demoIndex = 0
		let demoSpeed = config?["demo_speed"] as! NSTimeInterval
		demoTimer = NSTimer.scheduledTimerWithTimeInterval(demoSpeed, target: self, selector: Selector("demoJob"), userInfo: nil, repeats: true)
	}
	
	func stopDemo() {
		remoteTutor?.hide()
		demoTimer?.invalidate()
		demoTimer=nil
	}
	
	func demoJob() {
		let actions = config?["demo_action"] as! NSArray
		let currentAction = actions[demoIndex] as! NSDictionary
		let action = currentAction["action"] as! NSString
		
		if(action == "nothing") {
			demoIndex++
			return
		}
		
		if(action == "siri_remote") {
			let siri_action = currentAction["command"] as! NSString
			
			if(siri_action == "show") {
				remoteTutor?.show()
			}
			if(siri_action == "hide") {
				remoteTutor?.hide()
			}
			if(siri_action == "swipe_right") {
				remoteTutor?.swipeRight()
			}
			if(siri_action == "swipe_left") {
				remoteTutor?.swipeLeft()
			}
			if(siri_action == "swipe_up") {
				remoteTutor?.swipeUp()
			}
			if(siri_action == "swipe_down") {
				remoteTutor?.swipeDown()
			}
			if(siri_action == "click") {
				remoteTutor?.click()
			}
		}
		
		if(action == "repeat") {
			demoIndex = 0-1;
		}
		
		demoIndex++
	}
}

