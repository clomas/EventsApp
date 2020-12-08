//
//  AddEventViewModel.swift
//  EventsApp
//
//  Created by Clint Thomas on 7/12/20.
//

import Foundation
import UIKit


final class AddEventViewModel {

    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }

    var coordinator: AddEventCoordinator?

    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }

    deinit{
        print("YEAH DEINNIT")
    }
}


final class TitleSubtitleCellViewModel {
    let title: String
    private(set) var subtitle: String
    let placeholder: String

    init(title: String, subtitle: String, placeholder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
}

final class TitleSubtitleCell: UITableViewCell {
    let titleLabel = UILabel()
    let subtitleTextField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {

    }

    private func setupHierarchy() {

    }

    private func setupLayout() {

    }
}
