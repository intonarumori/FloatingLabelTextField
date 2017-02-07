//
//  ViewController.swift
//  FloatingLabelTextField
//
//  Created by Daniel Langh on 2017. 02. 06..
//  Copyright © 2017. rumori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var floatingLabelTextField1: FloatingLabelTextField!
    @IBOutlet weak var floatingLabelTextField2: FloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floatingLabelTextField2.titleLabelAnimator = FloatingLabelAlphaAnimator()
    }

}

