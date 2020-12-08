//
//  AddEventViewController.swift
//  EventsApp
//
//  Created by Clint Thomas on 7/12/20.
//

import UIKit

class AddEventViewController: UIViewController {

    var viewModel: AddEventViewModel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}
