//
//  TwoWayViewController.swift
//  MVVMTest
//
//  Created by 劉柏賢 on 2016/2/14.
//  Copyright © 2016年 劉柏賢. All rights reserved.
//

import UIKit

class OneWayViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    private(set) var viewModel: OneWayViewModel!
    
    override func viewDidLoad() {
        
        dataContext = OneWayViewModel()
        
        super.viewDidLoad()
    }
    
    deinit {
        print("deinit OneWayViewController")
    }
    
    
    // =============== Update Binding ===============
    
    override func updateViewFromViewModel(dataContext: NotifyPropertyChangedProtocol, _ propertyName: String)
    {
        super.updateViewFromViewModel(dataContext, propertyName)
        
        switch propertyName
        {
            case "titleText":
                titleLabel.text = viewModel.titleText
            
            case "date":
                
                let converter = NSDateToStringConverter()
                
                titleLabel.text = converter.convert(viewModel.date, parameter: "yyyy/MM/dd hh:mm:ss") as? String
            
            default:
                break
        }
    }
    
    /**
     * When DataContext Changed then update all View
     */
    override func dataContextChanged(dataContext: NotifyPropertyChangedProtocol) {
        super.dataContextChanged(dataContext)
        
        viewModel = dataContext as! OneWayViewModel
    }
    
    
    // =============== View event ===============

    
    @IBAction func startButtonHandler(sender: UIButton) {
        viewModel.startButtonHandler()
    }
}
