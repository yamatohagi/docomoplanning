//
//  CustomViewSub.swift
//  docomo
//
//  Created by 萩　山登 on 2019/09/23.
//  Copyright © 2019 萩　山登. All rights reserved.
//

import Foundation
import UIKit
class CustomViewSub: UIView {

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }
}
