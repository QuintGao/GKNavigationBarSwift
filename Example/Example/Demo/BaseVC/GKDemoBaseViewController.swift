//
//  GKDemoBaseViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/3/31.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKDemoBaseViewController: GKBaseViewController {
    var label1: UILabel?
    var label2: UILabel?
    var label3: UILabel?
    var switch1: UISwitch?
    var switch2: UISwitch?
    var slider: UISlider?
    var areaView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        
        label1 = UILabel()
        label1?.textColor = .black
        label1?.text = "侧滑返回手势：开"
        label1?.sizeToFit()
        label1?.frame = CGRect(x: 20, y: self.gk_navigationBar.frame.maxY + 20, width: (label1?.frame.size.width)!, height: (label1?.frame.size.height)!)
        self.view.addSubview(label1!)
        
        switch1 = UISwitch()
        switch1?.frame.origin.x = (label1?.frame.maxX)! + 50
        switch1?.center.y = (label1?.center.y)!
        switch1?.isOn = !self.gk_interactivePopDisabled
        switch1?.addTarget(self, action: #selector(switchAction(_:)), for: .valueChanged)
        self.view.addSubview(switch1!)
        
        label2 = UILabel()
        label2?.textColor = .black
        label2?.text = "全屏返回手势：开"
        label2?.sizeToFit()
        label2?.frame = CGRect(x: 20, y: (label1?.frame.maxY)! + 30, width: (label2?.frame.size.width)!, height: (label2?.frame.size.height)!)
        self.view.addSubview(label2!)
        
        switch2 = UISwitch()
        switch2?.frame.origin.x = (label2?.frame.maxX)! + 50
        switch2?.center.y = (label2?.center.y)!
        switch2?.isOn = !self.gk_fullScreenPopDisabled
        switch2?.addTarget(self, action: #selector(switchAction(_:)), for: .valueChanged)
        self.view.addSubview(switch2!)
        
        label3 = UILabel()
        label3?.textColor = .black
        label3?.text = "全屏手势区域：\(self.view.frame.size.width)"
        label3?.sizeToFit()
        label3?.frame = CGRect(x: 20, y: (label2?.frame.maxY)! + 30, width: (label3?.frame.size.width)!, height: (label3?.frame.size.height)!)
        self.view.addSubview(label3!)
        
        slider = UISlider()
        slider?.minimumValue = 0
        slider?.maximumValue = Float(self.view.frame.size.width)
        slider?.value = Float(self.view.frame.size.width)
        slider?.frame.origin.x = 20
        slider?.frame.origin.y = (label3?.frame.maxY)! + 20
        slider?.frame.size.width = self.view.frame.size.width - 40
        slider?.addTarget(self, action: #selector(sliderAction(_:)), for: .valueChanged)
        self.view.addSubview(slider!)
        
        areaView = UIView()
        areaView?.backgroundColor = .red
        areaView?.frame = CGRect(x: CGFloat(0), y: (slider?.frame.maxY)! + 20, width: CGFloat(slider?.value ?? 0.0), height: CGFloat(40.0))
        self.view.addSubview(areaView!)
    }
    
    @objc func switchAction(_ sender: UISwitch) {
        if sender == self.switch1 {
            self.gk_interactivePopDisabled = !self.gk_interactivePopDisabled
            self.label1?.text = "侧滑返回手势：" + (self.gk_interactivePopDisabled ? "关" : "开")
        }else {
            self.gk_fullScreenPopDisabled = !self.gk_fullScreenPopDisabled
            self.label2?.text = "全屏返回手势：" + (self.gk_fullScreenPopDisabled ? "关" : "开")
        }
    }
    
    @objc func sliderAction(_ sender: UISlider) {
        self.gk_maxPopDistance = CGFloat(sender.value)
        self.label3?.text = "全屏手势区域：\(sender.value)"
        self.label3?.sizeToFit()
        
        var width: CGFloat = 0
        if sender.value == 0 {
            width = self.view.frame.size.width
        }else {
            width = CGFloat(sender.value)
        }
        
        self.areaView?.frame.size.width = width
    }
}
