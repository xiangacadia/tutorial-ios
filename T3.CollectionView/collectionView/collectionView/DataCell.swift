//
//  DataCell.swift
//  collectionView
//
//  Created by xjiang on 2016-01-25.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit

// declare protocol
protocol DataCellEvent: class {
    func didFinishTask(sender: DataCell)
}


class DataCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    var xIndex = 0
    var yIndex = 0
    
    // define delegate
    weak var delegate:DataCellEvent?
    
    @IBAction func buttonTouched(sender: AnyObject) {
        delegate?.didFinishTask(self) // trigger delegate
    }
    
    
    
    
}
