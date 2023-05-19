//
//  ViewController.swift
//  iOS_Segment_Integration
//
//  Created by Karthik Iyer on 18/01/23.
//

import UIKit
import Segment_CleverTap
import Segment

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtIdentity: UITextField!
    
    @IBOutlet weak var txtMobileNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtName.delegate = self
        txtEmail.delegate = self
        txtIdentity.delegate = self
        txtMobileNumber.delegate = self
        
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let config = AnalyticsConfiguration(writeKey: "Yhppg7GRbCW2jQ27Pu4EzvIxDTMqH2J0")
        config.use(SEGCleverTapIntegrationFactory())
        Analytics.setup(with: config)
        
        let traits: [String: Any] = [
            "name": txtName.text!,
            "email": txtEmail.text!,
            "phone": txtMobileNumber.text!,
        ]
        
        Analytics.shared().identify(txtIdentity.text!, traits: traits)
        Analytics.shared().track("segmentios1", properties: ["eventProperty":"eventPropertyValue"])
        
    }
    
}

