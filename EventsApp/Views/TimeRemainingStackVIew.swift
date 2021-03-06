//
//  TimeRemainingStackVIew.swift
//  EventsApp
//
//  Created by Clint Thomas on 27/12/20.
//

import UIKit

final class TimeRemainingStackView: UIStackView {
    private let timeRemainingLabels = [UILabel(), UILabel(), UILabel(), UILabel()]

    func setup() {
        timeRemainingLabels.forEach {
            addArrangedSubview($0)
        }
        axis = .vertical
        // fixes my layout problem
        translatesAutoresizingMaskIntoConstraints = false
    }

    func update(with viewModel: TimeRemainingViewModel) {

        timeRemainingLabels.forEach {
            $0.text = ""
            $0.font = .systemFont(ofSize: viewModel.fontSize, weight: .medium)
            $0.textColor = .white
        }

        viewModel.timeRemainingParts.enumerated().forEach {
            timeRemainingLabels[$0.offset].text = $0.element
        }

        alignment = viewModel.alignment
    }
}
