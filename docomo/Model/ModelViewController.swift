//
//  ModelViewController.swift
//  docomo
//
//  Created by 萩　山登 on 2019/08/23.
//  Copyright © 2019 萩　山登. All rights reserved.
import Foundation
import UIKit
class ModelViewController {
    func gbPriceSet(_ hikariSelect: Bool,_ sender: TappableSlider) -> (Int, Int) {
        let sliderCount = Int(roundf(sender.value * 1) * 1)
        sender.value = Float(sliderCount)//GbSliderを一定間隔で動かす
        let gbPrice = gbCalcu(hikariSelect, sliderCount)
        return (gbPrice, sliderCount)
    }
    func segmentCalcuPrice(_ segment:UISegmentedControl) -> Int{
        var callPrice = 0
        switch segment.selectedSegmentIndex {
        case 0: callPrice = 0
        case 1: callPrice = 700
        case 2: callPrice = 1700
        default:
            callPrice = 0
        }
      return(callPrice)
    }
    func gbPriceSetHikariCh(_ sliderCount:Int, _ hikariSelect:Bool) -> Int {
        let gbPrice = gbCalcu(hikariSelect, sliderCount)
        return(gbPrice)
    }
    func totalPrice(_ callPrice: Int,_ gbPrice: Int) -> Int {
        let totalPrice = callPrice + gbPrice
        return Int(totalPrice)
    }
    func gbCalcu(_ hikariSelect:Bool,_ sliderCount:Int) -> Int{
        var gbPrice = 0
        if hikariSelect == true{
            if sliderCount == 0 {
                gbPrice = 0
            }else if sliderCount == 1 {
                gbPrice = 1980
            }else if sliderCount == 2 {
                gbPrice = 2480
            }else if sliderCount == 3 {
                gbPrice = 2980
            }else if sliderCount == 4 {
                gbPrice = 3980
            }else if sliderCount == 5 {
                gbPrice = 4980
            }
        }
        if hikariSelect == false{
            if sliderCount == 0 {
                gbPrice = 0
            }else if sliderCount == 1 {
                gbPrice = 1980
            }else if sliderCount == 2 {
                gbPrice = 2980
            }else if sliderCount == 3 {
                gbPrice = 3980
            }else if sliderCount == 4 {
                gbPrice = 4980
            }else if sliderCount == 5 {
                gbPrice = 5980
            }
        }
        return(gbPrice)
    }
}
