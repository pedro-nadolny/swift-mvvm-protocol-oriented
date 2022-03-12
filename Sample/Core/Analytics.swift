//
//  File.swift
//  Sample
//
//  Created by Pedro Nadolny on 21/02/22.
//

import Foundation

protocol HasAnalytics {
    var analytics: AnalyticsProtocol { get }
}

protocol AnalyticsProtocol {
    
}

final class Analytics: AnalyticsProtocol {
    
}
