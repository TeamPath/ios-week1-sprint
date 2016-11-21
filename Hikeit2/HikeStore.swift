
//
//  HikesStore.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class HikeStore {
    
    static let shared = HikeStore()
    var selectedImage: UIImage?
    public var hikes: [[Hike]] = []
    
    init() {
        let filePath = archiveFilePath()
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: filePath) {
            hikes = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as!
                [[Hike]]
            
        } else {
            hikes = [[],[],[],[]]
            hikes[0].append (Hike(hikeName: "Cave Run Lake", hikeLocation: "Paintsville, Ky", hikeDiscription: "Beautiful trail around the lake", date: Date(), image: #imageLiteral(resourceName: "Image"), categorySet: 0, hikeDuration: Date(), hikeDistance: 00.03, currentLat:00.00,  currentLong:00.00 , image64: "pasdfadsjfpajdfpiapdfaif")
            )
            hikes[1].append (Hike(hikeName: "Cave Run Lake", hikeLocation: "Paintsville, Ky", hikeDiscription: "Beautiful trail around the lake", date: Date(), image: #imageLiteral(resourceName: "Image"), categorySet: 1, hikeDuration: Date(), hikeDistance: 00.03, currentLat:00.00,  currentLong:00.00 , image64: "pasdfadsjfpajdfpiapdfaif")
                
            )
            hikes[2].append (Hike(hikeName: "Cave Run Lake", hikeLocation: "Paintsville, Ky", hikeDiscription: "Beautiful trail around the lake", date: Date(), image: #imageLiteral(resourceName: "Image"), categorySet: 2, hikeDuration: Date(), hikeDistance: 00.03, currentLat:00.00,  currentLong:00.00 , image64: "pasdfadsjfpajdfpiapdfaif")
            )
            hikes[3].append (Hike(hikeName: "Cave Run Lake", hikeLocation: "Paintsville, Ky", hikeDiscription: "Beautiful trail around the lake", date: Date(), image: #imageLiteral(resourceName: "Image"), categorySet: 3, hikeDuration: Date(), hikeDistance: 00.03, currentLat:00.00,  currentLong:00.00 , image64: "pasdfadsjfpajdfpiapdfaif")
            )
            save()
        }
    }
    
    
    
    
    func getHike (_ categorySet: Int, index: Int) -> Hike {
        
        return hikes[categorySet][index]
    }
    
    func addHike (_ hike: Hike, categorySet: Int) {
        hikes[categorySet].insert(hike, at: 0)
    }
    
    func updateHike(_ hike: Hike, index: Int, categorySet: Int) {
        hikes[categorySet][index] = hike
    }
    
    func deleteHike(_ index: Int, categorySet: Int){
        hikes[categorySet].remove(at: index)
    }
    
    func getCount(categorySet: Int) -> Int {
        return hikes[categorySet].count
        
    }
    
    func save () {
        NSKeyedArchiver.archiveRootObject(hikes, toFile: archiveFilePath())
    }
    
    fileprivate func archiveFilePath() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths.first!
        let path = (documentDirectory as NSString).appendingPathComponent("HikeStore.plist")
        return path
    }
}
