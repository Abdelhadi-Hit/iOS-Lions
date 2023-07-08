//
//  MapBoxViewController.swift
//  Lions
//
//  Created by ABDELHADI on 20/6/2023.
//

import UIKit
import WebKit



class MapBoxViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
               
               if let htmlPath = Bundle.main.path(forResource: "map", ofType: "html") {
                   let htmlURL = URL(fileURLWithPath: htmlPath)
                   webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
               }
    }
}
