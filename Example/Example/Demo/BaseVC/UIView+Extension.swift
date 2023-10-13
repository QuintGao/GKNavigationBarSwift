//
//  UIView+Extension.swift
//  Example
//
//  Created by QuintGao on 2022/3/21.
//  Copyright © 2022 QuintGao. All rights reserved.
//

import Foundation
import QuartzCore

extension UIView {
    func image(with colors: [Any]) -> UIImage? {
        addGradualLayer(colors)
        return convertToImage()
    }
    
    func addGradualLayer(_ colors: [Any]) {
        if colors.count == 0 { return }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = [0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.02, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
    
    func convertToImage() -> UIImage? {
        let size = self.bounds.size
        if size.width <= 0 || size.height <= 0 { return nil }
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        self.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
