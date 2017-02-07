//
//  TextPropertiesExampleViewController.swift
//  FloatingLabelTextField
//
//  Created by Daniel Langh on 2017. 02. 07..
//  Copyright © 2017. rumori. All rights reserved.
//

import UIKit

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
    func selectedTitleControlChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            textField.selectedTitle = NSLocalizedString("Selected title", comment: "")
        default:
            textField.selectedTitle = nil
        }
    }

    @IBAction
    func deselectedTitleControlChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            textField.deselectedTitle = NSLocalizedString("Deselected title", comment: "")
        default:
            textField.deselectedTitle = nil
        }
    }
}
