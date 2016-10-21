//
//  XMLParser.swift
//  userdefinedDelegate
//
//  Created by xjiang on 2016-10-21.
//  Copyright © 2016 xjiang. All rights reserved.
//

import Foundation


// 1. define protocal
protocol XMLParserDelegate: class {
    func didFinishTask(sender: XMLParser)
}

class XMLParser: NSObject, NSXMLParserDelegate {
    var currentElement = "" // current element during parsing
    
    // 2. define delegate variable
    weak var delegate:XMLParserDelegate?
    
    
    func startParsingWithContentsOfURL(rssURL: NSURL) {
        let parser = NSXMLParser(contentsOfURL: rssURL)
        parser!.delegate = self
        parser!.parse()
    }
    
    // called every time the parser finds a <key>
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        //print(elementName)
        currentElement = elementName
    }
    
    //called every time the parser enters a <key> and it will stop on line breaks
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if currentElement == "title" {
            print(string)
        }
        
    }
    
    // called every time the parser finds a </key>
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElement = ""
    }
    
    
    
    // called when the parser finished the document
    func parserDidEndDocument(parser: NSXMLParser) {
        // 5. calling delegate method
        delegate?.didFinishTask(self)
    }
    
}
