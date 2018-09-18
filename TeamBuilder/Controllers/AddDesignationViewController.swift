//
//  AddDesignationViewController.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

// MARK: - Properties and Overrides
class AddDesignationViewController: TBViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var btnThumbnail: TBButton!
    @IBOutlet weak var tfTitle: TBTextField!
    @IBOutlet weak var btnSubmit: TBButton!
    
    @IBAction func actThumbnail(_ sender: TBButton) {
        Logger.log("Should show image browser!")
    }
    
    @IBAction func actSubmit(_ sender: TBButton) {
        handleSubmission()
    }

    let manager = DesignationManager()
}

// MARK: - Life Cycle
extension AddDesignationViewController: KeyboardSpy {
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

// MARK: - Handlers
extension AddDesignationViewController {
    
    private func handleSubmission() {

        let designation = DesignationModel.init(id: Int32(AppSettings.lastSavedDesignationId + 1),
                                   title: tfTitle.text ?? "")

        manager.saveDesignation(designation)
        self.navigationController?.popViewController(animated: true)
        
    }
}