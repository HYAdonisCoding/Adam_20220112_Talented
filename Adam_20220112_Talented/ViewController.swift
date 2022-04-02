//
//  ViewController.swift
//  Adam_20220112_Talented
//
//  Created by Adam on 2022/1/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .orange
        
        // 简写
        exec(v1: 1, v2: 2, fn: {$0 + $1})
        exec(v1: 1, v2: 2, fn: +)
    }


    func exec(v1: Int, v2: Int, fn: (Int, Int) -> Int) {
        print(fn(v1, v2))
    }
    
    
    
}

