//
//  ViewController.swift
//  Sample-SVProgressHUD
//
//  Created by NishiokaKohei on 2017/09/18.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit
import Foundation
import SVProgressHUD

class ViewController: UIViewController {

    private var progress: SVProgressHUD?

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: - Setup
        let position = view.center
        let frame = CGRect(x: position.x, y: position.y, width: 100.0, height: 50.0)
        progress = SVProgressHUD(frame: frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - IBActions

    @IBAction func willBeginSomething(_ sender: UIButton) {
        // TODO: Event
        SVProgressHUD.show()
    }

    @IBAction func willFinishSomething(_ sender: UIButton) {
        // TODO: Event
    }


}

