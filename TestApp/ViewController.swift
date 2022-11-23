//
//  ViewController.swift
//  TestApp
//
//  Created by Ponkumar's Mac on 23/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var versionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
              versionLabel.text = "Version: \(version)"
        }
    }

}

