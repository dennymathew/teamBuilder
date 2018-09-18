//
//  TechnologyListViewController.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 9/14/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

// MARK: - Properties and Overrides
class TechnologyListViewController: TBViewController {

    @IBOutlet weak var tblTechnologies: UITableView!
    let manager = TechnologyManager()
    var technologies = [Technology]()
}

// MARK: - Life Cycle
extension TechnologyListViewController {

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
extension TechnologyListViewController {

    private func setupTableView() {
        tblTechnologies.register(UINib(nibName: "TBTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "technologyCell")

    }
    
    private func populateTable() {
        manager.fetchTechnologies { (technologies, error) in

            //Error?
            if error != nil {
                Logger.log("Error: \(String(describing: error?.localizedDescription))")
            }

            guard let technologies = technologies else { return }

            //Success?
            self.technologies = technologies
            DispatchQueue.main.async {
                self.tblTechnologies.reloadData()
            }
        }
    }
}

// MARK: - TableView Data Source and Delegates
extension TechnologyListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return technologies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "technologyCell", for: indexPath) as? TBTableViewCell else { fatalError() }

        let technology = technologies[indexPath.row]
        cell.lblTitle.text = technology.title
        cell.lblSubtitle.text = ""
        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
