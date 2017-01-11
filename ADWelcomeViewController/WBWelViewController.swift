//
//  WBWelViewController.swift
//  ADWelcomeViewController
//欢迎页
//背景图片同LaunchImage保持一致，使用户感觉启动页和自定义欢迎页是同一个页面
//
//  Created by WangBao on 2016/11/22.
//  Copyright © 2016年 com.chinamworld. All rights reserved.
//

import UIKit

class WBWelViewController: UIViewController, AdsDelegate {
    
    var adsView: WBAdsIamgeView?
    
    var reachAbility: Reachability = Reachability()! //判断网络连接对象
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        loadAds()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 初始化UI
    func initUI(){
        let imageName:String
        switch DeviceSzie.currentSize() {
        case .iphone4:
            imageName = "LaunchImage-700@2x"
            break
        case .iphone5:
            imageName = "LaunchImage-700-568h@2x"
            break
        case .iphone6:
            imageName = "LaunchImage-800-667h@2x"
            break
        case .iphone6p:
            imageName = "LaunchImage-800-Portrait-736h@3x"
            break
            
        }
        let backgoundImageView = UIImageView.init(image: UIImage.init(named: imageName))
        self.view.addSubview(backgoundImageView)
        
        adsView = WBAdsIamgeView.init(frame: CGRect.init(x: 0, y: 0, width: WBScreenWidth, height: WBScreenHeight/1.15))
        adsView?.delegate = self
        adsView?.image = UIImage.init(named: "ads01")
        self.view.addSubview(adsView!)
        
        
    }
    
    func loadAds() {
        if reachAbility.isReachableViaWiFi {
            Prt.d(msg: "是wifi环境,网络请求广告数据更新本地数据表")
        }else {
            Prt.d(msg: "读取本地数据表加载广告")
        }
    }
    
    
    //取消状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //adsImageview delegate
    func adsViewDidPalyFinish() {
        let vc = ViewController.init()
        //创建跳转动画
        let animation = CATransition.init()
        //设置运动轨迹的速度
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = "fade"
        animation.subtype = kCATransitionFromRight
        UIApplication.shared.keyWindow?.layer.add(animation, forKey: nil)
        
        self.present(vc, animated: false, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
