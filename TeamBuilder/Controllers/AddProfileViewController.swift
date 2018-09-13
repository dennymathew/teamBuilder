//
//  AddProfileViewController.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

// MARK: - Properties and Overrides
class AddProfileViewController: TBViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tfFirstName: TBTextField!
    @IBOutlet weak var tfLastName: TBTextField!
    @IBOutlet weak var tfDesignation: TBTextField!
    @IBOutlet weak var tfTechnologyOne: TBTextField!
    @IBOutlet weak var tfTechnologyTwo: TBTextField!
    @IBOutlet weak var tfTechnologyThree: TBTextField!
    @IBOutlet weak var btnSubmit: TBButton!
    @IBOutlet weak var btnProfileImage: TBButton!
    
    @IBAction func actProfileImage(_ sender: TBButton) {
        Logger.log("Should show image browser!")
    }
    
    @IBAction func actSubmit(_ sender: TBButton) {
        Logger.log("Should Save to Core Data!")
    }
}

// MARK: - Life Cycle
extension AddProfileViewController: KeyboardSpy {
    var container: UIView {
        return self.scrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardNotifications(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardNotifications(false)
    }
}
