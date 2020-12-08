//
//  EventListViewModel.swift
//  EventsApp
//
//  Created by Clint Thomas on 7/12/20.
//

import Foundation

final class EventListViewModel {

    let title = "Event"
    var coordinator: EventListCoordinator?

    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
}
