//
//  ViewController.swift
//  CircleTimerProj
//
//  Created by Vyacheslav on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var timerView: TimerView = .init(configuration: .default)
    private lazy var slider: UISlider = build {
        $0.minimumValue = .zero
        $0.maximumValue = 1
        $0.value = .zero
        $0.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        view.addSubview(timerView)
        view.addSubview(slider)
        timerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(80)
        }
        slider.snp.makeConstraints {
            $0.centerX.equalTo(timerView)
            $0.top.equalTo(timerView.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }

    @objc private func sliderValueChanged(_ sender: UISlider) {
        debugPrint(sender.value)
        timerView.progress = CGFloat(sender.value)
    }
}
