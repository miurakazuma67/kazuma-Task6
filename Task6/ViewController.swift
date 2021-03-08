//
//  ViewController.swift
//  Task6
//
//  Created by 三浦　一真 on 2021/03/03.
//

import UIKit

class ViewController: UIViewController {
    var num: Int = 0
    var sliderValue: Int = 0
    private var alertController: UIAlertController!
    
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random()
    }
    
    @IBAction func sliderValue(_ sender: UISlider) {
        sliderValue = Int(sender.value)
    }
    
    func random() {
        num = Int(arc4random_uniform(100) + 1)
        label.text = String(num)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if num != sliderValue {
            let alert1 =
                UIAlertController(title: "結果",
                                  message: """
              はずれ！
              あなたの値: \(sliderValue)
            """,preferredStyle: .alert)
            let defaultAction1: UIAlertAction = UIAlertAction(title: "再挑戦", style: .default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                self.random()
            })
            alert1.addAction(defaultAction1)
            present(alert1, animated: true, completion: nil)
        }
        
        if num == sliderValue {
            let alert2 =
                UIAlertController(title: "結果",
                                  message: """
              あたり！
              あなたの値: \(sliderValue)
            """,preferredStyle: .alert)
            let defaultAction2: UIAlertAction = UIAlertAction(title: "再挑戦", style: .default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                self.random()
            })
            alert2.addAction(defaultAction2)
            present(alert2, animated: true, completion: nil)
        }
    }
}
