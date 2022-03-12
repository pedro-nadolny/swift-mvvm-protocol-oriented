import Foundation
@testable import Sample

extension DependencyContainer {

    static func fixture(
        analytics: AnalyticsProtocol = AnalyticsDummy(),
        featureFlags: FeatureFlagsProtocol = FeatureFlagDummy(),
        serviceOne: ServiceOneProtocol = ServiceOneDummy(),
        serviceTwo: ServiceTwoProtocol = ServiceTwoDummy()
    ) -> DependencyContainer {
        .init(analytics: analytics,
              featureFlags: featureFlags,
              serviceOne: serviceOne,
              serviceTwo: serviceTwo)
    }
}
