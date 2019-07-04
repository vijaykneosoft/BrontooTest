//
//  FirstViewController.swift
//  BrontooTest
//
//  Created by Webwerks on 03/07/19.
//  Copyright © 2019 Webwerks. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var dataMessage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addObserver()
    }
    
    // Adding observer on view
    private func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.getData(_:)),
                                               name: .dataMessage,
                                               object: nil)
    }
    
    // Getting data from next screen
    @objc private func getData(_ notification: NSNotification) {
        let userData = notification.userInfo
        dataMessage = userData?["msg"] as? String
        
        let alert = UIAlertController(title: "Alert", message: dataMessage!, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okay)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    
}
