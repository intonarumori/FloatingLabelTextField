//
//  TextPropertiesExampleViewController.swift
//  FloatingLabelTextField
//
//  Created by Daniel Langh on 2017. 02. 07..
//  Copyright © 2017. rumori. All rights reserved.
//

import UIKit
import FloatingLabelTextField

class TextPropertiesExampleViewController: UIViewController {

    @IBOutlet weak var textField: FloatingLabelTextField!
    @IBOutlet weak var errorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - User actions
    
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

    // MARK: -
    

    @IBAction
    func placeholderControlChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            textField.placeholder = NSLocalizedString("Placeholder", comment: "")
        default:
            textField.placeholder = nil
        }
    }

    @IBAction
    func editingTitleControlChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            textField.editingTitle = NSLocalizedString("Editing title", comment: "")
        default:
            textField.editingTitle = nil
        }
    }

    @IBAction
    func titleControlChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            textField.title = NSLocalizedString("Title", comment: "")
        default:
            textField.title = nil
        }
    }
}
