//
//  ImageTransition.swift
//  Facebook
//
//  Created by Shannan Hsiao on 10/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! NewsFeedViewController
        let toViewController = toViewController as! PhotoViewController
        
        let originalImageSize = toViewController.imageView.frame
        
        //add the temp view the same size and height as the original image
        //translate those coordinates in the new view
        let tempView = UIImageView()
        tempView.image = feedViewController.selectedImageView.image
        let frame = toViewController.imageView.convert(feedViewController.selectedImageView.frame, from: feedViewController.selectedImageView.superview)
        toViewController.imageView.frame = frame

        tempView.frame = frame
        tempView.contentMode = feedViewController.selectedImageView.contentMode
        tempView.clipsToBounds = feedViewController.selectedImageView.clipsToBounds
        toViewController.view.addSubview(tempView)
        
        toViewController.view.alpha = 0
        
        
        UIView.animate(withDuration: 0.4, animations: {
            
            toViewController.view.alpha = 1
            
            //Question: How do I programmatically get the x and y coordinates of the view in context of the view controller
            tempView.frame = CGRect(x: originalImageSize.origin.x, y: originalImageSize.origin.y + 73, width: originalImageSize.size.width, height: originalImageSize.size.height)
            tempView.contentMode = UIViewContentMode.scaleAspectFit
            
            toViewController.imageView.image = tempView.image
            toViewController.imageView.frame = originalImageSize
            toViewController.imageView.backgroundColor = UIColor(white: 0, alpha: 1)
            
            }) { (finished: Bool) -> Void in
            self.finish()

            tempView.removeFromSuperview()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        
        UIView.animate(withDuration: 0.4, animations: {
            
            fromViewController.view.alpha = 0
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }


}
