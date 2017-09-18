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

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - IBActions

    ///
    /// Display Status: ステータス表示あり
    ///
    @IBAction func willBeginSomething(_ sender: UIButton) {
        // ステータス表示あり
        SVProgressHUD.show(withStatus: "processing ...")

        // ３秒後に閉じる
        let t = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.global(qos: .default).asyncAfter(deadline: t) {
            SVProgressHUD.dismiss()
        }
    }

    ///
    /// No Status: ステータス表示なし
    ///
    @IBAction func willBeginSomethingWithStatus(_ sender: UIButton) {
        // ステータス表示なし
        SVProgressHUD.show()

        // ３秒後に閉じる
        let t = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.global(qos: .default).asyncAfter(deadline: t) {
            SVProgressHUD.dismiss()
        }
    }

    ///
    /// Progress Status: 進捗ステータス表示あり
    ///
    @IBAction func willFinishWhile(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "processing ...")

        let t = DispatchTime.now() + DispatchTimeInterval.seconds(2)
        let one = DispatchTimeInterval.seconds(1)
        DispatchQueue.global(qos: .default).asyncAfter(deadline: t) {
            DispatchQueue.global(qos: .default).sync {
                SVProgressHUD.showProgress(0.5, status: "きたきたー😁！！ 50%")

                DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + one) {
                    SVProgressHUD.showProgress(0.8, status: "そろそろ🤗！ 80%")

                    DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + one) {
                        let d_one = TimeInterval(1)
                        SVProgressHUD.dismiss(withDelay: d_one)
                    }
                }
            }
        }
    }

    ///
    /// Error Status: 失敗やエラーが発生したとき
    ///
    @IBAction func willShowError(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "processing ...")

        let t = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.global(qos: .default).asyncAfter(deadline: t) {
            SVProgressHUD.showError(withStatus: "Oh, My GOD !!")

            let d_one = TimeInterval(1)
            SVProgressHUD.dismiss(withDelay: d_one)
        }
    }

    ///
    /// Success Status: 成功したとき
    ///
    @IBAction func willShowSuccess(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "processing ...")

        let t = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.global(qos: .default).asyncAfter(deadline: t) {
            SVProgressHUD.showSuccess(withStatus: "Done🎉")

            let d_one = TimeInterval(1)
            SVProgressHUD.dismiss(withDelay: d_one)
        }
    }

    ///
    /// Info Status: 成功したとき
    ///
    @IBAction func willShowInfo(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "processing ...")

        let t = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.global(qos: .default).asyncAfter(deadline: t) {
            SVProgressHUD.showInfo(withStatus: "Something is ...")

            let d_one = TimeInterval(1)
            SVProgressHUD.dismiss(withDelay: d_one)
        }
    }


    ///
    /// タスク完了後に閉じる
    ///
    @IBAction func willFinishAfterAnyTasks(_ sender: UIButton) {
        DispatchQueue.global(qos: .default).async {
            // TODO: time-consuming task

            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        }
    }

    @IBAction func willFinishSomething(_ sender: UIButton) {
        // TODO: Event
    }

}

