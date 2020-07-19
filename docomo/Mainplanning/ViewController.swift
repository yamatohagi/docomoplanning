//
//  ViewController.swift
//  docomo
//
//  Created by 萩　山登 on 2019/08/17.
//  Copyright © 2019 萩　山登. All rights reserved.
import UIKit
import Foundation
import TOMSMorphingLabel
import Firebase
class ViewController: UIViewController, UITextFieldDelegate {
    let nametext = UITextField()
    // ブラーエフェクトを作成
    let blurEffect = UIBlurEffect(style: .dark)
    // ブラーエフェクトからエフェクトビューを作成
    lazy var visualEffectView = UIVisualEffectView(effect: blurEffect)
    
    var hikariSelect = false
    let customView1 = CustomView()
    let customView2 = CustomView()
    let customView3 = CustomView()
    let customView4 = CustomView()
    let customView5 = CustomView()
    let customView6 = CustomView()
    let modelViewController = ModelViewController()
    
    var sliderCount = [0,0,0,0,0,0]
    var gbPrice = [0,0,0,0,0,0]
    var callPrice = [0,0,0,0,0,0]
    var totalPrice = [0,0,0,0,0,0]
    var callsegmentSelect = [0,0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let boundSize: CGSize = UIScreen.main.bounds.size
        let width = boundSize.width
        let height = boundSize.height
        customView1.frame = CGRect(x: width * 0, y: height * 0.12, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView1)
        customView2.frame = CGRect(x: width * 0.33, y: height * 0.12, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView2)
        customView3.frame = CGRect(x: width * 0.66, y: height * 0.12, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView3)
        customView4.frame = CGRect(x: width * 0, y: height * 0.51, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView4)
        customView5.frame = CGRect(x: width * 0.33, y: height * 0.51, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView5)
        customView6.frame = CGRect(x: width * 0.66, y: height * 0.51, width: width * 0.31, height: height * 0.37)
        self.view.addSubview(customView6)
        customView1.callSetsegment.addTarget(self, action: #selector(segmentChanged1(_:)), for: UIControl.Event.valueChanged)
        customView1.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue1(_:)), for: .valueChanged)
        customView2.callSetsegment.addTarget(self, action: #selector(segmentChanged2(_:)), for: UIControl.Event.valueChanged)
        customView2.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue2(_:)), for: .valueChanged)
        customView3.callSetsegment.addTarget(self, action: #selector(segmentChanged3(_:)), for: UIControl.Event.valueChanged)
        customView3.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue3(_:)), for: .valueChanged)
        customView4.callSetsegment.addTarget(self, action: #selector(segmentChanged4(_:)), for: UIControl.Event.valueChanged)
        customView4.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue4(_:)), for: .valueChanged)
        customView5.callSetsegment.addTarget(self, action: #selector(segmentChanged5(_:)), for: UIControl.Event.valueChanged)
        customView5.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue5(_:)), for: .valueChanged)
        customView6.callSetsegment.addTarget(self, action: #selector(segmentChanged6(_:)), for: UIControl.Event.valueChanged)
        customView6.gbSetslider.addTarget(self, action: #selector(sliderDidChangeValue6(_:)), for: .valueChanged)
    }
    @IBAction func nametextSet(_ sender: Any) {
        visualEffectView.frame = self.view.frame// エフェクトビューのサイズを画面に合わせる
        self.view.addSubview(visualEffectView)// エフェクトビューを初期viewに追加

        nametext.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 38)
        nametext.placeholder = "お客様の名前"
        nametext.keyboardType = .default
        // 枠線のスタイルを設定
        nametext.borderStyle = .roundedRect
        // 改行ボタンの種類を設定
        nametext.returnKeyType = .done
        // テキストを全消去するボタンを表示
        nametext.clearButtonMode = .always
        
        self.view.addSubview(nametext)
        nametext.becomeFirstResponder()
        nametext.delegate = self
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
        for person in 0..<6 {
            let gbPrice = modelViewController.gbPriceSetHikariCh(sliderCount[person], hikariSelect)
            totalPrice[person] = modelViewController.totalPrice(callPrice[person], gbPrice)
            indicatelabel()
        }
    }
    @objc func segmentChanged1(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 0)
    }
    @objc func sliderDidChangeValue1(_ sender: TappableSlider) {
        gbTotalCalcu(sender, hikariSelect, 0)
    }
    
    @objc func segmentChanged2(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 1)
    }
    @objc func sliderDidChangeValue2(_ sender: TappableSlider){
        gbTotalCalcu(sender, hikariSelect, 1)
    }
    @objc func segmentChanged3(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 2)
    }
    @objc func sliderDidChangeValue3(_ sender: TappableSlider){
        gbTotalCalcu(sender, hikariSelect, 2)
    }
    @objc func segmentChanged4(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 3)
    }
    @objc func sliderDidChangeValue4(_ sender: TappableSlider){
        gbTotalCalcu(sender, hikariSelect, 3)
    }
    @objc func segmentChanged5(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 4)
    }
    @objc func sliderDidChangeValue5(_ sender: TappableSlider){
        gbTotalCalcu(sender, hikariSelect, 4)
    }
    @objc func segmentChanged6(_ segment:UISegmentedControl) {
        callTotalCalcu(segment, 5)
    }
    @objc func sliderDidChangeValue6(_ sender: TappableSlider){
        gbTotalCalcu(sender, hikariSelect, 5)
    }
    func callTotalCalcu(_ segment:UISegmentedControl,_ personNumber:Int) {
        let priceAndCallCount = modelViewController.segmentCalcuPrice(segment)
        callPrice[personNumber] = priceAndCallCount.0
        callsegmentSelect[personNumber] = priceAndCallCount.1
        totalPrice[personNumber] = modelViewController.totalPrice(callPrice[personNumber], gbPrice[personNumber])
        indicatelabel()
    }
    func gbTotalCalcu(_ sender:TappableSlider, _ hikariSelect:Bool, _ personNumber:Int) {
        let priceAndsliderCount = modelViewController.gbPriceSet(hikariSelect, sender)
        gbPrice[personNumber] = priceAndsliderCount.0
        sliderCount[personNumber] = priceAndsliderCount.1
        totalPrice[personNumber] = modelViewController.totalPrice(callPrice[personNumber], gbPrice[personNumber])
        indicatelabel()
    }
    func indicatelabel() {
        customView1.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[0])))"
        customView1.taxOutlabel.text = "\(totalPrice[0])"
        customView2.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[1])))"
        customView2.taxOutlabel.text = "\(totalPrice[1])"
        customView3.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[2])))"
        customView3.taxOutlabel.text = "\(totalPrice[2])"
        customView4.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[3])))"
        customView4.taxOutlabel.text = "\(totalPrice[3])"
        customView5.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[4])))"
        customView5.taxOutlabel.text = "\(totalPrice[4])"
        customView6.taxInlabel.text = "\(Int(1.08 * Double(totalPrice[5])))"
        customView6.taxOutlabel.text = "\(totalPrice[5])"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let rootRef = Database.database().reference(fromURL: "https://docomoplanning-c627d.firebaseio.com/").child("group").childByAutoId()
        let feed = ["name":nametext.text as Any,"sliderCount":sliderCount,"hikariselect":hikariSelect,"callsegmentSelect":callsegmentSelect] as [String:Any]
        
        rootRef.setValue(feed)
        dismiss(animated: true, completion: nil)
        //textField.resignFirstResponder()　←↓どっちでもいい
        self.view.endEditing(true)
        self.nametext.removeFromSuperview()
        self.visualEffectView.removeFromSuperview()
        
        let endlabel = UILabel()
        endlabel.frame = CGRect(x: self.view.bounds.width/2 - 50, y: 200, width: 100, height: 20)
        endlabel.text = "保存完了"
        endlabel.textAlignment = .center
        endlabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)
        self.view.addSubview(endlabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            endlabel.removeFromSuperview()
        }
        return true
    }
}
