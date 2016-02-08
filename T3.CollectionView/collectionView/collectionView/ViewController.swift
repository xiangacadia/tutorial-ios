//
//  ViewController.swift
//  collectionView
//
//  Created by xjiang on 2016-01-25.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, DataCellEvent {
    @IBOutlet weak var collectionView: UICollectionView!
    let len = 9
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // delegate from data cell
    func didFinishTask(sender: DataCell) {
        print("delegate from data cell triggered!")
        print(sender.xIndex)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // how many items you want to show in its grid
    func collectionView(collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return 81
    }
    
    // create data
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DataCell", forIndexPath: indexPath) as! DataCell
        cell.delegate = self // set up delegate
        cell.name.text = "1"
        cell.xIndex = count / len
        cell.yIndex = count % len
        count++
        return cell
    }
    
    // selection behaviour
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // You can use indexPath to get "cell number x", or get the cell like:
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! DataCell
        
        cell.name.text = "1"
        print("row index:", cell.xIndex)
        print("col index:", cell.yIndex)
        
        collectionView.reloadData()
    }

}

