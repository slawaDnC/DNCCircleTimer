//
//  TimerLoadingView.swift
//  CircleTimerProj
//
//  Created by Vyacheslav on 27.09.2022.
//

import UIKit
import SnapKit

private typealias View = TimerView.LoadingView

extension TimerView {
    class LoadingView: UIView {
        override init(frame: CGRect) {
            super.init(frame: frame)

            setup()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)

            setup()
        }
    }
}

// MARK: - Private Methods

private extension View {
    func setup() {
        configureSubviews()
        configureConstraints()
    }

    func configureSubviews() {
    }

    func configureConstraints() {
    }
}
