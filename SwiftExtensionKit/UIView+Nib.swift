//
//  UIView+Nib.swift
//  UIViewNib
//
//  Created by yuantao on 16/3/3.
//  Copyright © 2016年 momo. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public static func loadNib() -> UINib
    {
        return self.loadNibNamed("\(self.classForCoder())")
    }
    
    public static func loadNibNamed(nibName:String) -> UINib
    {
        return self.loadNibNamed(nibName, bundle: NSBundle.mainBundle())
    }
    
    public static func loadNibNamed(nibName: String, bundle:NSBundle) -> UINib
    {
        return UINib.init(nibName: nibName, bundle: bundle)
    }
    
    public static func loadInstanceFromNib() -> UIView
    {
        return self.loadInstanceFromNibWithName("\(self.classForCoder())")
    }
    
    public static func loadInstanceFromNibWithName(nibName: String) -> UIView
    {
        return self.loadInstanceFromNibWithName(nibName, owner: [])
    }
    
    public static func loadInstanceFromNibWithName(nibName:String, owner:AnyObject) -> UIView
    {
        return self.loadInstanceFromNibWithName(nibName, owner: owner, bundle: NSBundle.mainBundle())
    }
    
    public static func loadInstanceFromNibWithName(nibName: String, owner:AnyObject,  bundle: NSBundle) -> UIView
    {
        var result = UIView()
        let elements = bundle.loadNibNamed(nibName, owner: owner, options: nil)
        for  object in elements {
            if object.isKindOfClass(self.classForCoder()) {
                result = object as! UIView
                break
            }
        }
    return result
    }
    
}