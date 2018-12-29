//
//  InsetsExampleViewController.swift
//  FloatingLabelTextField
//
//  Created by Daniel Langh on 2017. 02. 07..
//  Copyright © 2017. rumori. All rights reserved.
//

import UIKit
import FloatingLabelTextField

class InsetsExampleViewController: UIViewController {

    @IBOutlet var textField: FloatingLabelIconTextField!
    
    // MARK: - User actions
    
    
    @IBAction
    func resignResponder() {
        textField.resignFirstResponder()
    }
    
    // MARK: -
    
    @IBAction
    func textInsetsTopChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.textInsetsTop = 0
        case 1:
            textField.textInsetsTop = 5
        default:
            textField.textInsetsTop = 10
        }
    }

    @IBAction
    func textInsetsBottomChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.textInsetsBottom = 0
        case 1:
            textField.textInsetsBottom = 5
        default:
            textField.textInsetsBottom = 10
        }
    }
    
    @IBAction
    func textInsetsLeftChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.textInsetsLeft = 0
        case 1:
            textField.textInsetsLeft = 5
        default:
            textField.textInsetsLeft = 10
        }
    }
    
    @IBAction
    func textInsetsRightChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.textInsetsRight = 0
        case 1:
            textField.textInsetsRight = 5
        default:
            textField.textInsetsRight = 10
        }
    }
    
    // MARK: -

    @IBAction
    func iconChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.iconImage = nil
        default:
            textField.iconImage = #imageLiteral(resourceName: "Doc")
        }
    }

    // MARK: -
    
    @IBAction
    func iconInsetsTopChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.iconInsetsTop = 0
        case 1:
            textField.iconInsetsTop = 5
        default:
            textField.iconInsetsTop = 10
        }
    }
    
    @IBAction
    func iconInsetsBottomChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.iconInsetsBottom = 0
        case 1:
            textField.iconInsetsBottom = 5
        default:
            textField.iconInsetsBottom = 10
        }
    }
    
    @IBAction
    func iconInsetsLeftChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.iconInsetsLeft = 0
        case 1:
            textField.iconInsetsLeft = 5
        default:
            textField.iconInsetsLeft = 10
        }
    }
    
    @IBAction
    func iconInsetsRightChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.iconInsetsRight = 0
        case 1:
            textField.iconInsetsRight = 5
        default:
            textField.iconInsetsRight = 10
        }
    }
    
    // MARK: -

    @IBAction
    func lineHeightChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.lineHeight = 0
        case 1:
            textField.lineHeight = 1
        default:
            textField.lineHeight = 2
        }
    }
    
}
