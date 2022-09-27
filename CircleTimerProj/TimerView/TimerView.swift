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
    // MARK: - Configuration
    
    struct Configuration {
        let font: UIFont
        let textColor: UIColor
        let loadingConfiguration: LoadingView.Configuration

        static let `default`: Configuration = .init(
            font: .systemFont(ofSize: 25, weight: .bold),
            textColor: .white,
            loadingConfiguration: .init(lineWidth: 5, backgroundColor: .gray, progressColor: .white))
    }

    // MARK: - Private UI

    private lazy var loadingView: LoadingView = .init()
    private lazy var countLabel: UILabel = build {
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.numberOfLines = 1
        $0.text = "10"
    }

    // MARK: - Public Properties

    var progress: CGFloat {
        get {
            loadingView.progress
        }
        set {
            loadingView.progress = newValue
        }
    }

    // MARK: - Private Properties

    private var configuration: Configuration?

    // MARK: - Inits

    convenience init(configuration: Configuration) {
        self.init(frame: .zero)

        apply(configuration)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    func apply(_ configuration: Configuration) {
        self.configuration = configuration

        countLabel.font = configuration.font
        countLabel.textColor = configuration.textColor
        loadingView.apply(configuration.loadingConfiguration)

        setNeedsDisplay()
    }
}

// MARK: - Private Methods

private extension View {
    func setup() {
        configureSubviews()
        configureConstraints()
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
