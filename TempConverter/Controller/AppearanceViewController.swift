//
//  AppearanceViewController.swift
//  TempConverter
//
//  Created by valters.steinblums on 10/08/2022.
//

import UIKit

class AppearanceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openSettingsTapped(_ sender: Any) {
        openSettings()
    }
    
    func setLabelText() {
        var text = "Unable to specify UI style"
        
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark mode is ON"
        } else {
            text = "Light mode is ON"
        }
        
        textLabel.text = text
    }
    
    func openSettings() {
        guard let settingURL = URL(string: UIApplication.openSettingsURLString) else {return}
        
        if UIApplication.shared.canOpenURL(settingURL) {
            UIApplication.shared.open(settingURL, options: [:]) {success in
                print("success", success)
            }
        }
    }

}

extension AppearanceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
