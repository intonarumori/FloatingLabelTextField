//
//  FloatingLabelTextFieldTests.swift
//  FloatingLabelTextFieldTests
//
//  Created by Daniel Langh on 2017. 02. 07..
//  Copyright © 2017. rumori. All rights reserved.
//

import XCTest
import FloatingLabelTextField

class FloatingLabelTextFieldTests: XCTestCase {
    
    var textField: FloatingLabelTextField!
    
    override func setUp() {
        super.setUp()
        
        let frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        textField = FloatingLabelTextField(frame: frame)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_whenBorderStyleIsSet_thenBorderStyleRemainsNone() {
        
        // given
        
        // when
        textField.borderStyle = .bezel
        
        // then
        XCTAssertEqual(textField.borderStyle, .none)
    }
    
    func test_whenLineAndTextInsetsAreNil_thenIntrinsicContentSizeIsCalculated() {
        
        // given
        textField.lineHeight = 0
        textField.textInsets = .zero
        
        // when
        let size = textField.intrinsicContentSize
        
        // then
        XCTAssertEqual(size.height, 37)
    }

    func test_whenLineIsOneAndTextInsetsAreNil_thenIntrinsicContentSizeIsCalculated() {
        
        // given
        textField.lineHeight = 1
        textField.textInsets = .zero
        
        // when
        let size = textField.intrinsicContentSize
        
        // then
        XCTAssertEqual(size.height, 38)
    }

    func test_whenLineIsNilAndTextInsetsAreSet_thenIntrinsicContentSizeIsCalculated() {
        
        // given
        textField.lineHeight = 0
        textField.textInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
        // when
        let size = textField.intrinsicContentSize
        
        // then
        XCTAssertEqual(size.height, 47)
    }
    
    // MARK: - Extension
    
    func test_whenTextInsetTopIsSet_thenTextInsetIsChanged() {
        
        // given
        textField.textInsets = .zero
        
        // when
        textField.textInsetsTop = 5
        
        // then
        XCTAssertEqual(textField.textInsets.top, 5)
    }

    func test_whenTextInsetBottomIsSet_thenTextInsetIsChanged() {
        
        // given
        textField.textInsets = .zero
        
        // when
        textField.textInsetsBottom = 5
        
        // then
        XCTAssertEqual(textField.textInsets.bottom, 5)
    }

    func test_whenTextInsetLeftIsSet_thenTextInsetIsChanged() {
        
        // given
        textField.textInsets = .zero
        
        // when
        textField.textInsetsLeft = 5
        
        // then
        XCTAssertEqual(textField.textInsets.left, 5)
    }
    
    func test_whenTextInsetRightIsSet_thenTextInsetIsChanged() {
        
        // given
        textField.textInsets = .zero
        
        // when
        textField.textInsetsRight = 5
        
        // then
        XCTAssertEqual(textField.textInsets.right, 5)
    }
    
    func test_whenTextInsetTopIsAccessed_thenTextInsetValueIsReturned() {

        // given
        textField.textInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        // when
        let inset = textField.textInsetsTop
        
        // then
        XCTAssertEqual(inset, 5)
    }

    func test_whenTextInsetBottomIsAccessed_thenTextInsetValueIsReturned() {
        
        // given
        textField.textInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        
        // when
        let inset = textField.textInsetsBottom
        
        // then
        XCTAssertEqual(inset, 5)
    }

    func test_whenTextInsetLeftIsAccessed_thenTextInsetValueIsReturned() {
        
        // given
        textField.textInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        
        // when
        let inset = textField.textInsetsLeft
        
        // then
        XCTAssertEqual(inset, 5)
    }

    func test_whenTextInsetRightIsAccessed_thenTextInsetValueIsReturned() {
        
        // given
        textField.textInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        
        // when
        let inset = textField.textInsetsRight
        
        // then
        XCTAssertEqual(inset, 5)
    }
    
    // MARK: - prepareForInterfaceBuilder
    
    func test_whenTextFieldIsUsedInInterfaceBuilder_thenBorderStyleIsSetToNone() {

        // when
        textField.prepareForInterfaceBuilder()
        
        // then
        XCTAssertEqual(textField.borderStyle, .none)
    }
    
    // MARK: - responder
    
    func test_whenOnlyPlaceholderIsSet_thenTitleIsUpdated() {
    
        // given
        textField.placeholder = "Placeholder"
        textField.title = nil
        textField.editingTitle = nil
        
        // then
        XCTAssertEqual(textField.titleLabel.text, "Placeholder")
    }

    func test_whenPlaceholderAndTitleIsSet_thenTitleIsUpdated() {
        
        // given
        textField.placeholder = "Placeholder"
        textField.title = "Title"
        textField.editingTitle = nil

        // then
        XCTAssertEqual(textField.titleLabel.text, "Title")
    }

    func test_whenPlaceholderAndEditingTitleIsSet_andTextFieldBecomesFirstResponder_thenTitleIsUpdated() {
        
        // given
        textField.placeholder = "Placeholder"
        textField.title = nil
        textField.editingTitle = "Editing title"
        
        XCTAssertEqual(textField.titleLabel.text, "Placeholder")
        
        // when
        let result = textField.becomeFirstResponder()
        
        // then
        XCTAssertEqual(textField.titleLabel.text, "Editing title")
    }

}
