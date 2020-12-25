//
//  GKDemo000ViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/5.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKDemo000ViewController: GKBaseViewController {

    @IBOutlet weak var interactivePopLabel: UILabel!
    @IBOutlet weak var interactivePopSwitch: UISwitch!
    
    @IBOutlet weak var fullScreenPopLabel: UILabel!
    @IBOutlet weak var fullScreenPopSwitch: UISwitch!
    
    @IBOutlet weak var statusBarStyleLabel: UILabel!
    @IBOutlet weak var statusBarStyleSwitch: UISwitch!
    
    @IBOutlet weak var statusBarHiddenLabel: UILabel!
    @IBOutlet weak var statusBarHiddenSwitch: UISwitch!
    
    @IBOutlet weak var navBarBackgroundLabel: UILabel!
    @IBOutlet weak var navBarBackgroundSwitch: UISwitch!
    
    @IBOutlet weak var navBarLineHiddenLabel: UILabel!
    @IBOutlet weak var navBarLineHiddenSwitch: UISwitch!
    
    @IBOutlet weak var backStyleLabel: UILabel!
    @IBOutlet weak var backStyleSwitch: UISwitch!
    
    @IBOutlet weak var leftPushLabel: UILabel!
    @IBOutlet weak var leftPushSwitch: UISwitch!
    
    @IBOutlet weak var moreItemLabel: UILabel!
    @IBOutlet weak var moreItemSwitch: UISwitch!
    
    @IBOutlet weak var fullScreenInterceptLabel: UILabel!
    @IBOutlet weak var fullScreenInterceptSwitch: UISwitch!
    
    @IBOutlet weak var fullScreenDistanceLabel: UILabel!
    @IBOutlet weak var fullScreenDistanceSlider: UISlider!
    
    @IBOutlet weak var navBarAlphaLabel: UILabel!
    @IBOutlet weak var navBarAlphaSlider: UISlider!
    
    var disableBack = false
    
    lazy var moreItem: UIBarButtonItem = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.setTitle("更多", for: .normal)
//        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        
        return UIBarButtonItem(customView: btn)
    }()
    
    lazy var shareItem: UIBarButtonItem = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.setTitle("分享", for: .normal)
        btn.backgroundColor = .red
        btn.setTitleColor(.white, for: .normal)
        
        return UIBarButtonItem(customView: btn)
    }()
    
    // 最好在初始化方法中设置gk_statusBarStyle，否则可能导致状态栏切换闪动问题
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.gk_statusBarStyle = .lightContent
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置默认样式
        self.gk_navTitle = "Demo"
        self.gk_navTitleColor = .white
        self.gk_navBackgroundColor = .red
        self.gk_navShadowColor = .black
        self.gk_backStyle = .white
        self.gk_navLineHidden = true
