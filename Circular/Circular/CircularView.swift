//
//  CircularView.swift
//  Circular
//
//  Created by satel on 16/3/28.
//  Copyright © 2016年 WindFindTech. All rights reserved.
//

import UIKit

class CircularView: UIView {

    private let ringWidth:CGFloat = 40
    private let radiusOffset: CGFloat = CGFloat(M_PI * 1.5)
    
    private var buttonOne:UIButton
    private var buttonTwo:UIButton
    private var buttonThr:UIButton
    private var buttonFor:UIButton
    
    override init(frame: CGRect) {
        buttonOne = UIButton(type: UIButtonType.System)
        buttonTwo = UIButton(type: UIButtonType.System)
        buttonThr = UIButton(type: UIButtonType.System)
        buttonFor = UIButton(type: UIButtonType.System)
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        buttonOne = UIButton(type: UIButtonType.System)
        buttonTwo = UIButton(type: UIButtonType.System)
        buttonThr = UIButton(type: UIButtonType.System)
        buttonFor = UIButton(type: UIButtonType.System)
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        buttonOne.setTitle("One", forState: .Normal)
        buttonTwo.setTitle("Two", forState: UIControlState.Normal)
        buttonThr.setTitle("Thr", forState: .Normal)
        buttonFor.setTitle("For", forState: .Normal)
        addSubview(buttonOne)
        addSubview(buttonTwo)
        addSubview(buttonThr)
        addSubview(buttonFor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttons = [buttonOne, buttonTwo, buttonThr, buttonFor]
        let R = CGRectGetWidth(bounds)/2

        for (index, button) in buttons.enumerate() {
            button.bounds = CGRectMake(0, 0, 40, 30)
            let angle = M_PI_4 * Double(2*index + 1) / Double(buttons.count)
            let centerX = sin(angle) * Double(R - ringWidth/2) + Double(R)
            let centerY = Double(R) - cos(angle) * Double(R - ringWidth/2)
            button.center = CGPointMake(CGFloat(centerX), CGFloat(centerY))
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let centerX = CGRectGetMidX(bounds)
        let centerY = CGRectGetMidY(bounds)
        let backgroundCircle = UIBezierPath(arcCenter: CGPointMake(centerX, centerY), radius: (CGRectGetWidth(bounds) - ringWidth)/2, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        UIColor.blackColor().setStroke()
        backgroundCircle.lineWidth = ringWidth
        backgroundCircle.stroke()
        
        let selectedCircle = UIBezierPath(arcCenter: CGPointMake(centerX, centerY), radius: (CGRectGetWidth(bounds) - ringWidth)/2, startAngle: radiusOffset, endAngle: CGFloat(M_PI_2/4) + radiusOffset, clockwise: true)
        UIColor.blueColor().setStroke()
        selectedCircle.lineWidth = ringWidth
        selectedCircle.stroke()
    }

}
