import Foundation

/**
 Stores the application settings.

 Allows to toggle between network configuration
 and persistently stores the configuration
 which is currently active.
 */
class Settings {
    /**
     The active network configuration.
     */
    private(set) var activeNetworkConfiguration: NetworkConfiguration

    /**
     A shared singleton settings object.
     */
    static let shared = Settings()

    /**
     Describes the keys for the user defaults database.
     */
    private enum Keys {
        /**
         The key associated with the active
         network configuration.
         */
        static let activeConfiguration = "ActiveNetworkConfiguration"
    }

    /**
     Initializes `Settings` object from the persistent storage.
     */
    private init() {
        activeNetworkConfiguration = MockNetworkConfiguration()

        if let configuration = UserDefaults.standard.string(forKey:
            Keys.activeConfiguration),
            let configurationType = NetworkConfigurationType(rawValue: configuration) {
            activeNetworkConfiguration = get(configurationType)
        }
    }

    /**
     Activates the network configuration with a given type.
        - Parameter type: Type of the network
     configuration to use.
     */
    func toggleNewtorkConfiguration(to type: NetworkConfigurationType) {
        UserDefaults.standard.set(type.rawValue, forKey: Keys.activeConfiguration)
        activeNetworkConfiguration = get(type)
    }

    /**
     Gets the given network configuration
     from the network configuration type.
     - Parameter type: The value
     of the type network configuration.
     - Returns: The active network configuration
     after type association.
     */
    private func get(_ type: NetworkConfigurationType) -> NetworkConfiguration {
        switch type {
        case .mock:
            return MockNetworkConfiguration()
        case .remote:
            return RemoteNetworkConfiguration()
        }
    }
}
