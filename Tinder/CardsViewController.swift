//
//  CardsViewController.swift
//  Tinder
//
//  Created by Christine Hong on 3/2/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

extension Float {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}


class CardsViewController: UIViewController {

    @IBOutlet weak var navBar: UIImageView!
    @IBOutlet weak var actionButtons: UIImageView!
    @IBOutlet weak var profileImage: DraggableImageView!
    

    
    var photoOriginalCenter: CGPoint!
    
    @IBAction func onTap(sender: AnyObject) {
    }

    @IBAction func onSwipe(panGestureRecognizer: AnyObject) {
        let locationPoint = panGestureRecognizer.locationInView(self.view)
        let point = panGestureRecognizer.translationInView(self.view)
        var degreeNum = Float(0.0)
        let screenWidth = UIScreen.mainScreen().bounds.width/2
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            photoOriginalCenter = profileImage.center
            print("LOCATION POINT")
            print(locationPoint)
            print("CENTER")
            print(photoOriginalCenter)
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            profileImage.center = CGPoint(x: photoOriginalCenter.x + point.x, y: photoOriginalCenter.y)
            print("LOCATION POINT")
            print(locationPoint)
//            print("POINT")
//            print(point)
            // Clockwise
            if ((locationPoint.x < profileImage.center.x && locationPoint.y < profileImage.center.y) || (locationPoint.x > profileImage.center.x && locationPoint.y > profileImage.center.y)) {
                print("TOP LEFT / BOTTOM RIGHT")
                degreeNum = Float(point.x)/Float(screenWidth) * Float(20.0)
                let t = CGAffineTransformMakeRotation(degreeNum.degreesToRadians);
                profileImage.transform = t
            }
            // Counterclocksiws
            else {
                print("TOP RIGHT / BOTTOM LEFT")
                degreeNum = Float(point.x)/Float(screenWidth) * Float(-20.0)
                let t = CGAffineTransformMakeRotation(degreeNum.degreesToRadians);
                profileImage.transform = t
            }
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            if (point.x > 200) {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.profileImage.center = CGPoint(x: 1000, y: point.y)
                })
            } else if (point.x < -200) {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.profileImage.center = CGPoint(x: -1000, y: point.y)
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.profileImage.transform = CGAffineTransformIdentity
                    self.profileImage.center = self.photoOriginalCenter
                })
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profileImage.contentMode = UIViewContentMode.ScaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.userInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

