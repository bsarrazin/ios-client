//
//  HashingTest.swift
//  SplitTests
//
//  Created by Javier on 12/11/2018.
//  Copyright © 2018 Split. All rights reserved.
//

import XCTest
@testable import Split

class LegacyHashingTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHashing() {
        let files: [String] = ["legacy_1", "legacy_2"]
        for file in files {
            var data = CsvHelper.readDataFromCSV(sourceClass: self, fileName: file)
            data = CsvHelper.cleanRows(file: data!)
            let csvRows = CsvHelper.csv(data: data!)

            for row in csvRows {
                if row.count != 4 {
                    continue
                }
                let seed: Int = Int(row[0])!
                let key: String = row[1]
                let bucketExpected = Int(row[3])!
                let bucket = Splitter.shared.getBucket(seed: seed, key: key, algo: 1)
                
                //print("seed: \(seed) - key: \(key) - buckexp: \(bucketExpected) - bucket: \(bucket) ")
                
                XCTAssertNotNil(bucket, "Bucket should not be nil")
                XCTAssertTrue(bucket == bucketExpected, "Bucket has not expected value: \(bucket) expected => \(bucketExpected)")
            }
        }
    }
    
}
