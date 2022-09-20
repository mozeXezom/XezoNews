//
//  WeatherViewController.swift
//  XezoNews
//
//  Created by mozeX on 02.09.2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var delegate: sendDataToVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
