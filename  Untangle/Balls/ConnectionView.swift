//
//  ConnectionView.swift
//  Balls
//
//  Created by Jacksons MacBook on 23.03.2021.
//

import UIKit

class ConnectionView: UIView {
    var dragChanged: (() -> Void)?
    var dragFinished: (() -> Void)?
    var touchStartPosition = CGPoint.zero
    weak var after: ConnectionView!

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        touchStartPosition = touch.location(in: self)
        
        touchStartPosition.x -= frame.width / 2
        touchStartPosition.y -= frame.height / 2
        
        transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        superview?.bringSubviewToFront(self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let point = touch.location(in: superview)
        
        center = CGPoint(x: point.x - touchStartPosition.x, y: point.y - touchStartPosition.y)
        dragChanged?()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        transform = .identity
        dragFinished?()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
    
}
