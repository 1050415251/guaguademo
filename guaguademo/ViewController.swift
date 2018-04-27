//
//  ViewController.swift
//  guaguademo
//
//  Created by 国投 on 2018/4/26.
//  Copyright © 2018年 FlyKite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.

       


        let gua = GuaguaView.init(frame: CGRect.init(x: 80, y: 200, width: 300, height: 300))

        self.view.addSubview(gua)



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

