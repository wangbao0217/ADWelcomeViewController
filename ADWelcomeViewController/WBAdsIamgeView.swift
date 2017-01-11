//
//  WBAdsIamgeView.swift
//  ADWelcomeViewController
//
//  Created by WangBao on 2016/12/1.
//  Copyright © 2016年 com.chinamworld. All rights reserved.
//

import UIKit

@objc protocol AdsDelegate: NSObjectProtocol {
   @objc optional func adsViewDidPalyFinish()
}

class WBAdsIamgeView: UIImageView {

    var countView:UILabel? //跳过Label
    var count:Int? = 3
    var timer:Timer?
    
    weak var delegate: AdsDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        countView = UILabel.init(frame: CGRect.init(x: WBScreenWidth-95, y: 15, width: 70, height: 25))
        countView?.font = UIFont.boldSystemFont(ofSize: 11)
        countView?.textColor = UIColor.white
        countView?.backgroundColor = UIColor.black
        countView?.textAlignment = NSTextAlignment.center
        countView?.alpha = 0.5
        countView?.text = "跳过广告 3"
        self.addSubview(countView!)

        //给countView添加点击事件
        self.isUserInteractionEnabled = true
        self.countView?.isUserInteractionEnabled = true
        let countViewTap = UITapGestureRecognizer.init(target:self, action: #selector(tapGest(tap:)))
        countView?.addGestureRecognizer(countViewTap)
        
        //定时器
        self.timer = Timer.init(timeInterval: 1.0, target: self, selector: #selector(countDown(timer:)), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapGest(tap: UITapGestureRecognizer) {
        
        if self.delegate != nil && (self.delegate?.responds(to: #selector(AdsDelegate.adsViewDidPalyFinish)))! {
            Prt.d(msg: "跳过了广告")
            self.delegate?.adsViewDidPalyFinish!()
        }
    }
    
    func countDown(timer: Timer) {
        self.count = self.count! - 1
        self.countView?.text = "跳过广告 \(count!)"
        if self.count == 0 {
             timer.invalidate()
            Prt.d(msg: "跳转")
            if self.delegate != nil && (self.delegate?.responds(to: #selector(AdsDelegate.adsViewDidPalyFinish)))! {
                self.delegate?.adsViewDidPalyFinish!()
            }
        }
    }
    
    override func removeFromSuperview() {
        timer?.invalidate()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
