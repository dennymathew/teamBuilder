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
    
    //Properties
    @IBOutlet weak var scHeaders: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cvProfile: UIView!
    @IBOutlet weak var cvTechnologies: UIView!
    @IBOutlet weak var cvDesignation: UIView!
    
    //Actions
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
        switch index {
        case 0:
            scrollView.setContentOffset(CGPoint(x: cvProfile.frame.minX, y: cvProfile.frame.minY), animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: cvTechnologies.frame.minX, y: cvTechnologies.frame.minY), animated: true)
        case 2:
            scrollView.setContentOffset(CGPoint(x: cvDesignation.frame.minX, y: cvDesignation.frame.minY), animated: true)
        default:
            break
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView.contentOffset.x {
        case 0..<cvProfile.frame.maxX:
            scHeaders.selectedSegmentIndex = 0
        case cvProfile.frame.maxX..<cvTechnologies.frame.maxX:
            scHeaders.selectedSegmentIndex = 1
        case cvTechnologies.frame.maxX..<cvDesignation.frame.maxX:
            scHeaders.selectedSegmentIndex = 2
        default:
            break
        }
    }
}
