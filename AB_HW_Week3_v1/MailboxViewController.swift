//
//  MailboxViewController.swift
//  AB_HW_Week3_v1
//
//  Created by Annette Brookman on 6/4/16.
//  Copyright © 2016 Annette Brookman. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    
    @IBOutlet weak var mailboxScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var singlemessageView: UIView!
    @IBOutlet weak var laterImageView: UIImageView!
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var listiconImageView: UIImageView!
    @IBOutlet weak var rescheduleImageView: UIImageView!
    @IBOutlet weak var deleteiconImageView: UIImageView!
    @IBOutlet weak var listoptionsImageView: UIImageView!
    @IBOutlet weak var panningView: UIView!
    
    
    
    var messageOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailboxScrollView.contentSize = feedImageView.image!.size
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPanMessage:")
        
        messageImageView.addGestureRecognizer(panGestureRecognizer)
        
//        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didPanMessage(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        // declare that the current location of the later/clock icon will be this variable
        var laterImageFrame = self.laterImageView.frame
        
        // declare that the current location of the list icon will be this variable
        var listiconImageFrame = self.listiconImageView.frame
        
        //Create the offset that will determine how far the icons are from right side of the message
        let rightPosOfMessageView = messageImageView.frame.origin.x + messageImageView.frame.size.width + 30.0
        
        // GESTURE recognized
        if sender.state == UIGestureRecognizerState.Began {
            print ("Began")
            
            self.messageOriginalCenter = self.messageImageView.center
            
            // GESTURE changed
        } else if sender.state == UIGestureRecognizerState.Changed {
            print ("Changed")
            
            // translating movement of finger to movement of the message
            self.messageImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            // IF message shows a 40 pixel gap or less on the right (its moving right)
            if messageImageView.frame.origin.x > (-40) {
                
                //Change color background to grey
                self.singlemessageView.backgroundColor = UIColor.lightGrayColor()
                
            }
            // IF message is moved LEFT by 60
            if messageImageView.frame.origin.x < (-60) {
                print("passed left threshold")
                
                // Place the later/clock icon's origin x at that offset position
                laterImageFrame.origin.x = rightPosOfMessageView
                
                // Place the later/clock icon at that offset position
                listiconImageFrame.origin.x = rightPosOfMessageView
                
                // Change color - yellow and swap the icons - the later/clock icon appear
                self.singlemessageView.backgroundColor = UIColor(red:255/255, green: 204/255, blue: 0/255, alpha: 1.0)
                self.laterImageView.alpha = 1
                
                // Make the later/clock icon image follow the message as it moves
                self.laterImageView.frame = laterImageFrame
                
                // Make the list icon image follow the message as it moves
                self.listiconImageView.frame = listiconImageFrame
                
                // Clean up stage - disapper - list & archive/checkmark icons
                self.listiconImageView.alpha = 0
                self.archiveImageView.alpha = 0
                
                // IF the message is moved FURTHER LEFT - past -200
                if messageImageView.frame.origin.x < (-200)  {
                    
                    //Clean up stage - disappear - later/clock icon
                    self.laterImageView.alpha = 0
                    
                    //Appear - list icon
                    self.listiconImageView.alpha = 1
                    
                    // Change color - brown
                    self.singlemessageView.backgroundColor = UIColor(red:216/255, green: 165/255, blue: 117/255, alpha: 1.0)
                    
                }
                
            }
            // IF message is moved RIGHT by 60
            if messageImageView.frame.origin.x > 60 {
                print("passed right threshold")
                
                // declare that the current location of the archive/checkmark icon will be this variable
                var archiveImageFrame = self.archiveImageView.frame
                
                // declare that the current location of the delete/x icon will be this variable
                var deleteImageFrame = self.deleteiconImageView.frame
                
                //Clean up stage - disappear - the clock/later & list icons
                self.laterImageView.alpha = 0
                self.listiconImageView.alpha = 0
                self.deleteiconImageView.alpha = 0
                
                //Create the offset that will determine how far the icons are from the left side of the message
                let leftPosOfMessageView = messageImageView.frame.origin.x + messageImageView.frame.size.width - 360.0
                
                // Place the archive/checkmark icon's origin x at that offset position
                archiveImageFrame.origin.x = leftPosOfMessageView
                
                // Place the delete/x icon at that offset position
                deleteImageFrame.origin.x = leftPosOfMessageView
                
                //  Change color - green and swap the icons - the check/archive image appear
                self.singlemessageView.backgroundColor = UIColor.greenColor()
                self.archiveImageView.alpha = 1
                
                // Make the archive/checkmark icon image follow the message as it moves
                self.archiveImageView.frame = archiveImageFrame
                
                //IF message is moved FURTHER RIGHT - past 250
                if messageImageView.frame.origin.x > 250 {
                    
                    // Clean up stage - disappear - the clock/later image
                    self.laterImageView.alpha = 0
                    self.archiveImageView.alpha = 0
                    
                    // Appear - delete/x icon
                    self.deleteiconImageView.alpha = 1
                    
                    self.deleteiconImageView.frame = deleteImageFrame
                    
                    //Disappear - archive/checkmark icon
                    self.archiveImageView.alpha = 0
                    
                    //  Change color - red
                    self.singlemessageView.backgroundColor = UIColor(red:235/255, green: 84/255, blue: 51/255, alpha: 1.0)
                    
                }
                
                
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print ("Ended")
            
            self.laterImageView.alpha = 0
            self.listiconImageView.alpha = 0
            self.deleteiconImageView.alpha = 0
            self.archiveImageView.alpha = 0
            
            // IF message is going to the left when released
            if velocity.x < 0 {
                
                // IF the message is past 60 threshold - showing the reschedule icon
                if self.messageImageView.frame.origin.x < (-60) {
                    
                    // But not showing the list icon yet
                    if self.messageImageView.frame.origin.x > (-200) {
                        
                        //move the message offscreen and show the reschedule icon
                        messageImageView.frame.origin.x = (-320)
                        rescheduleImageView.alpha = 1
                    }
                    
                }
                // IF the message is not/barely showing the list icon...
                if messageImageView.frame.origin.x > (-60) {
                    
                    // Animate the message back into its original position
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.messageImageView.frame.origin.x = self.messageImageView.frame.size.width - 320
                    })
                    
                }
                // IF the message is past the 200 threshold - allow it to continue animating with...
                if messageImageView.frame.origin.x < (-200) {
                    
                    // Color staying brown
                    self.singlemessageView.backgroundColor = UIColor(red:216/255, green: 165/255, blue: 117/255, alpha: 1.0)
                    
                    // Animate the message offscreen
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.messageImageView.frame.origin.x = (-320)
                        
                    })
                    
                    self.listoptionsImageView.alpha = 1
                    
                    
                }
            } else {
                
                
                // IF the message is past the 250 threshold - showing the delete icon - allow it to continue animating with...
                if messageImageView.frame.origin.x > 250 {
                    print("released at 250")
                    
                    //  Change color - red
                    self.singlemessageView.backgroundColor = UIColor(red:235/255, green: 84/255, blue: 51/255, alpha: 1.0)
                    
                    // Animate the message offscreen
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.messageImageView.frame.origin.x += 320
                    })
                    self.singlemessageView.alpha = 0
                    
                    UIView.animateWithDuration(0.2) { () -> Void in
                        self.feedImageView.frame.origin.y = (-86)
                    }
                    
                }
                // IF the message is showing the archive/checkmark icon
                if messageImageView.frame.origin.x > 60 {
                    
                    
                    if messageImageView.frame.origin.x < 250 {
                    print("released at 60 but less than 250")
                    
                    // Change the color to green
                    singlemessageView.backgroundColor = UIColor.greenColor()
                    
                    //Animate move the message offscreen
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.messageImageView.frame.origin.x += 320
                    })
                  }
                }
                // IF the message not yet past the 60 threshold and NOT showing the archive/checkmark icon
                if self.messageImageView.frame.origin.x < 60 {
                    
                    // Animate the message back into its original position
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.messageImageView.frame.origin.x = self.messageImageView.frame.size.width - 320
                    })
                    
                }
          
            }

        }
    }
    
    //on tap of the reschedule image the image should disappear
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        self.rescheduleImageView.alpha = 0
        self.singlemessageView.alpha = 0
        self.feedImageView.frame.origin.y = (-86)
        
    }
    
    //on tap of the reschedule image the image should disappear
    @IBAction func onListOptionsTap(sender: UITapGestureRecognizer) {
    self.listoptionsImageView.alpha = 0
    self.singlemessageView.alpha = 0
    
        UIView.animateWithDuration(0.2) { () -> Void in
         self.feedImageView.frame.origin.y = (-86)
        }
    }
    
    //@IBAction func onEdgePan(sender: UIScreenEdgePanGestureRecognizer) {
     
    //}
    
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/
}
