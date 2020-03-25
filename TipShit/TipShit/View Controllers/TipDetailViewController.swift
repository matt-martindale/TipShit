//
//  TipDetailViewController.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class TipDetailViewController: UIViewController {
    
    var tipController: TipController? = nil
    let comments = Comments()
    var tip: Tip?
    var tipTier: TipTier?
    
    @IBOutlet weak var commentTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView() {
        guard let tipTier = tipTier else { return }
        switch tipTier {
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
