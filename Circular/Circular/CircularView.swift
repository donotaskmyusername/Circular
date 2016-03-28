//
//  CircularView.swift
//  Circular
//
//  Created by satel on 16/3/28.
//  Copyright © 2016年 WindFindTech. All rights reserved.
//

import UIKit

class CircularView: UIView {

    private let ringWidth:CGFloat = 30
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let centerX = CGRectGetMidX(bounds)
        let centerY = CGRectGetMidY(bounds)
        let backgroundCircle = UIBezierPath(arcCenter: CGPointMake(centerX, centerY), radius: (CGRectGetWidth(bounds) - ringWidth)/2, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        UIColor.blackColor().setStroke()
        backgroundCircle.lineWidth = ringWidth
        backgroundCircle.stroke()
    }

}
