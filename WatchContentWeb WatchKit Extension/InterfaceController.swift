//
//  InterfaceController.swift
//  WatchContentWeb WatchKit Extension
//
//  Created by Amanda Grayson on 2/15/16.
//  Copyright © 2016 umsi363w16. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var image: WKInterfaceImage!
    
    @IBOutlet var label: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        var url = NSURL(string: "https://www.applewatchdevelopercourse.com/message.html")
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) -> Void in
            
            if error == nil {
                let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.label.setText(String(urlContent!))
                })
            } else {
                print(error)
            }
        }
        task.resume()
        
        url = NSURL(string: "https://s-media-cache-ak0.pinimg.com/236x/54/19/93/541993103bc1c2c4ee678286ca7740ef.jpg")
        
        task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data,response,error) -> Void in
            if error == nil {
                let urlImage = UIImage(data: data!)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.image.setImage(urlImage!)
                })
            } else {
                print(error)
            }
            
        }
        task.resume()
    }
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
