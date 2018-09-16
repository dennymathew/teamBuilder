//
//  ProfileListViewController.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 9/14/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

// MARK: - Properties and Overrides
class ProfileListViewController: TBViewController {

    @IBOutlet weak var tblProfiles: UITableView!
    let manager = ProfileManager()
    var profiles = [Profile]()
}

// MARK: - Life Cycle
extension ProfileListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateTable()
    }
}

// MARK: - Handlers
extension ProfileListViewController {
    
    private func populateTable() {
        manager.fetchProfiles()
    }
}

// MARK: - TableView Data Source and Delegates
extension ProfileListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        cell.textLabel?.text = "Sample Text"
        return cell
    }
}
