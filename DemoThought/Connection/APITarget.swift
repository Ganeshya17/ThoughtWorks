//
// APITarget.swift
//  TringappsDemo
//
//  Created by Zencode Developer on 19/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import Foundation

protocol APITarget {
    var requestURL:URL{get}
    var params:Dictionary<String,Any>?{get}
    var path:String{get}
}
extension APITarget
{
    var requestURL:URL{
        return URL(string: Configutation.BaseURL + path)!
    }
}

