//
//  ViewController.swift
//  Counter
//
//  Created by Mac on 2023-11-11.
//
import Foundation
import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var pressButton: UIButton!
    @IBOutlet weak var textLableCount: UILabel!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var changeView: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func getDate() -> String{
        let getDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let qwe = dateFormatter.string(from: getDate)
        return qwe
    }
    var count = 0{
        didSet{
            if count < 0 {
                count = 0
            }
        }
    }
    var updateTextView:String = """
История изменений:

"""
    @IBAction func pressButton(_ sender: Any) {
        if count >= 0{
            count += 1
        }
            textLableCount.text = "Значение счётчика: \(count)"
        changeView.text = updateTextView
        }
    
    @IBAction func redButton(_ sender: Any) {
        count += 1
        textLableCount.text = "Значение счётчика: \(count)"
        updateTextView += """
\(getDate())
Значение изменено на +1

"""
        changeView.text = updateTextView
    }
    @IBAction func blueButton(_ sender: Any) {
        if count == 0{
            updateTextView += """
    \(getDate())
    Попытка уменьшить значение счётчика ниже 0
    
    """
        }else{
            count -= 1
            textLableCount.text = "Значение счётчика: \(count)"
            updateTextView += """
        \(getDate())
        Значение изменено на -1
        
        """
            
        }
        changeView.text = updateTextView
    }
    @IBAction func resetButton(_ sender: Any) {
        count = 0
        textLableCount.text = "Значение счётчика: \(count)"
        updateTextView += """
\(getDate())
Значение сброшено

"""
        changeView.text = updateTextView
    }

}

