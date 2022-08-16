//
//  ResultViewController.swift
//  TempConverter
//
//  Created by valters.steinblums on 16/08/2022.
//

import UIKit

class ResultViewController: UIViewController {

    var whatTempConvertedToWhat:String = ""
    var convertedTemp:String = ""
    
    @IBOutlet weak var whatTempConvertedLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        whatTempConvertedLabel.text = whatTempConvertedToWhat
    }

}
