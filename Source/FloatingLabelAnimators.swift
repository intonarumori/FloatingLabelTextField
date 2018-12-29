//
//  FloatingLabelAnimators.swift
//  FloatingLabelTextField
//
//  Created by Daniel Langh on 2017. 02. 07..
//  Copyright © 2017. rumori. All rights reserved.
//

import UIKit

public class FloatingLabelHorizontalAnimator: FloatingLabelAnimator {
    public func layout(titleLabel label: UILabel, for textField: FloatingLabelTextField) {
        let block: (FloatingLabelTextField, UILabel) -> Void = { textField, label in
            
            let targetFrame = CGRect(x:0, y:0, width: textField.bounds.width, height: label.font.lineHeight)

            let shouldShow: Bool
            switch textField.titleMode {
            case .always:
                shouldShow = true
            case .whileEditing:
                shouldShow = textField.isFirstResponder
            case .whileNotEmpty:
                shouldShow = textField.hasText
            }
            if shouldShow {
                label.frame = targetFrame
                label.alpha = 1.0
            } else {
                label.frame = targetFrame.offsetBy(dx: 10, dy:0)
                label.alpha = 0.0
            }
        }
        
        let shouldAnimate = textField.isFirstResponder
        
        if shouldAnimate {
            UIView.animate(withDuration: 0.2, animations: {
                block(textField, label)
            })
        } else {
            block(textField, label)
        }
    }
}

public class FloatingLabelVerticalAnimator: FloatingLabelAnimator {
    
    public func layout(titleLabel label: UILabel, for textField: FloatingLabelTextField) {
        let block: (FloatingLabelTextField, UILabel) -> Void = { textField, label in
            
            let targetFrame = CGRect(x:0, y:0, width: textField.bounds.width, height: label.font.lineHeight)
            
            let shouldShow: Bool
            switch textField.titleMode {
            case .always:
                shouldShow = true
            case .whileEditing:
                shouldShow = textField.isFirstResponder
            case .whileNotEmpty:
                shouldShow = textField.hasText
            }
            if shouldShow {
                label.frame = targetFrame
                label.alpha = 1.0
            } else {
                label.frame = targetFrame.offsetBy(dx: 0, dy: 10)
                label.alpha = 0.0
            }
        }
        
        let shouldAnimate = textField.isFirstResponder
        
        if shouldAnimate {
            UIView.animate(withDuration: 0.2, animations: {
                block(textField, label)
            })
        } else {
            block(textField, label)
        }
    }
}

public class FloatingLabelAlphaAnimator: FloatingLabelAnimator {
    
    public func layout(titleLabel label: UILabel, for textField: FloatingLabelTextField) {

        let targetFrame = CGRect(x:0, y:0, width: textField.bounds.width, height: label.font.lineHeight)
        label.frame = targetFrame

        let block: (FloatingLabelTextField, UILabel) -> Void = { textField, label in
            let shouldShow: Bool
            switch textField.titleMode {
            case .always:
                shouldShow = true
            case .whileEditing:
                shouldShow = textField.isFirstResponder
            case .whileNotEmpty:
                shouldShow = textField.hasText
            }
            if shouldShow {
                label.alpha = 1.0
            } else {
                label.alpha = 0.0
            }
        }
        
        let shouldAnimate = textField.isFirstResponder
        
        if shouldAnimate {
            UIView.animate(withDuration: 0.2, animations: {
                block(textField, label)
            })
        } else {
            block(textField, label)
        }
    }
}
