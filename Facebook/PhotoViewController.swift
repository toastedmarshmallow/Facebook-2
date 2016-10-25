//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Shannan Hsiao on 10/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var selectedImageView: UIImageView!
    var imageTransition: ImageTransition!
    
    @IBOutlet var photoUIView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    var image: UIImage!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        
        scrollView.contentSize = CGSize(width: 320, height: 600)

        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //This method is called as the user scrolls
        print("I'm scrolling!")
        print(scrollView.contentOffset.y)

        photoUIView.backgroundColor = UIColor(white: 0, alpha: 1)

        if (scrollView.contentOffset.y < -20)
        {
            photoUIView.alpha = -90/(scrollView.contentOffset.y - 100)
            print(photoUIView.alpha)
            
            if (scrollView.contentOffset.y < -100){
                dismiss(animated: false, completion: nil)
            }
            
        } else if (scrollView.contentOffset.y > -20){
            photoUIView.alpha = -100/(scrollView.contentOffset.y - 100)
            print(photoUIView.alpha)
            
        }
        
        
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
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
