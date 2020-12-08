//
//  AddEventCoordinator.swift
//  EventsApp
//
//  Created by Clint Thomas on 7/12/20.
//

import UIKit

final class AddEventCoordinator: Coordinator {

    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var parentCoordinator: EventListCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let addEventViewController: AddEventViewController = .instantiate()
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(addEventViewController, animated: true, completion: nil)
        // Create add event VC
        // create add event VIEWMODEL
        // present modal controller using nav controller.
    }

    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit{
        print("Deinnit from add event coord.")
    }
}
