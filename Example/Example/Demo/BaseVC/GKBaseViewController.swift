//
//  GKBaseViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/3/31.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.modalPresentationStyle = .fullScreen
    }
    
    override var prefersStatusBarHidden: Bool {
        return self.gk_statusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.gk_statusBarStyle
    }
}

extension NSObject {
   
    func getPropertyNames(){
        
        var outCount:UInt32
        
        outCount = 0
        
        
        let propers:UnsafeMutablePointer<objc_property_t>! =  class_copyPropertyList(self.classForCoder, &outCount)
        
        
        let count:Int = Int(outCount);
        
        print(outCount)
        
        for i in 0...(count-1) {
            
            let aPro: objc_property_t = propers[i]
            
            let proName:String! = String(utf8String: property_getName(aPro));
            
            print(proName as Any)
            
        }
        
    }
    
    
    func getMethodNames(){
        
        var outCount:UInt32
        
        outCount = 0
        
        if let methods = class_copyMethodList(self.classForCoder, &outCount) {
            for i in 0..<outCount {
                let method = methods[Int(i)]
                let sel = method_getName(method)
                print(NSStringFromSelector(sel))
            }
        }
        
//        let methods:UnsafeMutablePointer<objc_property_t>! =  class_copyMethodList(self.classForCoder, &outCount)
//
//        let count:Int = Int(outCount);
//
//        print(outCount)
//
//        for i in 0...(count-1) {
//
//            let aMet: objc_property_t = methods[i]
//
//            if aMet == nil {
//                return
//            }
//            if let methodName = String(utf8String: property_getName(aMet)) {
//                print(methodName)
//            }
////            let methodName:String? = String(utf8String: property_getName(aMet));
////
////            print(methodName as Any)
//
//        }
        
    }
    
}
