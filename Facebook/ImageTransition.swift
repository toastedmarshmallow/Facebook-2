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
        
//        let newsfeedViewController = fromViewController as! NewsFeedViewController
//        let photoViewController = toViewController as! PhotoViewController
        
        toViewController.view.alpha = 0
        
        let destinationImageFrame = toViewController.imageView.frame
        
        toViewController.imageView.frame = feedViewController.selectedImageView.frame
        
//        feedViewController.selectedImageView.frame = toViewController.imageView.frame
        
        toViewController.imageView.frame = destinationImageFrame
        
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }


}
