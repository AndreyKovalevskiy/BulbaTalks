@testable import BulbaTalks
import XCTest

class SettingsTests: XCTestCase {
    let userDefaultsActiveConfigurationKey = "ActiveNetworkConfiguration"

    func testResetMethodReinitializeSingleton() {
        // Given
        let oldSingleton = Settings.shared

        // When
        Settings.reset()
        let newSingleton = Settings.shared

        // Then
        XCTAssert(oldSingleton !== newSingleton)
    }

    func testActivateNetworkConfigurationVariableInitializedWithMockConfigurationWhenInUserDefaultsInvalidValue() {
        // Given
        UserDefaults.standard.set("InvalidValue", forKey: userDefaultsActiveConfigurationKey)
        Settings.reset()

        // When
        let currentNC = Settings.shared.activeNetworkConfiguration

        // Then
        XCTAssert(currentNC is MockNetworkConfiguration)
    }

    func testActivateNetworkConfigurationVariableInitializedWithMockConfigurationWhenUserDefaultsIsEmpty() {
        // Given
        UserDefaults.standard.removeObject(forKey: userDefaultsActiveConfigurationKey)
        Settings.reset()

        // When
        let currentNC = Settings.shared.activeNetworkConfiguration

        // Then
        XCTAssert(currentNC is MockNetworkConfiguration)
    }

    func testActivateNetworkConfigurationVariableInitializedWithRemoteConfigurationWhenInUserDefaultsStoresRemote() {
        // Given
        UserDefaults.standard.set(NetworkConfigurationType.remote.rawValue, forKey: userDefaultsActiveConfigurationKey)
        Settings.reset()

        // When
        let currentNC = Settings.shared.activeNetworkConfiguration

        // Then
        XCTAssert(currentNC is RemoteNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodSuccessfullyChangedCurrentNetworkConfigurationFromMockToRemote() {
        // Given
        Settings.shared.activateNewtorkConfiguration(of: .mock)

        // When
        Settings.shared.activateNewtorkConfiguration(of: .remote)
        let currentNC = Settings.shared.activeNetworkConfiguration

        // Then
        XCTAssert(currentNC is RemoteNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodSuccessfullyChangedCurrentNetworkConfigurationFromRemoteToMock() {
        // Given
        Settings.shared.activateNewtorkConfiguration(of: .remote)

        // When
        Settings.shared.activateNewtorkConfiguration(of: .mock)
        let currentNC = Settings.shared.activeNetworkConfiguration

        // Then
        XCTAssert(currentNC is MockNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodChangedUserDefaultsWhenSwitchNetworkConfigurationFromMockToRemote() {
        // Given
        Settings.shared.activateNewtorkConfiguration(of: .mock)

        // When
        Settings.shared.activateNewtorkConfiguration(of: .remote)

        // Then
        XCTAssertEqual(UserDefaults.standard.string(forKey: userDefaultsActiveConfigurationKey),
                       NetworkConfigurationType.remote.rawValue)
    }

    func testActivateNetworkConfigurationMethodChangedUserDefaultsWhenSwitchNetworkConfigurationFromRemoteToMock() {
        // Given
        Settings.shared.activateNewtorkConfiguration(of: .remote)

        // When
        Settings.shared.activateNewtorkConfiguration(of: .mock)

        // Then
        XCTAssertEqual(UserDefaults.standard.string(forKey: userDefaultsActiveConfigurationKey),
                       NetworkConfigurationType.mock.rawValue)
    }
}
