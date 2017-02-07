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

    open var iconInsets: UIEdgeInsets = .zero {
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
    
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.editingRect(forBounds: bounds)
        let offset = iconInsets.right
        rect.origin.x += offset
        rect.size.width -= offset
        return rect
    }
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        let offset = iconInsets.right
        rect.origin.x += offset
        rect.size.width -= offset
        return rect
    }
    
    open override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += iconInsets.left
        rect.origin.y += iconInsets.top
        return rect
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
            leftView = nil
            leftViewMode = .never
        }
    }
}



// MARK: -

// Helper extension to make icon insets available in Interface Builder property inspector

extension FloatingLabelIconTextField {
    
    @IBInspectable
    var iconInsetsTop: CGFloat {
        set { iconInsets.top = newValue }
        get { return iconInsets.top }
    }
    
    @IBInspectable
    var iconInsetsBottom: CGFloat {
        set { iconInsets.bottom = newValue }
        get { return iconInsets.bottom }
    }
    
    @IBInspectable
    var iconInsetsLeft: CGFloat {
        set { iconInsets.left = newValue }
        get { return iconInsets.left }
    }
    
    @IBInspectable
    var iconInsetsRight: CGFloat {
        set { iconInsets.right = newValue }
        get { return iconInsets.right }
    }
}
