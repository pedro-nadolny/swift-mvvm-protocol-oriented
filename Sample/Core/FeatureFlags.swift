import Foundation

protocol HasFeatureFlags {
    var featureFlags: FeatureFlagsProtocol { get }
}

protocol FeatureFlagsProtocol {
    
}

final class FeatureFlags: FeatureFlagsProtocol {
    
}
