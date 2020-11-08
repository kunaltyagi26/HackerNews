//
//  WKWebView+Extensions.swift
//  HackerNews
//
//  Created by Kunal Tyagi on 08/11/20.
//

import Foundation
import WebKit

extension WKWebView {
    static func pageNotFound()-> WKWebView {
        let webView = WKWebView()
        webView.loadHTMLString("<html><body><h1>Page not found!</h1></body></html>", baseURL: nil)
        return webView
    }
}
