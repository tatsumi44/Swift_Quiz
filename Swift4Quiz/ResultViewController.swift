//
//  ResultViewController.swift
//  Swift4Quiz
//
//  Created by tatsumi kentaro on 2018/02/05.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultView: UILabel!
    
    var num: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.text = String(num)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.presentingViewController?
        .dismiss(animated: true, completion: nil)
    }
    
   
}
