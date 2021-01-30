//
//  EventDetailViewModel.swift
//  EventsApp
//
//  Created by Clint Thomas on 23/12/20.
//

import CoreData
import UIKit

final class EventDetailViewModel {

    private let eventID: NSManagedObjectID
    private let eventService: EventServiceProtocol
    private var event: Event?
    let date = Date()
    var onUpdate = {}
    var coordinator: EventDetailCoordinator?

    var image: UIImage? {
        guard let image = event?.image else { return nil }
        return UIImage(data: image)
    }

    var timeRemainingViewModel: TimeRemainingViewModel? {
        guard let eventDate = event?.date, let timeRemainingParts = date.timeRemaining(until: eventDate)?.components(separatedBy: ",") else { return nil }

        return TimeRemainingViewModel (
            timeRemainingParts: timeRemainingParts,
            mode: .detail
        )
    }

    init(eventID: NSManagedObjectID, eventService: EventServiceProtocol = EventService()) {
        self.eventID = eventID
        self.eventService = eventService
    }

    func viewDidLoad() {
        reload()
    }

    func viewDidDissapear() {
        coordinator?.didFinish()
    }

    func reload() {
        event = eventService.getEvent(eventID)
        onUpdate()
    }

    @objc func editButtonTapped() {
        guard let event = event else { return }
        coordinator?.onEditEvent(event: event)
    }
}
