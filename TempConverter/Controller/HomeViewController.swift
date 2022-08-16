//
//  ViewController.swift
//  TempConverter
//
//  Created by valters.steinblums on 10/08/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var celsiumLabel: UILabel!
    @IBOutlet weak var convertedLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider! {
        didSet {
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
            tempSlider.value = 0
        }
    }
    
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedLabel.text = "32 ºF"
    }
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
//        update
        print("slider value:", tempSlider.value)
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
//        update
        updateTempLabelForSlider(value: tempSlider.value)
    }
    
    func updateTempLabelForSlider(value: Float) {
        let celsiusTemp = Int(value)
        celsiumLabel.text = "\(celsiusTemp) ºC"
        
        var convertedTempString = ""
        switch tempSegmentControl.selectedSegmentIndex {
        case 0:
            let farenheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).farenheit)
            convertedTempString = farenheitTempString + " ºF"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
            convertedTempString = kelvinTempString + " ºK"
        }
        convertedLabel.text = convertedTempString
    }
    
    func convertTempFrom(celsius: Int) -> (farenheit: Double, kelvin: Double) {
        let farenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        
        return (farenheit, kelvin)
    }
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "convertedViewID" {
                guard let vc = segue.destination as? ResultViewController else {return}
                vc.whatTempConvertedToWhat = "\(celsiumLabel.text ?? "No data") = \(convertedLabel.text ?? "No data")"
            }
        }
    

}

