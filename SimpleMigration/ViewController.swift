//
//  ViewController.swift
//  SimpleMigration
//
//  Created by Mazharul Huq on 3/7/18.
//  Copyright © 2018 Mazharul Huq. All rights reserved.
//
/***************************************************************
 The code here and the data model are in the final stage. To start
 from the beginning proceed as follows:
 1. Delete the entity Address from the data model. Also delete the
    attributes lastName and age from Person and leftover
    relationship.
 2. Comment out code in //3 and uncomment the code in //1
 3. Run the app and check the sql file to check the entered record
 
 4. Add the attributes lastName and age to Person. Make sure age
    has a default value and made non-optional
 5. Comment code in //1 and uncomment code in //2
 6. Run the app and check sql file for migration and creation
    of a new record.
 
 7. Add the entity Address with attribute street of type String
    Create a to-one relationship between Person and Address
 8. Comment code in //2 and uncomment code in //3
 9. Run the app and check sql file. Note that now there are two
    tables for the two entities.
 
 You can play with modifying the data model in other ways and
 adding codes
 ***************************************************************/

import UIKit
import CoreData

class ViewController: UIViewController {
    
    lazy var coreDataStack = CoreDataStack(modelName: "PersonList")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    print(self.coreDataStack.storeContainer.persistentStoreDescriptions)
        //Create an instance of Person
        let person = Person(context: self.coreDataStack.managedContext)
        //1
        /*
        person.firstName = "John"
        */
        
        //2
        /*
        person.firstName = "Bob"
        person.lastName = "Miller"
        person.age = 25
        */
        //3
        
        person.firstName = "Henry"
        person.lastName = "Higgins"
        person.age = 75
        let address = Address(context: self.coreDataStack.managedContext)
        address.street = "45 Mulberry Lane"
        person.address = address
        
        //Save changes to store
        self.coreDataStack.saveContext()
    }
}
