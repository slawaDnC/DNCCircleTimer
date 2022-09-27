//
//  ViewController.swift
//  CircleTimerProj
//
//  Created by Vyacheslav on 27.09.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var timerView: TimerView = .init(configuration: .default)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        view.addSubview(timerView)
        timerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(80)
        }

        startTimer()
    }
    private func startTimer() {
        timerView.startTimer(initialValue: 50)
        timerView.onTimerEnded = {
            debugPrint("timer ended")
        }
        Task {
            try await Task.sleep(nanoseconds: 5_000_000_000)
            timerView.addAccelerationToTimer(with: 0.5)

            try await Task.sleep(nanoseconds: 5_000_000_000)
            timerView.addAccelerationToTimer(with: 0.5)

            try await Task.sleep(nanoseconds: 5_000_000_000)
            timerView.addAccelerationToTimer(with: 0.5)

            try await Task.sleep(nanoseconds: 5_000_000_000)
            timerView.addAccelerationToTimer(with: 0.5)
        }
    }
}
