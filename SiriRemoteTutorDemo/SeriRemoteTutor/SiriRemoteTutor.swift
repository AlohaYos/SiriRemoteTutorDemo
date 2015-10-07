//
//  SiriRemoteTutor.swift
//  SiriRemoteTutor
//
//  Created by Yos Hashimoto on 2015/10/07.
//  Copyright © 2015 Newton Japan. All rights reserved.
//

import UIKit
import SpriteKit

class SiriRemoteTutor {

	// MARK: Properties

	var onScene    : SKScene
	var remoteNode : SKSpriteNode
	var swipeNode  : SKSpriteNode
	var clickNode  : SKSpriteNode
	
	// MARK: Initializer

	init(rect : CGRect, scene : SKScene) {
		// rect  : Size of Siri Remote Tutor
		// scene : Put Siri Remote Tutor on this SKScene

		onScene = scene
		
		let atlas = SKTextureAtlas(named: "SiriRemote")
		//let remoteTexture = atlas.textureNamed("siriRemoteWithTouchSurface")
		let remoteTexture = atlas.textureNamed("siriRemote")
		let swipeTexture  = atlas.textureNamed("swipe_arrow_right")
		let clickTexture  = atlas.textureNamed("click")
		
		// Siri Remote Tutor body
		remoteNode = SKSpriteNode(texture: remoteTexture)
		remoteNode.name = "SiriRemoteTutor"
		remoteNode.position = CGPointMake(rect.origin.x, rect.origin.y)
		remoteNode.size = CGSizeMake(rect.size.width, rect.size.height)
		swipeNode = SKSpriteNode(texture: swipeTexture)
		onScene.addChild(remoteNode)
		// Swipe icon
		swipeNode.name = "SiriRemoteTutor"
		swipeNode.position = CGPointMake(rect.origin.x, rect.origin.y+rect.height/4)
		swipeNode.alpha = 0.0
		onScene.addChild(swipeNode)
		// Click icon
		clickNode = SKSpriteNode(texture: clickTexture)
		clickNode.name = "SiriRemoteTutor"
		clickNode.position = CGPointMake(rect.origin.x, rect.origin.y+rect.height/4)
		clickNode.alpha = 0.0
		onScene.addChild(clickNode)
	}
	
	deinit {
		// Clean up SKNodes
		
		let nodes: NSMutableArray = []
		onScene.enumerateChildNodesWithName("SiriRemoteTutor", usingBlock: {
			node, sotp in
			nodes.addObject(node)
		})

		for node in nodes {
			node.removeFromParent()
		}
	}

	// MARK: Tutor animations

	func show() {
		// fade in to scene
		let fadeIn   = SKAction.fadeInWithDuration(0.5)
		let sequence = SKAction.sequence([fadeIn])
		remoteNode.runAction(sequence)
	}
	
	func hide() {
		// fade out from scene
		let fadeOut  = SKAction.fadeOutWithDuration(0.5)
		let sequence = SKAction.sequence([fadeOut])
		remoteNode.runAction(sequence)
	}
	
	func click() {
		// click on touch surface
		let shrink  = SKAction.resizeToWidth(50.0, height: 50.0, duration: 0.1)
		let fadeIn  = SKAction.fadeInWithDuration(0.1)
		let expand  = SKAction.resizeToWidth(75.0, height: 75.0, duration: 0.3)
		let fadeOut = SKAction.fadeOutWithDuration(0.1)
		let sequence = SKAction.sequence([shrink, fadeIn, expand, fadeOut])
		clickNode.runAction(sequence)
	}
	
	func swipeRight() {
		// swipe to right on touch surface
		let radian = CGFloat(0.0)
		let deltaX = CGFloat(1.0)
		let deltaY = CGFloat(0.0)
		swipeJob(radian, deltaX: deltaX, deltaY: deltaY)
	}
	
	func swipeLeft() {
		// swipe to left on touch surface
		let radian = CGFloat(M_PI_2)*2.0
		let deltaX = CGFloat(-1.0)
		let deltaY = CGFloat(0.0)
		swipeJob(radian, deltaX: deltaX, deltaY: deltaY)
	}
	
	func swipeUp() {
		// swipe up on touch surface
		let radian = CGFloat(M_PI_2)
		let deltaX = CGFloat(0.0)
		let deltaY = CGFloat(1.0)
		swipeJob(radian, deltaX: deltaX, deltaY: deltaY)
	}
	
	func swipeDown() {
		// swipe down on touch surface
		let radian = CGFloat(-M_PI_2)
		let deltaX = CGFloat(0.0)
		let deltaY = CGFloat(-1.0)
		swipeJob(radian, deltaX: deltaX, deltaY: deltaY)
	}
	
	func swipeJob(radian:CGFloat, deltaX:CGFloat, deltaY:CGFloat) {
		// swipe job common function
		let swipeValue = swipeNode.size.height/2.0
		let dx = swipeValue*deltaX
		let dy = swipeValue*deltaY
		
		let rotate  = SKAction.rotateToAngle(radian, duration: 0.1)
		let fadeIn  = SKAction.fadeInWithDuration(0.1)
		let move    = SKAction.moveByX(dx, y: dy, duration: 0.3)
		let fadeOut = SKAction.fadeOutWithDuration(0.1)
		let back    = SKAction.moveByX(-dx, y: -dy, duration: 0.1)
		let sequence = SKAction.sequence([rotate, fadeIn, move, fadeOut, back])
		swipeNode.runAction(sequence)
	}
}
