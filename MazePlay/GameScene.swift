//
//  GameScene.swift
//  MazePlay
//
//  Created by gdaalumno on 20/09/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var player: SKSpriteNode!
    var lastTouchPosition: CGPoint?
    
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        
        addChild(background)
        
        physicsWorld.gravity = .zero
        
    }
}

