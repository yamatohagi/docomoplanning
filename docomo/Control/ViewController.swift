//
//  ViewController.swift
//  docomo
//
//  Created by 萩　山登 on 2019/08/17.
//  Copyright © 2019 萩　山登. All rights reserved.
import UIKit
import Foundation
class ViewController: UIViewController {
    var hikariSelect = false
    
    let customView1 = CustomView()
    let customView2 = CustomView()
    let customView3 = CustomView()
    let customView4 = CustomView()
    let customView5 = CustomView()
    let customView6 = CustomView()
    let modelViewController = ModelViewController()
    
    var sliderCount = [0,0,0]
    var gbPrice = [0,0,0]
    var callPrice = [0,0,0]
    var totalPrice = [0,0,0]
    override func viewDidLoad() {
        super.viewDidLoad()
        let boundSize: CGSize = UIScreen.main.bounds.size
        let width = boundSize.width
        let height = boundSize.height

        customView1.frame = CGRect(x: width * 0, y: height * 0.15, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView1)
        customView2.frame = CGRect(x: width * 0.33, y: height * 0.15, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView2)
        customView3.frame = CGRect(x: width * 0.66, y: height * 0.15, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView3)
        customView4.frame = CGRect(x: width * 0, y: height * 0.57, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView4)
        customView5.frame = CGRect(x: width * 0.33, y: height * 0.57, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView5)
        customView6.frame = CGRect(x: width * 0.66, y: height * 0.57, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView6)
        
        customView1.callSetsegment.addTarget(self, action: #selector(segmentChanged1(_:)), for: UIControl.Event.valueChanged)
        customView1.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue1(_:)), for: .valueChanged)
        customView2.callSetsegment.addTarget(self, action: #selector(segmentChanged2(_:)), for: UIControl.Event.valueChanged)
        customView2.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue2(_:)), for: .valueChanged)
        customView3.callSetsegment.addTarget(self, action: #selector(segmentChanged3(_:)), for: UIControl.Event.valueChanged)
        customView3.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue3(_:)), for: .valueChanged)
//        customView4.callSetsegment.addTarget(self, action: #selector(segmentChanged4(_:)), for: UIControl.Event.valueChanged)
//        customView4.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue4(_:)), for: .valueChanged)
//        customView5.callSetsegment.addTarget(self, action: #selector(segmentChanged5(_:)), for: UIControl.Event.valueChanged)
//        customView5.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue5(_:)), for: .valueChanged)
//        customView6.callSetsegment.addTarget(self, action: #selector(segmentChanged6(_:)), for: UIControl.Event.valueChanged)
//        customView6.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue6(_:)), for: .valueChanged)
    }
    @IBAction func hikariSelect(_ sender: Any) {
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            hikariSelect = true
        case 1:
            hikariSelect = false
        default:
            break
        }
        
        for person in 0..<3 {
            let gbPrice = modelViewController.gbPriceSetHikariCh(sliderCount[person], hikariSelect)
            totalPrice[person] = modelViewController.totalPrice(callPrice[person], gbPrice)
            indicatelabel()
        }

    }
    
    @objc func segmentChanged1(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 0, 0, 0)
    }
    @objc func sliderDidChangeValue1(_ sender: TappableSlider) {
        gbTotalCalcu(sender, hikariSelect, 0, 0, 0, 0)
    }
    
    @objc func segmentChanged2(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 1, 1, 1)
    }
    @objc func sliderDidChangeValue2(_ sender: TappableSlider){
        gbTotalCalcu(sender, hikariSelect, 1, 1, 1, 1)
    }
    @objc func segmentChanged3(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 2, 2, 2)
    }
    @objc func sliderDidChangeValue3(_ sender: TappableSlider){
        gbTotalCalcu(sender, hikariSelect, 2, 2, 2, 2)
    }
    
    func callTotalCalcu(_ segment:UISegmentedControl,_ callPricePer:Int,_ totalPricePer:Int,_ gbPricePer:Int) {
        callPrice[callPricePer] = modelViewController.segmentCalcuPrice(segment)
        totalPrice[totalPricePer] = modelViewController.totalPrice(callPrice[callPricePer], gbPrice[gbPricePer])
        indicatelabel()
    }
    func gbTotalCalcu(_ sender:TappableSlider, _ hikariSelect:Bool, _ gbPricePer:Int, _ sliderCountPer:Int, _ totalPricePer:Int, _ callPricePer:Int) {
        let priceAndsliderCount = modelViewController.gbPriceSet(hikariSelect, sender)
        gbPrice[gbPricePer] = priceAndsliderCount.0
        sliderCount[sliderCountPer] = priceAndsliderCount.1
        totalPrice[totalPricePer] = modelViewController.totalPrice(callPrice[callPricePer], gbPrice[gbPricePer])
        indicatelabel()
    }
    func indicatelabel() {
        customView1.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[0])))"
        customView1.taxOutlabel.text = "\(totalPrice[0])"
        customView2.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[1])))"
        customView2.taxOutlabel.text = "\(totalPrice[1])"
        customView3.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[2])))"
        customView3.taxOutlabel.text = "\(totalPrice[2])"
        
    }
    
}
