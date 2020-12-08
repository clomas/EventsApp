//
//  CoreDataManager.swift
//  EventsApp
//
//  Created by Clint Thomas on 7/12/20.
//

import CoreData
import UIKit

final class CoreDataManager {

    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventsApp")
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()

    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext // main context
    }

    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: managedObjectContext)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")

        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }

    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try managedObjectContext.fetch(fetchRequest)
            return events
        } catch {
            print(error)
            return []
        }
    }
}
