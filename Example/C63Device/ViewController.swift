//
//  ViewController.swift
//  C63Device
//
//  Created by HippieFox on 10/23/2023.
//  Copyright (c) 2023 HippieFox. All rights reserved.
//

import UIKit
import C63Device

class ViewController: UIViewController {
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("go", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(tapGo), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(button)
        button.frame.size = .init(width: 100, height: 100)
        button.center = self.view.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func tapGo() {
        C63DeviceOrientation.rotateToggle()
    }
}
