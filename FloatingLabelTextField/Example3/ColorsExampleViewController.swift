//
//  ColorsExampleViewController.swift
//  FloatingLabelTextField
//
//  Created by Daniel Langh on 2017. 02. 07..
//  Copyright © 2017. rumori. All rights reserved.
//

import UIKit

class ColorsExampleViewController: UIViewController {

    @IBOutlet weak var textField: FloatingLabelTextField!
    @IBOutlet weak var errorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: -
    
    @IBAction
    func resignFirstResponderPressed() {
        textField.resignFirstResponder()
    }
    
    @IBAction
    func errorButtonPressed() {
        if textField.errorMessage == nil {
            textField.errorMessage = NSLocalizedString("Error message", comment: "")
            errorButton.setTitle(NSLocalizedString("Clear error message", comment: ""), for: .normal)
        } else {
            errorButton.setTitle(NSLocalizedString("Add error message", comment: ""), for: .normal)
            textField.errorMessage = nil
        }
    }
    
    @IBAction
    func lineColorChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.lineColor = nil
        case 1:
            textField.lineColor = .red
        case 2:
            textField.lineColor = .blue
        default:
            textField.lineColor = .black
        }
    }
    
    @IBAction
    func titleColorChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.titleColor = nil
        case 1:
            textField.titleColor = .red
        case 2:
            textField.titleColor = .blue
        default:
            textField.titleColor = .black
        }
    }

    @IBAction
    func editingTitleColorChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.editingTitleColor = nil
        case 1:
            textField.editingTitleColor = .red
        case 2:
            textField.editingTitleColor = .blue
        default:
            textField.editingTitleColor = .black
        }
    }

    @IBAction
    func placeholderColorChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.placeholderColor = nil
        case 1:
            textField.placeholderColor = .red
        case 2:
            textField.placeholderColor = .blue
        default:
            textField.placeholderColor = .black
        }
    }

    @IBAction
    func textColorChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.textColor = nil
        case 1:
            textField.textColor = .red
        case 2:
            textField.textColor = .blue
        default:
            textField.textColor = .black
        }
    }

    @IBAction
    func tintColorChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            textField.tintColor = nil
        case 1:
            textField.tintColor = .red
        case 2:
            textField.tintColor = .blue
        default:
            textField.tintColor = .black
        }
    }

    
    
}
