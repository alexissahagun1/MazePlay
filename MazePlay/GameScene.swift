//
//  GameScene.swift
//  MazePlay
//
//  Created by gdaalumno on 20/09/21.
//

import SpriteKit
import GameplayKit

enum CollisionTypes: UInt32 {
    case player = 1
    case wall = 2
    case star = 4
    case hole = 8
    case finish = 16
    
}


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
    
    func loadLevel() {
        guard let levelURL = Bundle.main.url(forResource: "maze1", withExtension: "txt") else { fatalError("Can't find maze1.txt in app bundle")}
        
        guard let levelString = try? String(contentsOf: levelURL) else { fatalError("Can't find maze1.txt in app bundle")}
        
        let lines = levelString.components(separatedBy: "\n")
        
        for(row,line) in lines.reversed().enumerated() {
            for(column, letter) in line.enumerated() {
                let position = CGPoint(x: (64 * column) + 32, y: (64 * row) + 32)
                
                if(letter == "w") {
                    let node = SKSpriteNode(imageNamed: "block")
                    node.position = position
                    node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
                    node.physicsBody?.categoryBitMask = CollisionTypes.wall.rawValue
                    node.physicsBody?.isDynamic = false
                    
                    addChild(node)
                } else if letter == "h" {
                    
                }
                else if letter == "s" {
                
                }
                else if letter == "f" {
                
                }
                else if letter == " " {
                
                }
            }
        }
    }
}

