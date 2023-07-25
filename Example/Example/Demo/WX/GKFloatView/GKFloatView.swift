//
//  GKFloatView.swift
//  Example
//
//  Created by QuintGao on 2020/10/26.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

var _floatView: GKFloatView?
let GKFloatScreenW = UIScreen.main.bounds.size.width
let GKFloatScreenH = UIScreen.main.bounds.size.height
let GKFloatWH = CGFloat(60)

class GKFloatView: UIView {
    lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "weixin")
        imgView.isUserInteractionEnabled = true
        imgView.layer.cornerRadius = GKFloatWH / 2;
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    weak var fromVC: UIViewController?
    weak var toVC: UIViewController?
    
    class func create() {
        if (_floatView != nil) {return}
        let floatView = GKFloatView()
        floatView.frame = CGRect(x: GKFloatScreenW - CGFloat(10) - GKFloatWH, y: GKDevice.statusBarNavBarHeight() + CGFloat(20), width: GKFloatWH, height: GKFloatWH)
        _floatView = floatView
        (UIApplication.shared.delegate?.window ?? nil)?.addSubview(floatView)
    }
    
    class func destory() {
        if _floatView != nil {
            _floatView?.removeFromSuperview()
            _floatView = nil
        }
    }
    
    class func show() {
        if _floatView != nil {
            _floatView!.show()
            _floatView?.isHidden = false
        }
    }
    
    class func hide() {
        if _floatView != nil {
            _floatView?.hide()
            _floatView?.isHidden = true
        }
    }
    
    class func floatView() -> GKFloatView {
        return _floatView ?? GKFloatView()
    }
    
    class func dismissVC() {
        if _floatView != nil {
            _floatView?.dismissVC()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imgView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(imgClick))
        imgView.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imgView.frame = self.bounds
    }
    
    @objc func imgClick() {
        let visibleVC = GKConfigure.visibleViewController()
        visibleVC?.gk_pushTransition = GKFloatTransition(type: .push)
        self.fromVC = visibleVC
        
        let detailVC = GKWXDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.gk_popTransition = GKFloatTransition(type: .pop)
        self.toVC = detailVC
        visibleVC?.navigationController?.pushViewController(detailVC, animated: true)
        GKFloatView.hide()
    }
    
    func show() {
        self.fromVC?.gk_pushTransition = nil
        self.toVC?.gk_popTransition = nil
    }
    
    func hide() {
        self.toVC?.gk_popTransition = GKFloatTransition(type: .pop)
    }
    
    func dismissVC() {
        GKFloatView.show()
        
        if self.toVC == nil {
            self.toVC = GKConfigure.visibleViewController()
        }
        self.toVC?.gk_popTransition = GKFloatTransition(type: .pop)
        self.toVC?.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        self.fromVC?.gk_pushTransition = nil
        self.toVC?.gk_popTransition = nil
    }
    
    // MARK - Touch Event
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.center = (touches.first?.location(in: self.superview))!
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.panEnd(point: (touches.first?.location(in: self.superview))!)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.panEnd(point: (touches.first?.location(in: self.superview))!)
    }
    
    func panEnd(point: CGPoint) {
        var frame = self.frame
        if point.x <= GKFloatScreenW / 2 {
            frame.origin.x = 10
        }else {
            frame.origin.x = GKFloatScreenW - GKFloatWH - 10
        }
        if frame.origin.y > GKFloatScreenH - frame.size.height - 10 {
            frame.origin.y = GKFloatScreenH - frame.size.height - 10
        }else if frame.origin.y < 20 {
            frame.origin.y = 20
        }
        
        UIView.animate(withDuration: 0.3) {
            self.frame = frame
        }
    }
}
