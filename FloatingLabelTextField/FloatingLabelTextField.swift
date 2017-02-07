//
//  FloatingLabelTextField.swift
//  FloatingLabelTextField
//
//  Created by Daniel Langh on 2017. 02. 07..
//  Copyright © 2017. rumori. All rights reserved.
//

import UIKit

public protocol FloatingLabelAnimator: class {
    func layout(titleLabel label: UILabel, for textField: FloatingLabelTextField)
}

// MARK: -

@IBDesignable
open class FloatingLabelTextField: UITextField {
    
    @IBInspectable
    open var textInsets: UIEdgeInsets = .zero {
        didSet {
            setNeedsLayout()
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable
    open var lineHeight: CGFloat = 0 {
        didSet {
            updateLineView()
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable
    open var lineColor: UIColor? {
        didSet {
            updateLineView()
        }
    }
    
    @IBInspectable
    open var editingLineColor: UIColor? {
        didSet {
            updateLineView()
        }
    }
    
    @IBInspectable
    open var selectedLineColor: UIColor? {
        didSet {
            updateLineView()
        }
    }
    
    // MARK: -
    
    @IBInspectable
    open var titleColor: UIColor? {
        didSet {
            updateTitle()
        }
    }
    
    
    // MARK: -
    
    @IBInspectable
    open var deselectedTitle: String? {
        didSet {
            updateTitle()
        }
    }
    
    @IBInspectable
    open var selectedTitle: String? {
        didSet {
            updateTitle()
        }
    }
    
    @IBInspectable
    open var errorMessage: String? {
        didSet {
            updateTitle()
        }
    }
    
    open override var borderStyle: UITextBorderStyle {
        set {
            // NOTE: we are not supporting borderstyle
            print("FloatingLabelTextField does not support the borderStyle property")
        }
        get {
            return .none
        }
    }
    
    open var titleLabelAnimator: FloatingLabelAnimator = FloatingLabelVerticalAnimator()
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .brown
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        return titleLabel
    }()
    
    private(set) var lineView: UIView?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        init_FloatingLabelTextField()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        init_FloatingLabelTextField()
    }
    
    private func init_FloatingLabelTextField() {

        addSubview(titleLabel)
        updateLineView()

        addTarget(self, action: #selector(updateTitle), for: .editingChanged)
        addTarget(self, action: #selector(updateTitle), for: .editingDidEnd)
        addTarget(self, action: #selector(updateTitle), for: .editingDidBegin)
    }
    
    
    // MARK: - Interface Builder
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        // NOTE: borderstyle is not supported
        borderStyle = .none
    }
    
    // MARK: - Updates
    
    open func updateTitle() {
        
        if let errorMessage = errorMessage {
            titleLabel.text = errorMessage
            titleLabel.textColor = .red
        } else {
            if isFirstResponder {
                titleLabel.text = selectedTitle ?? placeholder
            } else {
                titleLabel.text = deselectedTitle ?? placeholder
            }
            titleLabel.textColor = titleColor ?? textColor
        }
        setNeedsLayout()
    }
    
    private func updateLineView() {
        
        if lineHeight > 0 {
            
            let lineView = self.lineView ?? {
                let lineView = UIView()
                lineView.isUserInteractionEnabled = false
                self.lineView = lineView
                return lineView
                }()
            
            lineView.backgroundColor = lineColor ?? tintColor
            addSubview(lineView)
            setNeedsLayout()
            
        } else {
            lineView?.removeFromSuperview()
            lineView = nil
        }
    }
    
    // MARK: - Supporting frame overrides
    
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        let rect = super.editingRect(forBounds: bounds)
        return UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(titleHeight + textInsets.top, textInsets.left, lineHeight + textInsets.bottom, textInsets.right))
    }
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {

        let rect = super.textRect(forBounds: bounds)
        return UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(titleHeight + textInsets.top, textInsets.left, lineHeight + textInsets.bottom, textInsets.right))
    }
    
    open override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return super.leftViewRect(forBounds: bounds).offsetBy(dx: 0, dy: titleHeight/2 - lineHeight/2)
    }
    
    open override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return super.rightViewRect(forBounds: bounds).offsetBy(dx: 0, dy: titleHeight/2 - lineHeight/2)
    }

    open override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        return super.clearButtonRect(forBounds: bounds).offsetBy(dx: 0, dy: titleHeight/2 - lineHeight/2 + (textInsets.top - textInsets.bottom)/2)
    }

    // MARK: -
    
    var titleHeight: CGFloat {
        return titleLabel.font.lineHeight
    }
    
    // MARK: -
    
    open override var intrinsicContentSize: CGSize {
        get {
            return sizeThatFits(frame.size)
            
            var size = super.intrinsicContentSize
            print("super intrinsicContentSize \(size)")
            size.width += textInsets.left + textInsets.right
            size.height += titleHeight + lineHeight + textInsets.top + textInsets.bottom
            
            print("intrinsicContentSize \(size)")
            return size
        }
    }
    
    // MARK: -
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        lineView?.frame = CGRect(x: 0, y: bounds.maxY - lineHeight, width: bounds.width, height: lineHeight)
        
        for subview in subviews {
            if subview != titleLabel && subview != lineView {
                subview.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
            }
        }
        
        titleLabelAnimator.layout(titleLabel: titleLabel, for: self)
    }
}

// MARK: -

// Helper extension to make text insets available in Interface Builder property inspector

extension FloatingLabelTextField {
    
    @IBInspectable
    var textInsetsTop: CGFloat {
        set { textInsets.top = newValue }
        get { return textInsets.top }
    }

    @IBInspectable
    var textInsetsBottom: CGFloat {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom }
    }

    @IBInspectable
    var textInsetsLeft: CGFloat {
        set { textInsets.left = newValue }
        get { return textInsets.left }
    }

    @IBInspectable
    var textInsetsRight: CGFloat {
        set { textInsets.right = newValue }
        get { return textInsets.right }
    }
}
