//
//  ViewController.swift
//  Task6
//
//  Created by 三浦　一真 on 2021/03/03.
//

import UIKit

class ViewController: UIViewController {
    private var answer = 0

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        random()
    }
    
    private func random() {
        answer = Int(arc4random_uniform(100) + 1)
        label.text = String(answer)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let sliderValue = Int(slider.value)

        let firstLine: String
        if answer == sliderValue {
            firstLine = "あたり！"
        } else {
            firstLine = "はずれ！"
        }
        
        let alert = UIAlertController(
            title: "結果",
            message: "\(firstLine)\nあなたの値: \(sliderValue)",
            preferredStyle: .alert
        )

        let retryAction = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: { [weak self] _ in
                // ボタンが押された時の処理を書く（クロージャ実装）
                self?.random()
            }
        )
        alert.addAction(retryAction)

        present(alert, animated: true, completion: nil)
    }
}
