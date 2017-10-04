//
//  RoundedButton.swift
//  Destini
//
//  Created by Michael Jay Abalos on 04/10/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.width/self.frame.height
        self.clipsToBounds = true
    }

    func answerLabel(answer:String) {
        self.setTitle(answer, for: .normal)
    }
}
