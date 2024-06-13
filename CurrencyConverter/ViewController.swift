//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sümeyra Demirtaş on 13.06.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        // 1 - Request & Session
        // 2 - Response & Data
        // 3 - Parsing / Json Serialization
        
        
        //1
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=ed121cfb76d9a9f487fdd94fe30943d2")
        
        let session = URLSession.shared
        
        //closure
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                //2
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        // ASYNC
                        
                        DispatchQueue.main.async {
                            print(jsonResponse)
                        }
                        
                        
                    } catch {
                        print("Error!")
                    }
                    
                }
            }
        }
        
        task.resume() // dont forget to add this
        
    }
    
}

