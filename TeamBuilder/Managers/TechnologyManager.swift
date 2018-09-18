//
//  TechnologyManager.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit
import CoreData

class TechnologyManager: NSObject {
    
    func saveTechnology(_ technologyModel: TechnologyModel) {

        Logger.log("Should save to core data!")

        let technology = Technology(context: PersistenceService.context)
        technology.id = technologyModel.id
        technology.title = technologyModel.title

        //Save Context
        PersistenceService.saveContext()
    }
    
    func fetchTechnologies(_ completion: @escaping ([Technology]?, TBError?) -> Void) {
        
        let fetchRequest: NSFetchRequest<Technology> = Technology.fetchRequest()
        var technologies = [Technology]()
        
        do {
            technologies = try PersistenceService.context.fetch(fetchRequest)
            completion(technologies, nil)
        } catch {
            completion(nil, TBError.coreDataRetrievingError)
        }
    }
}
