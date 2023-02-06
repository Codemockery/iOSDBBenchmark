//
//  ViewController.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 10/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*let dbte: DBTestExecutor = DBTestExecutor(dbTestable: OBJBPersonExecutor())
//        let writeTime = dbte.writeAll()
        let writeBatchTime = dbte.writeBatch()
        let readTime = dbte.readAll()
//        let updateTime = dbte.updateAll()
        let updateBatchTime = dbte.updateBatch()

        print("Read Time ", readTime)
//        print("Write Time ", writeTime)
//        print("Update Time ", updateTime)
        print("Write Batch Time ", writeBatchTime)
        print("Update Batch Time ", updateBatchTime)*/
        
        
        let dbte: DBTestExecutor = DBTestExecutor(dbTestable: OBJBLEResponseExecutor())
        let writeTime = dbte.writeAll()
        let writeBatchTime = dbte.writeBatch()
        let readTime = dbte.readAll()
        let updateTime = dbte.updateAll()
        let updateBatchTime = dbte.updateBatch()
        
        print("Read Time ", readTime)
        print("Write Time ", writeTime)
        print("Update Time ", updateTime)
        print("Write Batch Time ", writeBatchTime)
        print("Update Batch Time ", updateBatchTime)
         
        
    }

}

