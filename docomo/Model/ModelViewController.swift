//
//  ModelViewController.swift
//  docomo
//
//  Created by 萩　山登 on 2019/08/23.
//  Copyright © 2019 萩　山登. All rights reserved.
import Foundation
import UIKit
class ModelViewController {
    var gbPrice:Int = 0
    
    func gbPriceSet(_ hikariSelect: Bool,_ sender: TappableSlider) -> (Int, Int) {
        let sliderCount = Int(roundf(sender.value * 1) * 1)
        sender.value = Float(sliderCount)//GbSliderを一定間隔で動かす
        let gbPrice = gbCalcu(hikariSelect, sliderCount)
        return (gbPrice, sliderCount)
    }
    func segmentCalcuPrice(_ segment:UISegmentedControl) -> Int{
        var callCountValue = 0
        var callPrice = 0
        
        switch segment.selectedSegmentIndex {
        case 0: callCountValue = 0
        case 1: callCountValue = 1
        case 2: callCountValue = 2
        default:
            break
        }
        if callCountValue == 0 {
            callPrice = 0
        }else if callCountValue == 1 {
            callPrice = 700
        }else if callCountValue == 2 {
            callPrice = 1700
        }
        return Int(callPrice)
    }
    func gbPriceSetHikariCh(_ sliderCount:Int, _ hikariSelect:Bool) -> Int {
        let gbPrice = gbCalcu(hikariSelect, sliderCount)
        return(gbPrice)
    }

    func totalPrice(_ callPrice: Int,_ gbPrice: Int) -> Int {
        let totalPrice = callPrice + gbPrice
        return Int(totalPrice)
    }
    //項目ごとの条件分岐
    func sliderSetup(_ sender: TappableSlider) -> Int {
        let roundValue = Int(roundf(sender.value * 1) * 1)
        sender.value = Float(roundValue)//GbSliderを一定間隔で動かす
        return(roundValue)
    }
    func gbCalcu(_ hikariSelect:Bool,_ sliderCount:Int) -> Int{
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
