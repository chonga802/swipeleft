//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Christine Hong on 3/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var navBar: UIImageView!

    @IBAction func onDone(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.userInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
