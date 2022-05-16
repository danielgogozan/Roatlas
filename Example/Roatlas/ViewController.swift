//
//  ViewController.swift
//  Roatlas
//
//  Created by Daniel Gogozan on 04/14/2022.
//  Copyright (c) 2022 Daniel Gogozan. All rights reserved.
//

import UIKit
import Roatlas

class ViewController: UIViewController {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var contentStackView: UIStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var searchView1: ROSearchView!
    @IBOutlet private weak var searchView2: ROSearchView!
    @IBOutlet private weak var searchView3: ROSearchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView1.delegate = self
        searchView2.delegate = self
        searchView3.delegate = self
        
        setupSearchView1()
        setupSearchView2()
        setupSearchView3()
    }
    
    func setupSearchView1() {
        var color1: UIColor?
        if #available(iOS 11.0, *) {
            color1 = UIColor(named: "mywhite")
        }
        var clearImage: UIImage?
        if #available(iOS 13.0, *) {
            clearImage = UIImage(systemName: "airplane.departure")
        }
        
        let defaultStyle = ROViewStyle(backgroundColor: color1, cornerRadius: 12, borderWidth: 0.5, borderColor: .lightGray, shadowOffset: .zero, shadowOpacity: 1, shadowRadius: 2, shadowColor: .lightGray)
        
        let expandedStyle = ROViewStyle(backgroundColor: color1, cornerRadius: 12, borderWidth: 0.5, borderColor: .darkGray, shadowOffset: .zero, shadowOpacity: 0.5, shadowRadius: 2, shadowColor: .black)
        
        let resultStyle = ROResultStyle(backgroundColor: .white, separatorColor: .lightGray, selectionColor: .white, type: .settlementAndCounty, font: .boldSystemFont(ofSize: 20), textColor: .lightGray, selectedTextColor: .brown, maxViewHeight: 300)
        
        let searchViewStyle = ROSearchViewStyle(searchViewStyle: defaultStyle,
                                                expandedStyle: expandedStyle,
                                                resultViewStyle: resultStyle,
                                                clearButtonType: .always,
                                                clearImage: clearImage,
                                                separatorHeight: 1,
                                                separatorColor: .brown,
                                                searchFont: .systemFont(ofSize: 25),
                                                searchTextColor: .black,
                                                searchPlaceholder: "Type a few letters")
        
        searchView1.customize(using: searchViewStyle)
    }
    
    func setupSearchView2() {
        var color1: UIColor?
        var color2: UIColor?
        if #available(iOS 11.0, *) {
            color1 = UIColor(named: "mypink")
            color2 = UIColor(named: "mypink-light")
        }
        
        
        let defaultStyle = ROViewStyle(backgroundColor: color1, cornerRadius: 17, borderWidth: 2, borderColor: .purple, shadowOffset: CGSize(width: 0, height: 5), shadowOpacity: 1, shadowRadius: 5, shadowColor: .black)
        
        let resultStyle = ROResultStyle(backgroundColor: .white, separatorColor: color1!, selectionColor: color2!, type: .settlementAndCounty, font: .systemFont(ofSize: 20), textColor: .black, selectedTextColor: .black, maxViewHeight: 300)
        
        let searchViewStyle = ROSearchViewStyle(searchViewStyle: defaultStyle,
                                                expandedStyle: defaultStyle,
                                                resultViewStyle: resultStyle,
                                                clearButtonType: .whileEditing,
                                                separatorHeight: 1,
                                                separatorColor: .black,
                                                searchFont: .systemFont(ofSize: 20),
                                                searchTextColor: .purple,
                                                searchPlaceholder: "Cauta localitatea")
        
        searchView2.customize(using: searchViewStyle)
    }
    
    func setupSearchView3(){
        var clearImage: UIImage?
        if #available(iOS 13.0, *) {
            clearImage = UIImage(systemName: "xmark.octagon")
        }
        let attributedPlaceholder = NSAttributedString(string: "search your settlement", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .thin)])
        let defaultStyle = ROViewStyle(backgroundColor: .white, borderWidth: 0.2, borderColor: .lightGray)
        
        let expandedStyle = ROViewStyle(backgroundColor: .white, borderWidth: 0.5, borderColor: .lightGray, shadowOffset: .zero, shadowOpacity: 0.2, shadowRadius: 1, shadowColor: .red)
        
        let resultStyle = ROResultStyle(backgroundColor: .white, separatorColor: .lightGray, selectionColor: .black, type: .settlementAndCounty, font: .monospacedDigitSystemFont(ofSize: 15, weight: .medium), textColor: .black, selectedTextColor: .red, maxViewHeight: 300)
        
        let searchViewStyle = ROSearchViewStyle(searchViewStyle: defaultStyle,
                                                expandedStyle: expandedStyle,
                                                resultViewStyle: resultStyle,
                                                clearButtonType: .untilEditing,
                                                clearImage: clearImage,
                                                separatorHeight: 2.5,
                                                separatorColor: .red,
                                                searchFont: .monospacedDigitSystemFont(ofSize: 18, weight: .semibold),
                                                searchTextColor: .black,
                                                placeholderAttributedString: attributedPlaceholder)
        
        searchView3.customize(using: searchViewStyle)
    }
}

extension ViewController: ROSearchViewDelegate {
    func didSelectResult(settlement: Settlement) {
        print("--- Settlement selected: \(settlement.name) ---")
    }
}

