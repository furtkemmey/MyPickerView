//
//  ViewController.swift
//  MyPickerView
//
//  Created by KaiChieh on 13/02/2018.
//  Copyright © 2018 KaiChieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let fromList = ["Not select", "台北松山", "桃園", "高雄小港"]
    let toList = ["Not select", "上海浦東", "香港赤臘角", "日本成田"]
    //MARK: - IBOutlet
    @IBOutlet weak var MypickerView: UIPickerView!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        MypickerView.dataSource = self
        MypickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return fromList.count
        case 1:
            return toList.count
        default:
            return 0
        }
    }

    //MARK: - UIPickerViewDelegate
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch component {
//        case 0:
//            return fromList[row]
//        case 1:
//            return toList[row]
//        default:
//            return "Not set"
//        }
//    }
    var selectedFromIndex: Int! = 0
    var selectedToIndex: Int! = 0
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch component {
        case 0:
            selectedFromIndex = row
//            pickerView.selectRow(2, inComponent: 1, animated: true)
            print("from: \(fromList[row])")
        case 1:
            selectedToIndex = row
            print("to: \(toList[row])")
        default:
            print("Not set")
        }
        let alert = UIAlertController(title: "Selected", message: "from \(fromList[selectedFromIndex]), to \(toList[selectedToIndex])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
        self.show(alert, sender: nil)
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: (pickerView.frame.width / 2) - 20 , height: 75))

        switch component {
        case 0:
            myLabel.text = fromList[row]
        case 1:
            myLabel.text = toList[row]
        default:
            myLabel.text = "Not set"
        }
        myLabel.font = UIFont.systemFont(ofSize: 30)
        myLabel.textAlignment = .left
        myLabel.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0)
        myLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        return myLabel
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
}

