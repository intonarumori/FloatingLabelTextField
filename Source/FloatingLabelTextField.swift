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
    
    public enum TitleViewMode: String {
        case whileNotEmpty
        case whileEditing
        case always
    }
    
    @IBInspectable
    open var placeholderColor: UIColor? {
        didSet {
            updatePlaceholder()
        }
    }
    
    open var placeholderFont: UIFont? {
        didSet {
            updatePlaceholder()
        }
    }
    
    @IBInspectable
    open var textInsets: UIEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0) {
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
    
    // MARK: -
    
    @IBInspectable
    open var titleFont: UIFont? {
        set {
            titleLabel.font = newValue
        }
        get {
            return titleLabel.font
        }
    }
    
    @IBInspectable
    open var titleColor: UIColor? {
        didSet {
            updateTitle()
        }
    }
    
    @IBInspectable
    open var editingTitleColor: UIColor? {
        didSet {
            updateTitle()
        }
    }
    
    @IBInspectable
    open var errorTitleColor: UIColor? {
        didSet {
            updateTitle()
        }
    }
    
    open override var placeholder: String? {
        set {
            super.placeholder = newValue
            updateTitle()
        }
        get {
            return super.placeholder
        }
    }
    
    // MARK: -
    
    open var titleMode: TitleViewMode = .whileNotEmpty {
        didSet { updateTitle() }
    }
    
    @IBInspectable
    open var titleModeString: String {
        set {
            if let mode = TitleViewMode(rawValue: newValue) {
                titleMode = mode
            }
        }
        get { return titleMode.rawValue }
    }
    
    @IBInspectable
    open var title: String? {
        didSet {
            updateTitle()
        }
    }
    
    @IBInspectable
    open var editingTitle: String? {
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
    
    open override var borderStyle: UITextField.BorderStyle {
        set {
            // NOTE: we are not supporting borderstyle
            print("FloatingLabelTextField does not support the borderStyle property")
        }
        get {
            return super.borderStyle
        }
    }
    
    open lazy var titleLabelAnimator: FloatingLabelAnimator = FloatingLabelVerticalAnimator()
    
    // MARK: - Subviews
    
    public private(set) lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        return titleLabel
    }()
    
    private(set) var lineView: UIView?
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
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

        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
    }
    
    // MARK: - Interface Builder
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        // NOTE: borderstyle is not supported
        super.borderStyle = .none
    }
    
    // MARK: - Updates
    
    @objc
    private func editingChanged() {
        updateTitle()
    }
    
    @objc
    private func editingDidEnd() {
        updateTitle()
        updateLineView()
    }
    
    @objc
    private func editingDidBegin() {
        updateTitle()
        updateLineView()
    }
    
    private func updatePlaceholder() {
        if let placeholder = self.placeholder {
            
            var attributes = [NSAttributedString.Key: Any]()
            attributes[.foregroundColor] = placeholderColor
            attributes[.font] = placeholderFont ?? font

            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: attributes
            )
        } else {
            attributedPlaceholder = nil
        }
    }
    
    private func updateTitle() {
        
        if let errorMessage = errorMessage {
            titleLabel.text = errorMessage
            titleLabel.textColor = errorTitleColor ?? .red
        } else {
            if isEditing {
                titleLabel.text = editingTitle ?? title ?? placeholder
                titleLabel.textColor = editingTitleColor ?? titleColor ?? tintColor
            } else {
                titleLabel.text = title ?? placeholder
                titleLabel.textColor = titleColor ?? tintColor
            }
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

            if isEditing {
                lineView.backgroundColor = editingLineColor ?? lineColor ?? tintColor
            } else {
                lineView.backgroundColor = lineColor ?? tintColor
            }

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
        return rect.inset(by: UIEdgeInsets(top: titleHeight + textInsets.top,
                                           left: textInsets.left,
                                           bottom: lineHeight + textInsets.bottom,
                                           right: textInsets.right))
    }
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {

        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: titleHeight + textInsets.top,
                                           left: textInsets.left,
                                           bottom: lineHeight + textInsets.bottom,
                                           right: textInsets.right))
    }
    
    open override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.leftViewRect(forBounds: bounds)
        return rect.offsetBy(dx: 0, dy: titleHeight/2 - lineHeight/2 + (textInsets.top - textInsets.bottom)/2)
    }
    
    open override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect.offsetBy(dx: 0, dy: titleHeight/2 - lineHeight/2 + (textInsets.top - textInsets.bottom)/2)
    }

    open override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect.offsetBy(dx: 0, dy: titleHeight/2 - lineHeight/2 + (textInsets.top - textInsets.bottom)/2)
    }
    
    // MARK: -
    
    open override func tintColorDidChange() {
        super.tintColorDidChange()
        updateLineView()
        updateTitle()
    }


    // MARK: -
    
    var titleHeight: CGFloat {
        return titleLabel.font.lineHeight
    }
    
    // MARK: -
    
    open override var intrinsicContentSize: CGSize {
        get {
            return sizeThatFits(frame.size)
        }
    }
    
    // MARK: -
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        lineView?.frame = CGRect(x: 0, y: bounds.maxY - lineHeight, width: bounds.width, height: lineHeight)
        /*
        for subview in subviews {
            if subview != titleLabel && subview != lineView {
                subview.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
            }
        }*/
        titleLabelAnimator.layout(titleLabel: titleLabel, for: self)
    }
}

// MARK: -

// Helper extension to make text insets available in Interface Builder property inspector

extension FloatingLabelTextField {
    
    @IBInspectable
    public var textInsetsTop: CGFloat {
        set { textInsets.top = newValue }
        get { return textInsets.top }
    }

    @IBInspectable
    public var textInsetsBottom: CGFloat {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom }
    }

    @IBInspectable
    public var textInsetsLeft: CGFloat {
        set { textInsets.left = newValue }
        get { return textInsets.left }
    }

    @IBInspectable
    public var textInsetsRight: CGFloat {
        set { textInsets.right = newValue }
        get { return textInsets.right }
    }
}
