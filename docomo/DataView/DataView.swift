//
//  DataView.swift
//  docomo
//
//  Created by 萩　山登 on 2019/09/30.
//  Copyright © 2019 萩　山登. All rights reserved.
//

import UIKit

class DataView: TimeLineViewController {
    let customView = CustomViewSub()
    
    
    // ここで受け取る
    var sendPost:Any = ""
    var sendselect:Any = ""

    override func viewDidLoad() {
        super.viewDidLoad()
//        customView.keiyaku.text = "\(sendselect)"
    }

}
