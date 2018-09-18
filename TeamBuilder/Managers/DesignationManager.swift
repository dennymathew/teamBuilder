//
//  DesignationManager.swift
//  TeamBuilder
//
//  Created by Denny Mathew on 13/09/18.
//  Copyright © 2018 denmathew. All rights reserved.
//

import UIKit
import CoreData

class DesignationManager: NSObject {
    
    func saveDesignation(_ designationModel: DesignationModel) {

        Logger.log("Should save to core data!")

        let designation = Designation(context: PersistenceService.context)
        designation.id = designationModel.id
        designation.title = designationModel.title

        //Save Context
        PersistenceService.saveContext()
    }
    
    func fetchDesignations(_ completion: @escaping ([Designation]?, TBError?) -> Void) {
        
        let fetchRequest: NSFetchRequest<Designation> = Designation.fetchRequest()
        var designations = [Designation]()
        
        do {
            designations = try PersistenceService.context.fetch(fetchRequest)
            completion(designations, nil)
        } catch {
            completion(nil, TBError.coreDataRetrievingError)
        }
    }
}
