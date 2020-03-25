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
    var tip: Tip?
    
    @IBOutlet weak var commentTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView() {
        guard let tip = tip else { return }
        switch tip.comment {
        case .lowTier:
            let randomQuote = comments.lowTier.randomElement()
            commentTextView.text = randomQuote
        case .midTier:
            let randomQuote = comments.midTier.randomElement()
            commentTextView.text = randomQuote
        case .highTier:
            let randomQuote = comments.highTier.randomElement()
            commentTextView.text = randomQuote
        }
    }
    

}
