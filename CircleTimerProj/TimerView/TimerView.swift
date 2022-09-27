//
//  TimerView.swift
//  CircleTimerProj
//
//  Created by Vyacheslav on 27.09.2022.
//

import UIKit
import SnapKit

private typealias View = TimerView

class TimerView: UIView {
    private lazy var loadingView: LoadingView = .init()

    private lazy var countLabel: UILabel = build {
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.numberOfLines = 1
        $0.text = "10"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }
}

// MARK: - Private Methods

private extension View {
    func setup() {
        configureSubviews()
        configureConstraints()

        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
    }

    func configureSubviews() {
        addSubview(loadingView)
        addSubview(countLabel)
    }

    func configureConstraints() {
        loadingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        countLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
