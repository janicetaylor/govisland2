//
//  ExploreDetailViewController.swift
//  GovIsland
//
//  Created by janice on 4/28/16.
//  Copyright © 2016 Janice. All rights reserved.
//

import UIKit
import MapKit

class ExploreDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var locationDetail :Location = Location(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), title: "", subtitle: "", categoryId: 0)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    required init(locationDetailToLoad: Location) {
//        
////        let bundle: NSBundle = NSBundle(forClass: self.dynamicType)
////        super.init(nibName: "ExploreDetailViewController", bundle: bundle)
//        locationDetail = locationDetailToLoad
//    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load local webview html
        let url = NSBundle.mainBundle().URLForResource("webView", withExtension: "html")
        let requestObj = NSURLRequest(URL: url!)
        
        // load url remotely
        // let url = NSURL (string: "http://www.google.com")
        // let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj)
        
        updatePage()

    }
    
    
    func updatePage() {
        
        
        let thumbnailUrl :String = "http://www.meladori.com/work/govisland/food/northIslandIceCream.jpg"
    
        let copy :String = locationDetail.title!
        
        let path = NSBundle.mainBundle().pathForResource("webView", ofType: "html")
        
        var html: String?
        do {
            html = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        } catch _ {
            html = nil
        }
        
        html = html!.stringByReplacingOccurrencesOfString("<!-- image -->", withString: thumbnailUrl)
        
        html = html!.stringByReplacingOccurrencesOfString("<!-- body -->", withString: copy)
        
        self.webView.loadHTMLString(html!, baseURL: nil)
        
    }

}
