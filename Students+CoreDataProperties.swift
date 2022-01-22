//
//  Students+CoreDataProperties.swift
//  Enes
//
//  Created by ihlas on 21.01.2022.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var name: String?
    @NSManaged public var school: String?
    @NSManaged public var std: String?

}

extension Students : Identifiable {

}
