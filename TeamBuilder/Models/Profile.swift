//
//  Profile.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import Foundation

struct ProfileModel {
    let id: Int32
    let firstName: String
    let lastName: String
    let designation: DesignationModel
    let technologies: [TechnologyModel]
}
