//
//  TipDetailViewController.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class TipDetailViewController: UIViewController {
    
    let comments = Comments()
    
    @IBOutlet weak var commentTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        commentTextView.text = comments.highTier[1]
        
    }
    

    

}
