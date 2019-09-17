//
//  View.swift
//  docomo
//
//  Created by 萩　山登 on 2019/08/23.
//  Copyright © 2019 萩　山登. All rights reserved.
//スライダーをカスタムしたクラス
class TappableSlider: UISlider {
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true // どんなtouchでもスライダー調節を行う
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        setThumbImage(UIImage(named: "knob.png"), for: [])
        setMinimumTrackImage(UIImage(named: "slider-active.png"), for: [])
        setMaximumTrackImage(UIImage(named: "slider.png"), for: [])
    }
}
import UIKit
class CustomView: UIView {
    var gblabel1gb:UILabel!
    var gblabel3gb:UILabel!
    var gblabel5gb:UILabel!
    var gblabel7gb:UILabel!
    var gblabel30gb:UILabel!
    var taxInlabel:UILabel!
    var taxOutlabel:UILabel!
    var pricelabel:UILabel!
    var gbSetslider:TappableSlider!
    var callSetsegment:UISegmentedControl!
    override init(frame: CGRect) {
        super.init(frame: frame)
        gbSetslider = TappableSlider()
        gbSetslider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        gbSetslider.setThumbImage(UIImage(named: "knob.png"), for: [])
        gbSetslider.setMinimumTrackImage(UIImage(named: "slider-active.png"), for: [])
        gbSetslider.setMaximumTrackImage(UIImage(named: "slider.png"), for: [])
        gbSetslider.maximumValue = 5
        gbSetslider.minimumValue = 0
        self.addSubview(gbSetslider)
        
        let params = ["Si", "Li", "Fu"]
        callSetsegment = UISegmentedControl(items: params)
        callSetsegment.tintColor = UIColor(red: 0.13, green: 0.61, blue: 0.93, alpha: 1.0)
        callSetsegment.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "HiraKakuProN-W6", size: 14.0)!,NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)// 選択されたセグメントのフォントと文字色の設定
        callSetsegment.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "HiraKakuProN-W3", size: 14.0)!,NSAttributedString.Key.foregroundColor: UIColor(red: 0.30, green: 0.49, blue: 0.62, alpha: 1.0)
            ], for: .normal)// セグメントのフォントと文字色の設定
        callSetsegment.selectedSegmentIndex = 0
        self.addSubview(callSetsegment)// セグメントの選択
        
        taxOutlabel = UILabel()
        taxOutlabel.text = "10000"
        taxOutlabel.textAlignment = .right
        taxOutlabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        self.addSubview(taxOutlabel)
        
        taxInlabel = UILabel()
        taxInlabel.text = "10000"
        taxInlabel.textAlignment = .right
        taxInlabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.thin)
        self.addSubview(taxInlabel)
        
        pricelabel = UILabel()
        pricelabel.text = "¥"
        pricelabel.textAlignment = .center
        pricelabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.thin)
        self.addSubview(pricelabel)
        
        gblabel1gb = UILabel()
        gblabel1gb.text = "1GB"
        gblabel1gb.textAlignment = .center
        gblabel1gb.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1.0)
        gblabel1gb.font = UIFont(name:"HelveticaNeue-Bold", size: 15.3)
        self.addSubview(gblabel1gb)
        
        gblabel3gb = UILabel()
        gblabel3gb.text = "3GB"
        gblabel3gb.textAlignment = .center
        gblabel3gb.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1.0)
        gblabel3gb.font = UIFont(name:"HelveticaNeue-Bold", size: 15.3)
        self.addSubview(gblabel3gb)
        
        gblabel5gb = UILabel()
        gblabel5gb.text = "5GB"
        gblabel5gb.textAlignment = .center
        gblabel5gb.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1.0)
        gblabel5gb.font = UIFont(name:"HelveticaNeue-Bold", size: 15.3)
        self.addSubview(gblabel5gb)
        
        gblabel7gb = UILabel()
        gblabel7gb.text = "7GB"
        gblabel7gb.textAlignment = .center
        gblabel7gb.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1.0)
        gblabel7gb.font = UIFont(name:"HelveticaNeue-Bold", size: 15.3)
        self.addSubview(gblabel7gb)
        
        gblabel30gb = UILabel()
        gblabel30gb.text = "30GB"
        gblabel30gb.textAlignment = .center
        gblabel30gb.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1.0)
        gblabel30gb.font = UIFont(name:"HelveticaNeue-Bold", size: 13.0)
        self.addSubview(gblabel30gb)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        let viewWidth = frame.width
        let viewHeight = frame.height
        gblabel1gb.frame = CGRect(x: viewWidth * 0.043, y: viewHeight * 0.733, width: viewWidth * 0.35, height: viewHeight * 0.2)
        gblabel3gb.frame = CGRect(x: viewWidth * 0.043, y: viewHeight * 0.563, width: viewWidth * 0.35, height: viewHeight * 0.2)
        gblabel5gb.frame = CGRect(x: viewWidth * 0.043, y: viewHeight * 0.39, width: viewWidth * 0.35, height: viewHeight * 0.2)
        gblabel7gb.frame = CGRect(x: viewWidth * 0.043, y: viewHeight * 0.23, width: viewWidth * 0.34, height: viewHeight * 0.2)
        gblabel30gb.frame = CGRect(x: viewWidth * 0.043, y: viewHeight * 0.05, width: viewWidth * 0.35, height: viewHeight * 0.2)
        taxInlabel.frame = CGRect(x: viewWidth * 0.45, y: viewHeight * 0.84, width: viewWidth * 0.6
            , height: viewHeight * 0.2)
        taxOutlabel.frame = CGRect(x: viewWidth * 0.45, y: viewHeight * 0.77, width: viewWidth * 0.6
            , height: viewHeight * 0.2)
        gbSetslider.frame = CGRect(x: viewWidth * 0.05, y: viewHeight * 0.1, width: viewWidth * 0.33, height: viewHeight * 0.9)
        callSetsegment.frame = CGRect(x: viewWidth * 0.05, y: viewHeight * 0, width: viewHeight * 0.35, height: 20)
    }
}
