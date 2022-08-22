//
//  CustomActivityIndicator.swift
//  Sparkcognition Task
//
//  Created by $umit on 22/08/22.
//

import UIKit

class CustomActivityIndicator {
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    open class var shared: CustomActivityIndicator {
        struct Static {
            static let instance: CustomActivityIndicator = CustomActivityIndicator()
        }
        return Static.instance
    }

   
    func showActivityIndicator(view: UIView) {
        container.frame = view.frame
        container.center = view.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        
        loadingView.center = view.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame =  CGRect(x: 0, y: 0, width: 40.0, height: 40.0)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(view: UIView) {
        if view.subviews.contains(container){
            activityIndicator.stopAnimating()
            container.removeFromSuperview()
        }
    }
     
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    
}


