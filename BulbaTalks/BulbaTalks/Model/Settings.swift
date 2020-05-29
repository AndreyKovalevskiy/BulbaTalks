import Foundation

/**
 Contains a method for toggle between
 `Remote`/`Mock` network configuration and property
 to get the active configuration.
 */
class Settings {
    /**
     A value that contains the active network configuration.
     */
    private(set) var activeConfiguration: NetworkConfiguration

    /**
     A shared singleton settings object.
     */
    static let shared = Settings()

    /**
     Describes the keys for the user defaults database.
     */
    private enum Keys {
        /**
         A value that contains the key with which to associate
         the active network configuration.
         */
        static let activeConfigurationKey = "ActiveConfiguration"
    }

    /**
     Initialization of the active configuration from `UserDefaults`.
     */
    private init() {
        activeConfiguration = MockNetworkConfiguration()

        if let configuration = UserDefaults.standard.string(forKey:
            Keys.activeConfigurationKey) {
            activeConfiguration = sets(configuration)
        }
    }

    /**
     Toggle between the network configuration.
        - Parameter type: Type of network configuration.
     */
    func toggleNewtorkConfiguration(to type: NetworkConfigurationType) {
        UserDefaults.standard.set(type.rawValue, forKey: Keys.activeConfigurationKey)
        activeConfiguration = sets(type.rawValue)
    }

    /**
     Sets the active network configuration.
     - Parameter networkConfiguration: The value of the type active configuration.
     - Returns: The active network configuration after type association.
     */
    private func sets(_ networkConfiguration: String) -> NetworkConfiguration {
        return (networkConfiguration == NetworkConfigurationType.mock.rawValue) ?
            MockNetworkConfiguration() : RemoteNetworkConfiguration()
    }
}
