//
//  GKFloatTransition.swift
//  Example
//
//  Created by gaokun on 2020/10/26.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

enum GKFloatTransitionType {
    case push
    case pop
}

class GKFloatTransition: GKBaseAnimatedTransition {
    var coverView: UIView?
    var type = GKFloatTransitionType.pop
    var contentView: UIView?
    
    class func transition(type: GKFloatTransitionType) -> GKFloatTransition {
        return GKFloatTransition(type: type)
    }
    
    init(type: GKFloatTransitionType) {
        super.init(scale: false)
        
        self.type = type
    }
    
    required init(scale: Bool) {
        fatalError("init(scale:) has not been implemented")
    }
    
    override func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    override func animateTransition() {
        if self.type == .push {
            pushTransition()
        }else if self.type == .pop {
            popTransition()
        }
    }
    
    func pushTransition() {
        // 解决UITabBarController左滑push时的显示问题
        self.isHideTabBar = (self.fromViewController.tabBarController != nil) && (self.toViewController.hidesBottomBarWhenPushed == true)
        
        var fromView = self.fromViewController.view
        if self.isHideTabBar {
            // 获取fromViewController的截图
            let view: UIView?
            if self.fromViewController.view.window != nil {
                view = self.fromViewController.view.window
            }else {
                view = self.fromViewController.view
            }
            if view != nil {
                let captureImage = GKConfigure.getCapture(with: view!)
                let captureView = UIImageView(image: captureImage)
                captureView.frame = CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height)
                containerView.addSubview(captureView)
                fromView = captureView
                self.fromViewController.gk_captureImage = captureImage
                self.fromViewController.view.isHidden = true
                self.fromViewController.tabBarController?.tabBar.isHidden = true
            }
        }
        self.contentView = fromView
        
        self.containerView.addSubview(self.toViewController.view)
        
        let floatBallRect = GKFloatView.floatView().frame
        
        self.coverView = UIView(frame: UIScreen.main.bounds)
        self.coverView!.backgroundColor = .black
        self.coverView!.alpha = 0.5;
        
        self.contentView?.addSubview(self.coverView!)
        let maskStartBP = UIBezierPath(roundedRect: floatBallRect, cornerRadius: floatBallRect.size.height / 2)
        let maskFinalBP = UIBezierPath(roundedRect: UIScreen.main.bounds, cornerRadius: floatBallRect.size.width / 2)
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskStartBP.cgPath
        self.toViewController.view.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = maskStartBP.cgPath
        maskLayerAnimation.toValue = maskFinalBP.cgPath
        maskLayerAnimation.duration = self.animationDuration()
        maskLayerAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        maskLayerAnimation.delegate = self
        maskLayer.add(maskLayerAnimation, forKey: "path")
    }
    
    func popTransition() {
        self.containerView.insertSubview(self.toViewController.view, belowSubview: self.fromViewController.view)
        // 是否隐藏tabBar
        self.isHideTabBar = (self.toViewController.tabBarController != nil) && (self.fromViewController.hidesBottomBarWhenPushed == true) && (self.toViewController.gk_captureImage != nil)
        
        var toView = self.toViewController.view
        
        if self.isHideTabBar {
            let captureView = UIImageView(image: self.toViewController.gk_captureImage!)
            captureView.frame = CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height)
            self.containerView.insertSubview(captureView, belowSubview: self.fromViewController.view)
            toView = captureView
            self.toViewController.view.isHidden = true
            self.toViewController.tabBarController?.tabBar.isHidden = true
        }
        self.contentView = toView
        
        GKFloatView.show()
        
        let floatBallRect = GKFloatView.floatView().frame
        self.coverView = UIView(frame: UIScreen.main.bounds)
        self.coverView!.backgroundColor = .black
        self.coverView!.alpha = 0.5;
        
        self.contentView?.addSubview(self.coverView!)
        
        let maskStartBP = UIBezierPath(roundedRect: floatBallRect, cornerRadius: floatBallRect.size.height / 2)
        let maskFinalBP = UIBezierPath(roundedRect: UIScreen.main.bounds, cornerRadius: floatBallRect.size.width / 2)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskStartBP.cgPath
        self.fromViewController.view.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.toValue = maskStartBP.cgPath
        maskLayerAnimation.fromValue = maskFinalBP.cgPath
        maskLayerAnimation.duration = self.animationDuration()
        maskLayerAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        maskLayerAnimation.delegate = self
        maskLayer.add(maskLayerAnimation, forKey: "path")
        
        UIView.animate(withDuration: 0.5) {
            self.coverView?.alpha = 0
        }
    }
}

extension GKFloatTransition: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.completeTransition()
        self.fromViewController.view.layer.mask = nil
        self.toViewController.view.layer.mask = nil
        self.coverView?.removeFromSuperview()
        if self.isHideTabBar {
            if self.contentView != nil {
                self.contentView!.removeFromSuperview()
                self.contentView = nil
            }
            if self.type == .push {
                self.fromViewController.view.isHidden = false
                if self.fromViewController.navigationController?.children.count == 1 {
                    self.fromViewController.tabBarController?.tabBar.isHidden = false
                }
            }else if self.type == .pop {
                self.toViewController.view.isHidden = false
                if self.toViewController.navigationController?.children.count == 1 {
                    self.toViewController.tabBarController?.tabBar.isHidden = false
                }
            }
        }
    }
}
