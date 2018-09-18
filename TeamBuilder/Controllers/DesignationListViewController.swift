//
//  DesignationListViewController.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 9/14/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

// MARK: - Properties and Overrides
class DesignationListViewController: TBViewController {

    @IBOutlet weak var tblDesignations: UITableView!
    let manager = DesignationManager()
    var designations = [Designation]()
}

// MARK: - Life Cycle
extension DesignationListViewController {

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
extension DesignationListViewController {

    private func setupTableView() {
        tblDesignations.register(UINib(nibName: "TBTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "designationCell")

    }
    
    private func populateTable() {
        manager.fetchDesignations { (designations, error) in

            //Error?
            if error != nil {
                Logger.log("Error: \(String(describing: error?.localizedDescription))")
            }

            guard let designations = designations else { return }

            //Success?
            self.designations = designations
            DispatchQueue.main.async {
                self.tblDesignations.reloadData()
            }
        }
    }
}

// MARK: - TableView Data Source and Delegates
extension DesignationListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return designations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "designationCell", for: indexPath) as? TBTableViewCell else { fatalError() }

        let designation = designations[indexPath.row]
        cell.lblTitle.text = designation.title
        cell.lblSubtitle.text = ""
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
