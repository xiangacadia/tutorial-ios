//
//  ViewController.swift
//  coreDataApp
//
//  Created by xjiang on 2016-02-07.
//  Copyright © 2016 xjiang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextViewDelegate {

    //var text = NSManagedObject() // model

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func textViewDidChange(textView: UITextView) {
        
        saveText(textView.text)
        
    }
    
    // persist data
    func saveText(t: String) {
        // Get managed context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Get data entity
        let entity =  NSEntityDescription.entityForName("Data",
                                                        inManagedObjectContext:managedContext)
        // Manage text via context
        let textdata = NSManagedObject(entity: entity!,
                                     insertIntoManagedObjectContext: managedContext)
        
        // Set value for textdata
        textdata.setValue(t, forKey: "Text")
        
        // Save data
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    func loadText() -> String! {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Data")
    
        do {
            let data =
                try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            if data.count > 0 {
                return data[data.count-1].valueForKey("text") as? String
            } else {
                return ""
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return nil

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let restore = loadText()
        textView.text = restore
        
    }


}

