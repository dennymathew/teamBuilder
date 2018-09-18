//
//  ProfileManager.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit
import CoreData

class ProfileManager: NSObject {
    
    func saveProfile(_ profileModel: ProfileModel) {

        Logger.log("Should save to core data!")

        let profile = Profile(context: PersistenceService.context)
        profile.id = profileModel.id
        profile.firstName = profileModel.firstName
        profile.lastName = profileModel.lastName

        for technology in profileModel.technologies {
            let tech = Technology(context: PersistenceService.context)
            tech.id = technology.id
            tech.title = technology.title
            profile.addToTechnology(tech)
        }

        let designation = Designation(context: PersistenceService.context)
        designation.id = profileModel.designation.id
        designation.title = profileModel.designation.title
        profile.designation = designation

        //Save Context
        PersistenceService.saveContext()
    }
    
    func fetchProfiles(_ completion: @escaping ([Profile]?, TBError?) -> Void) {
        
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        var profiles = [Profile]()
        
        do {
            profiles = try PersistenceService.context.fetch(fetchRequest)
            completion(profiles, nil)
        } catch {
            completion(nil, TBError.coreDataRetrievingError)
        }
    }

    var designation: DesignationModel {
        return DesignationModel.init(id: 0, title: "Software Engineer")
    }

    var technologies: [TechnologyModel] {
        return [
            TechnologyModel.init(id: 1, title: "Angular"),
            TechnologyModel.init(id: 1, title: "iOS"),
            TechnologyModel.init(id: 1, title: "Android")
        ]
    }
}
