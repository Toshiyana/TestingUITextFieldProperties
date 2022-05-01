//
//  TestingUITextFieldPropertiesTests.swift
//  TestingUITextFieldPropertiesTests
//
//  Created by Toshiyana on 2022/05/01.
//

import XCTest
@testable import TestingUITextFieldProperties

class TestingUITextFieldPropertiesTests: XCTestCase {

    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(identifier: "SignupViewController", creator: nil) as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email Address UITextField is not connected")
        
        XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email Address UITextField does not have a Email Addres Content Type set")
    }

    func testEmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email Address UITextField is not connected")
        
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress, "Email Address UITextField does not have a Email Keyboard Type set")
    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField() throws {
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "Password UITextField is not connected")
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password UITextField is not a Secure Text Entry Field")
    }
}
