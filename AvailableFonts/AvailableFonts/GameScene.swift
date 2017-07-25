//
//  GameScene.swift
//  AvailableFonts
//
//  Created by lxj on 2017/7/24.
//  Copyright © 2017年 lxj. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var familyIndex: Int = -1
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        showNextFamily()
    }
    
    func showCurrentFamily() -> Bool {
        
        removeAllChildren()
        
        let familyName = UIFont.familyNames[familyIndex]
        
        let fontNames = UIFont.fontNames(forFamilyName: familyName)
        
        if fontNames.count == 0 {
            return false
        }
        
        print("Family: \(familyName)")
        
        for (idx, fontName) in fontNames.enumerated() {
            let label = SKLabelNode(fontNamed: fontName)
            label.text = fontName
            label.position = CGPoint(x: size.width / 2, y: (size.height * (CGFloat(idx + 1))) / (CGFloat(fontNames.count) + 1))
            label.fontSize = 50
            label.verticalAlignmentMode = .center
            addChild(label)
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showNextFamily()
    }
    
    func showNextFamily() {
        
        var familyShown = false
        repeat {
            familyIndex += 1
            if familyIndex >= UIFont.familyNames.count {
                familyIndex = 0
            }
            familyShown = showCurrentFamily()
        } while !familyShown
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
