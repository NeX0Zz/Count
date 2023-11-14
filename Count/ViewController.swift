import Foundation
import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak private var pressButton: UIButton!
    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var blueButton: UIButton!
    @IBOutlet weak private var redButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var changeView: UITextView!
    
    private func getDate() -> String{
        let getDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let qwe = dateFormatter.string(from: getDate)
        return qwe
    }
    private var count = 0{
        didSet{
            if count < 0 {
                count = 0
            }
        }
    }
    private var updateTextView:String = """
История изменений:

"""
    @IBAction func pressButton(_ sender: Any) {
        if count >= 0{
            count += 1
        }
        countLabel.text = "Значение счётчика: \(count)"
        changeView.text = updateTextView
    }
    
    @IBAction func didTapRedButton(_ sender: Any) {
        count += 1
        countLabel.text = "Значение счётчика: \(count)"
        updateTextView += """
\(getDate())
Значение изменено на +1

"""
        changeView.text = updateTextView
    }
    @IBAction func didTapBlueButton(_ sender: Any) {
        if count == 0{
            updateTextView += """
    \(getDate())
    Попытка уменьшить значение счётчика ниже 0
    
    """
        }else{
            count -= 1
            countLabel.text = "Значение счётчика: \(count)"
            updateTextView += """
        \(getDate())
        Значение изменено на -1
        
        """
            
        }
        changeView.text = updateTextView
    }
    @IBAction func didTapResetButton(_ sender: Any) {
        count = 0
        countLabel.text = "Значение счётчика: \(count)"
        updateTextView += """
\(getDate())
Значение сброшено

"""
        changeView.text = updateTextView
    }
    
}

