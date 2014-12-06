//
//  ViewController.swift
//  FirstPictureApp
//
//  Created by Sabiha Medina on 11/25/14.
//  Copyright (c) 2014 SabihaMedina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PhotoImageView: UIImageView!
    
    //Create a place to render the filtered Image
    let context = CIContext(options: nil)

    @IBAction func ApplyFilter(sender: AnyObject) {
        //Create an image to filter
        let inputImage = CIImage(image:PhotoImageView.image)
        
        //Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey:(Double(arc4random_uniform(314))/100)]
        //Apply a filter to the image
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust",withInputParameters: randomColor)
        
        //Render the filtered Image
        let renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        
        //Reflect the change back in the interface
        PhotoImageView.image = UIImage(CGImage: renderedImage)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

