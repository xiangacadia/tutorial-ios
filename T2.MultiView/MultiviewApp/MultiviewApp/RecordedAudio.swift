//
//  RecordedAudio.swift
//  MultiviewApp
//
//  Created by xjiang on 2016-01-17.
//  Copyright © 2016 xjiang. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    // initializer
    override init() {
        title = "untitled"
    }
}