//        self.gk_navItemRightSpace = 0;
        self.gk_navRightBarButtonItem = self.moreItem
        
        self.leftPushSwitch.isOn = false
        self.moreItemSwitch.isOn = false
        self.fullScreenInterceptSwitch.isOn = false
        self.fullScreenDistanceSlider.minimumValue = 0
        self.fullScreenDistanceSlider.maximumValue = Float(self.view.frame.size.width)
        if self.gk_maxPopDistance == 0 {
            self.fullScreenDistanceSlider.value = Float(self.view.frame.size.width)
        }
        
        self.fullScreenDistanceLabel.text = "全屏返回手势距离：\(self.gk_maxPopDistance)"
        
        self.navBarAlphaSlider.value = Float(self.gk_navBarAlpha)
        self.navBarAlphaLabel.text = "导航栏透明度：\(self.gk_navBarAlpha)"
        
        self.gk_systemGestureHandleDisabled = true
        self.gk_popDelegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        
        self.gk_pushDelegate = nil;
    }
    
    deinit {
        print("GKDemo000ViewController deinit")
    }
    
    @IBAction func interactiveAction(_ sender: Any) {
        self.gk_interactivePopDisabled = !self.interactivePopSwitch.isOn
        
        self.interactivePopLabel.text = "侧滑返回手势：" + (self.interactivePopSwitch.isOn ? "开" : "关")
    }
    
    @IBAction func fullScreenAction(_ sender: Any) {
        self.gk_fullScreenPopDisabled = !self.fullScreenPopSwitch.isOn
        
        self.fullScreenPopLabel.text = "全屏返回手势：" + (self.fullScreenPopSwitch.isOn ? "开" : "关")
    }
    
    @IBAction func statusBarStyleAction(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if self.statusBarStyleSwitch.isOn {
                self.gk_statusBarStyle = .lightContent
            }else {
                if #available(iOS 13.0, *) {
                    self.gk_statusBarStyle = .darkContent
                } else {
                    self.gk_statusBarStyle = .default
                }
            }
            self.statusBarStyleLabel.text = "状态栏样式：" + (self.statusBarStyleSwitch.isOn ? "LightContent" : "Default")
        }
    }
    
    @IBAction func statusBarHiddenAction(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.gk_statusBarHidden = !self.statusBarHiddenSwitch.isOn
            
            self.statusBarHiddenLabel.text = "状态栏显隐：" + (self.statusBarHiddenSwitch.isOn ? "显示" : "隐藏")
        }
    }
    
    @IBAction func navbarBackgroundAction(_ sender: Any) {
        if self.navBarBackgroundSwitch.isOn {
            self.gk_navBackgroundColor = .red
        }else {
            self.gk_navBackgroundColor = .blue
        }
        
        self.navBarBackgroundLabel.text = "导航栏背景色：" + (self.navBarBackgroundSwitch.isOn ? "红色" : "蓝色")
    }
    
    @IBAction func navbarLineHiddenAction(_ sender: Any) {
        self.gk_navLineHidden = !self.navBarLineHiddenSwitch.isOn
        
        self.navBarLineHiddenLabel.text = "导航栏分割线：" + (self.navBarLineHiddenSwitch.isOn ? "显示" : "隐藏")
    }
    
    @IBAction func backStyleAction(_ sender: Any) {
        if self.backStyleSwitch.isOn {
            self.gk_backStyle = .white
        }else {
            self.gk_backStyle = .black
        }
        self.backStyleLabel.text = "返回按钮样式：" + (self.backStyleSwitch.isOn ? "白色" : "黑色")
    }
    
    @IBAction func leftPushAction(_ sender: Any) {
        if self.leftPushSwitch.isOn {
            self.gk_pushDelegate = self
        }else {
            self.gk_pushDelegate = nil
        }
        self.leftPushLabel.text = "左滑push功能：" + (self.leftPushSwitch.isOn ? "开" : "关")
    }
    
    @IBAction func moreItemAction(_ sender: Any) {
        if self.moreItemSwitch.isOn {
            self.gk_navRightBarButtonItems = [self.shareItem, self.moreItem]
        }else {
            self.gk_navRightBarButtonItems = nil
            self.gk_navRightBarButtonItem = self.moreItem
        }
        self.moreItemLabel.text = "多个导航按钮：" + (self.moreItemSwitch.isOn ? "开" : "关")
    }
    
    @IBAction func fullScreenInterceptAction(_ sender: Any) {
        if self.fullScreenInterceptSwitch.isOn {
            self.disableBack = true
        }else {
            self.disableBack = false
        }
        self.fullScreenInterceptLabel.text = "返回拦截：" + (self.fullScreenInterceptSwitch.isOn ? "开" : "关")
    }
    
    
    @IBAction func maxDistanceAction(_ sender: Any) {
        self.gk_maxPopDistance = CGFloat(self.fullScreenDistanceSlider.value)
        
        self.fullScreenDistanceLabel.text = "全屏返回手势距离：\(self.gk_maxPopDistance)"
    }
    
    @IBAction func navAlphaAction(_ sender: Any) {
        self.gk_navBarAlpha = CGFloat(self.navBarAlphaSlider.value)
        
        self.navBarAlphaLabel.text = "导航栏透明度：\(self.gk_navBarAlpha)"
    }
}

extension GKDemo000ViewController {
    override func navigationShouldPopOnGesture() -> Bool {
        if self.disableBack {
            self.showBackAlert()
        }
        return !self.disableBack
    }
    
    override func backItemClick(_ sender: Any) {
        if self.disableBack {
            self.showBackAlert()
            return
        }
        super.backItemClick(sender)
    }
    
    func showBackAlert() {
        let alertVC = UIAlertController(title: "温馨提示", message: "确定要返回吗？", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alertVC.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action) in
            self.disableBack = false
            self.navigationController?.popViewController(animated: true)
        }))
        present(alertVC, animated: true, completion: nil)
    }
}

extension GKDemo000ViewController: GKViewControllerPushDelegate {
    func pushToNextViewController() {
        let webVC = GKDemoWebViewController()
        self.navigationController?.pushViewController(webVC, animated: true)
    }
}

extension GKDemo000ViewController: GKViewControllerPopDelegate {
    func viewControllerPopScrollBegan() {
        print("滑动开始")
    }
    
    func viewControllerPopScrollUpdate(progress: CGFloat) {
        print("滑动进度更新:\(progress)")
    }
    
    func viewControllerPopScrollEnded(finished: Bool) {
        print("滑动结束：" + (finished ? "完成" : "取消"))
    }
}
