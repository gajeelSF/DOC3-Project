//
//  IdeologyViewController.swift
//  DOC3 Project
//
//  Created by SongYuda on 5/25/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit

class IdeologyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapOld(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "toOld", sender: nil)
    }

    @IBAction func onTapNew(_ sender: UITapGestureRecognizer) {
        print("new")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
