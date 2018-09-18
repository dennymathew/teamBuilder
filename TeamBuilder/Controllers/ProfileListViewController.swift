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
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        populateTable()
    }
}

// MARK: - Handlers
extension ProfileListViewController {

    private func setupTableView() {
        tblProfiles.register(UINib(nibName: "TBTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "profileCell")

    }
    
    private func populateTable() {
        manager.fetchProfiles { (profiles, error) in

            //Error?
            if error != nil {
                Logger.log("Error: \(String(describing: error?.localizedDescription))")
            }

            guard let profiles = profiles else { return }

            //Success?
            self.profiles = profiles
            DispatchQueue.main.async {
                self.tblProfiles.reloadData()
            }
        }
    }
}

// MARK: - TableView Data Source and Delegates
extension ProfileListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? TBTableViewCell else { fatalError() }

        let profile = profiles[indexPath.row]
        cell.lblTitle.text = (profile.firstName ?? "") + " " + (profile.lastName ?? "")
        cell.lblSubtitle.text = profile.designation?.title
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
