//
//  DashboardViewController.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 15/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit

// MARK: - Properties and overrides
class DashboardViewController: TBViewController {

    enum HeaderSection: Int {
        case profiles = 0
        case technologies
        case designations
    }
    
    //Properties
    @IBOutlet weak var scHeaders: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cvProfile: UIView!
    @IBOutlet weak var cvTechnologies: UIView!
    @IBOutlet weak var cvDesignation: UIView!

    var selectedHeader = HeaderSection.profiles {
        didSet {
            scHeaders.selectedSegmentIndex = selectedHeader.rawValue
        }
    }
    
    //Actions
    @IBAction func actAdd(_ sender: UIBarButtonItem) {
        handleAddAction()
    }
    @IBAction func actHeaderChange(_ sender: UISegmentedControl) {
        handleSegmentChange(to: sender.selectedSegmentIndex)
    }
}

// MARK: - Life Cycle
extension DashboardViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Handlers
extension DashboardViewController: UIScrollViewDelegate {
    
    private func handleSegmentChange(to index: Int) {

        selectedHeader = HeaderSection(rawValue: index) ?? .profiles

        switch selectedHeader {
        case .profiles:
            scrollView.setContentOffset(CGPoint(x: cvProfile.frame.minX, y: cvProfile.frame.minY), animated: true)
        case .technologies:
            scrollView.setContentOffset(CGPoint(x: cvTechnologies.frame.minX, y: cvTechnologies.frame.minY), animated: true)
        case .designations:
            scrollView.setContentOffset(CGPoint(x: cvDesignation.frame.minX, y: cvDesignation.frame.minY), animated: true)
        default:
            break
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView.contentOffset.x {
        case 0..<cvProfile.frame.maxX:
            selectedHeader = .profiles
        case cvProfile.frame.maxX..<cvTechnologies.frame.maxX:
            selectedHeader = .technologies
        case cvTechnologies.frame.maxX..<cvDesignation.frame.maxX:
            selectedHeader = .designations
        default:
            break
        }
    }

    private func handleAddAction() {

        switch selectedHeader {
        case .profiles:
            showAddProfileViewController()
        case .technologies:
            showAddTechnologyViewController()
        case .designations:
            showAddDesignationViewController()
        }
    }

    private func showAddProfileViewController() {
        performSegue(withIdentifier: "showAddProfile", sender: self)
    }

    private func showAddTechnologyViewController() {
        performSegue(withIdentifier: "showAddTechnology", sender: self)
    }

    private func showAddDesignationViewController() {
        performSegue(withIdentifier: "showAddDesignation", sender: self)
    }
}
