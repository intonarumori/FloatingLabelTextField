//
//  FloatingLabelIconTextField.swift
//  FloatingLabelTextField
//
//  Created by Daniel Langh on 2017. 02. 07..
//  Copyright © 2017. rumori. All rights reserved.
//

import UIKit

@IBDesignable
open class FloatingLabelIconTextField: FloatingLabelTextField {

    
    open var iconInsets: UIEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    open var iconImage: UIImage? {
        didSet {
            updateIconView()
        }
    }

    @IBInspectable
    open var selectedIconImage: UIImage? {
        didSet {
            updateIconView()
        }
    }
    
    private(set) lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .left
        return imageView
    }()
    
    // MARK: -
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func init_FloatingLabelIconTextField() {
        addTarget(self, action: #selector(updateIconView), for: .editingDidBegin)
        addTarget(self, action: #selector(updateIconView), for: .editingDidEnd)
    }
    
    // MARK: -
    
    open func updateIconView() {
        
        if let iconImage = iconImage {
            let image = hasText ? iconImage.withRenderingMode(.alwaysTemplate) : iconImage
            iconView.image = image
            iconView.sizeToFit()
            leftView = iconView
            leftViewMode = .always
        }
        else {
            iconView.image = nil
            leftViewMode = .never
        }
    }
    
}
