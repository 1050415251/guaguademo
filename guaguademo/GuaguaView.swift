//
//  GuaguaView.swift
//  guaguademo
//
//  Created by 国投 on 2018/4/26.
//  Copyright © 2018年 FlyKite. All rights reserved.
//

import Foundation
import UIKit

class GuaguaView:UIView {

    var lab:UILabel!


    var shaplayer:CAShapeLayer!

    lazy var bezierPath:UIBezierPath = {
        let path = UIBezierPath()

        return path
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initView() {

        let layer = CALayer()
        layer.frame = self.bounds
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.contents = #imageLiteral(resourceName: "jxbank").cgImage
        self.layer.addSublayer(layer)

        lab = UILabel(frame: self.bounds)
        lab.font = UIFont.systemFont(ofSize: 14)
        lab.textAlignment = .center
        lab.text = "刮刮卡效果"
        lab.backgroundColor = UIColor.blue
        self.addSubview(lab)


//        imgLab = UIImageView(frame: self.bounds)
//        imgLab.image = #imageLiteral(resourceName: "jxbank")
//        self.addSubview(imgLab)
//
        shaplayer = CAShapeLayer()
        shaplayer.lineCap = kCALineCapRound
        shaplayer.lineJoin = kCALineJoinRound
        shaplayer.lineWidth = 20
        shaplayer.fillColor = nil
        shaplayer.strokeColor = UIColor.lightGray.cgColor
        lab.layer.mask = shaplayer
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touches = touches.first
        if let centerPoint = touches?.location(in: self) {
            bezierPath.move(to: centerPoint)
        }

    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touches = touches.first
        if let centerPoint = touches?.location(in: self) {
            //TODO: 这种方法存在的瑕疵是 可能有时候加载不到滑动的轨迹 就相当于是 擦除手势划过的轨迹 并重新生成新的img
//            let rect = CGRect.init(x: centerPoint.x, y: centerPoint.y, width: 10, height: 10)
//            UIGraphicsBeginImageContextWithOptions(imgLab.bounds.size, false, 0)
//            if let context = UIGraphicsGetCurrentContext() {
//                imgLab.layer.render(in: context)
//                context.clear(rect)
//                let img = UIGraphicsGetImageFromCurrentImageContext()
//                self.imgLab.image = img
//            }
//            UIGraphicsEndImageContext()

            bezierPath.addLine(to: centerPoint)
            shaplayer.path = bezierPath.cgPath

        }
    }

}
















