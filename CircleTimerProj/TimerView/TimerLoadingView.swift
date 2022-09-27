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
        private enum Constants {
            /// needs to turn progress layer in counterclock-wise
            static let progressLayerRotate = CATransform3DMakeRotation(
                CGFloat(90 * Double.pi / 180),
                .zero,
                .zero,
                -1)
        }

        // MARK: - Configuration

        struct Configuration {
            let lineWidth: CGFloat
            let backgroundColor: UIColor
            let progressColor: UIColor
            let lineCap: CAShapeLayerLineCap = .round
        }

        // MARK: - Public Properties

        var progress: CGFloat = .zero {
            didSet {
                setNeedsDisplay()
            }
        }

        // MARK: - Private Properties

        private let progressLayer: CAShapeLayer = .init()
        private let backgroundLayer: CAShapeLayer = .init()

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

        override func draw(_ rect: CGRect) {
            let lineWidth = configuration?.lineWidth ?? .zero
            let rect: CGRect = rect.insetBy(dx: lineWidth, dy: lineWidth)
            let circlePath: UIBezierPath = .init(ovalIn: rect)
            backgroundLayer.path = circlePath.cgPath

            progressLayer.path = circlePath.cgPath
            progressLayer.strokeStart = .zero
            progressLayer.strokeEnd = progress
        }

        func apply(_ configuration: Configuration) {
            self.configuration = configuration

            backgroundColor = configuration.backgroundColor

            let lineWidth = configuration.lineWidth + configuration.lineWidth
            backgroundLayer.lineWidth = lineWidth
            backgroundLayer.strokeColor = configuration.backgroundColor.cgColor

            progressLayer.lineWidth = lineWidth
            progressLayer.strokeColor = configuration.progressColor.cgColor
            progressLayer.lineCap = configuration.lineCap

            setNeedsDisplay()
        }
    }
}

// MARK: - Private Methods

private extension View {
    func setup() {
        configureSublayers()
    }

    func configureSublayers() {
        backgroundLayer.fillColor = UIColor.clear.cgColor
        layer.mask = backgroundLayer

        progressLayer.fillColor = nil
        layer.addSublayer(progressLayer)
        layer.transform = Constants.progressLayerRotate
    }
}
