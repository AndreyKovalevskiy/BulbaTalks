import Foundation

/**
 The object `Settings`.

 The object contains methods for switching between
 `remote`/`mock` network configuration and property
 to get the current configuration.
 */
class Settings {
    /// A value that contains the current network configuration.
    private(set) var currentConfiguration: NetworkConfiguration

    /// An instance of the `Settings` type.
    static let shared = Settings()

    /// A value that contains the shared defaults object.
    private let defaults = UserDefaults.standard

    /// A value that contains the key for configuration of `UserDefaults`
    private let keyConfiguration = "ActiveConfiguration"

    /// Initialization of the current configuration from `UserDefaults`.
    private init() {
        currentConfiguration = MockNetworkConfiguration()
        if let configuration = defaults.string(forKey: keyConfiguration) {
            currentConfiguration = setConfiguration(configuration)
        }
    }

    /// Switch the network configuration to `Remote`.
    func activeRemote() {
        defaults.set(ConfigurationType.remote.rawValue, forKey: keyConfiguration)
        currentConfiguration = setConfiguration(defaults.string(forKey: keyConfiguration)!)
    }

    /// Switch the network configuration to `Mock`.
    func activeMock() {
        defaults.set(ConfigurationType.mock.rawValue, forKey: keyConfiguration)
        currentConfiguration = setConfiguration(defaults.string(forKey: keyConfiguration)!)
    }

    /**
     Set the current configuration.
     - Parameter type: The value of the type current configuration.
     - Returns: The the current configuration.
     */
    private func setConfiguration(_ type: ConfigurationType.RawValue) -> NetworkConfiguration {
        return (type == ConfigurationType.mock.rawValue) ? MockNetworkConfiguration() : RemoteNetworkConfiguration()
    }
}
