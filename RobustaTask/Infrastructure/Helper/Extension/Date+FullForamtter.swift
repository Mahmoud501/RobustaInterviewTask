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

extension String {
    
    var getDatePeriodString: String? {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            if let date = dateFormatter.date(from: self) {
                let calendar = NSCalendar.current
                let date1 = calendar.startOfDay(for: Date())
                let date2 = calendar.startOfDay(for: date)
                let components = calendar.dateComponents([.year , .month , .day , .hour , .minute], from: date2, to: date1)
                if (components.year ?? 0) != 0  {
                    return components.year!.description  + " " + "Year ago".localized
                }
                if (components.month ?? 0) != 0 {
                    return components.month!.description  + " " + "Month ago".localized
                }
                if (components.day ?? 0) != 0 {
                    return components.day!.description  + " " + "Day ago".localized
                }
                if (components.hour ?? 0) != 0 {
                    return components.hour!.description  + " " + "Hour ago".localized
                }
                if (components.minute ?? 0) != 0 {
                    return components.minute!.description  + " " + "Minute ago".localized
                }
                
                return "Just now".localized
            }
            return nil
        }
        
    }

    var getDateStringLocalized: String? {

        get {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            if let date = dateFormatter.date(from:self) {
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                dateFormatter.calendar = Calendar.current
                dateFormatter.dateFormat = "EEEE , MMM, d, yyyy"
                let str = dateFormatter.string(from: date)
                return str
            }
            return nil
        }
    }
    
}
