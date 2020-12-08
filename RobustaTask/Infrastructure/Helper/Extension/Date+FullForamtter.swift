//
//  Date+FullForamtter.swift
//  Majdona
//
//  Created by MAJED A  ALGARNI on 5/11/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation

extension String {
    
    func getDate() -> Date? {
        var str = self
        var strArr = str.split(separator: " ")
        strArr.removeLast()
        str = ""
        for item in strArr {
            str = str + item + " "
        }
        str.removeLast()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        let datetime = formatter.date(from: str)
        return datetime
    }
    
    func getAnotherDate() -> Date? {
        var str = self
        var strArr = str.split(separator: " ")
        strArr.removeLast()
        str = ""
        for item in strArr {
            str = str + item + " "
        }
        str.removeLast()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy"
        let datetime = formatter.date(from: str)
        return datetime
    }
    
    func getMyDate() -> Date? {
//        let date = self.getDate()
//        if date == nil {
//            print(self.getAnotherDate())
//            return self.getAnotherDate()
//        }
//
//        print(self.getDate())
//        return date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        let datetime = formatter.date(from: self.replacingOccurrences(of: "-00", with: "-01"))
        return datetime
    }
    
}

extension Date {
    static func getCurrentHijriYear() -> Int {
         let datenow = Date()
         let islamic = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.islamicCivil)!
         return islamic.component(.year, from: datenow)
     }
     
     static func getCurrentGregorianYear() -> Int {
         let datenow = Date()
         let calendar = Calendar.current
         return calendar.component(.year, from: datenow)
     }
}
