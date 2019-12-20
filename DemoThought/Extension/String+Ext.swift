//
//  String+Ext.swift
//  TringappsDemo
//
//  Created by Zencode Developer on 19/12/19.
//  Copyright © 2019 Zencode Developer. All rights reserved.
//

import Foundation

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
