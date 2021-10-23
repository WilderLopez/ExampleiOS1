//
//  Extension-Codable.swift
//  Examenios1
//
//  Created by Wilder Lopez on 10/23/21.
//

import Foundation

extension Decodable {
    public static func decode(dict: [AnyHashable: Any]?) -> Self? {
        guard let dict = dict else { return nil }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodeStrategy
            
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            return try decoder.decode(Self.self, from: jsonData)
        } catch {
            NSLog("Error decoding \(error.localizedDescription)")
        }
        return nil
    }
    
    public static func decode(data: Data?) -> Self? {
        guard let jsonData = data else { return nil }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodeStrategy
            return try decoder.decode(Self.self, from: jsonData)
        } catch {
            NSLog("Error decoding \(error)")
        }
        return nil
    }
    
    static var dateDecodeStrategy: JSONDecoder.DateDecodingStrategy {
        .custom { (decoder) -> Date in
            let formatter: DateFormatter = DateFormatter()
            formatter.timeZone = TimeZone(abbreviation: "UTC")
            
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            let largeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            let smallFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            var date: Date?
            formatter.dateFormat = largeFormat
            date = formatter.date(from: dateStr)
            if let _date = date {
                return _date
            }
            formatter.dateFormat = smallFormat
            date = formatter.date(from: dateStr)
            
            guard let date_ = date else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateStr)")
            }
            return date_
        }
    }
}


extension Encodable {
    public var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    public var jsonString: String? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

    
