//
//  MainViewController.swift
//  AnalyticsDemo
//
//  Created by ang on 2019/6/25.
//  Copyright © 2019 Lion.Information Technology Co,.Ltd. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FirebaseAnalytics

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchParamter: [String: Any] = [
            "contentId": "00025444",
            "contentData": "2019/06/11",
            "contentType": "hotel",
            "searchedString": "TOKYO",
            "successful": true,
            "valueToSum": 2900.5
        ]
        
        AppEvents.logEvent(.searched, parameters: searchParamter)
        Analytics.logEvent("searched", parameters: searchParamter)
        
        // Firbase test
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-00025444",
            AnalyticsParameterItemName: "YADOYA GUEST HOUSE GREEN(YADOYA GUEST HOUSE GREEN)",
            AnalyticsParameterContentType: "cont"
            ])

        // Do any additional setup after loading the view.
    }

}
