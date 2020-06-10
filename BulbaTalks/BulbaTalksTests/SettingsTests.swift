//
//  SettingsTests.swift
//  BulbaTalksTests
//
//  Created by Андрей Погосский on 6/10/20.
//  Copyright © 2020 CocoaHeadsBY. All rights reserved.
//
@testable import BulbaTalks
import XCTest

class SettingsTests: XCTestCase {
    /**
     Contains keys used to access data in UserDefaults.
     */
    private enum UserDefaultsKeys {
        static let activeConfiguration = "ActiveNetworkConfiguration"
    }

    func testResetMethodReinitializesSingleton() {
        // Given
        let oldSingleton = Settings.shared

        // When
        Settings.reset()

        // Then
        let newSingleton = Settings.shared
        XCTAssert(oldSingleton !== newSingleton)
    }

    func testSettingsIsInitializedWithMockConfigurationWhenUserDefaultsHasInvalidActiveConfigurationKey() {
        // Given
        let invalidValue = "InvalidValue"
        UserDefaults.standard.set(invalidValue, forKey: UserDefaultsKeys.activeConfiguration)
        Settings.reset()

        // When
        let activeNC = Settings.shared.activeNetworkConfiguration

        // Then
        XCTAssert(activeNC is MockNetworkConfiguration)
    }

    func testSettingsInitializedWithMockConfigurationWhenUserDefaultsHasEmptyActiveConfigurationKey() {
        // Given
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.activeConfiguration)
        Settings.reset()

        // When
        let activeNC = Settings.shared.activeNetworkConfiguration

        // Then
        XCTAssert(activeNC is MockNetworkConfiguration)
    }

    func testSettingsInitializedWithRemoteConfigurationWhenUserDefaultsHasRemoteActiveConfigurationKey() {
        // Given
        UserDefaults.standard.set(NetworkConfigurationType.remote.rawValue,
                                  forKey: UserDefaultsKeys.activeConfiguration)
        Settings.reset()

        // When
        let activeNC = Settings.shared.activeNetworkConfiguration

        // Then
        XCTAssert(activeNC is RemoteNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodChangesActiveNetworkConfigurationFromMockToRemote() {
        // Given
        Settings.shared.activateNewtorkConfiguration(of: .mock)

        // When
        Settings.shared.activateNewtorkConfiguration(of: .remote)

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is RemoteNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodChangesActiveNetworkConfigurationFromRemoteToMock() {
        // Given
        Settings.shared.activateNewtorkConfiguration(of: .remote)

        // When
        Settings.shared.activateNewtorkConfiguration(of: .mock)

        // Then
        let activeNC = Settings.shared.activeNetworkConfiguration
        XCTAssert(activeNC is MockNetworkConfiguration)
    }

    func testActivateNetworkConfigurationMethodStoresUpdatedRemoteActiveConfigurationInUserDefaults() {
        // Given
        Settings.shared.activateNewtorkConfiguration(of: .mock)

        // When
        Settings.shared.activateNewtorkConfiguration(of: .remote)

        // Then
        XCTAssertEqual(UserDefaults.standard.string(forKey: UserDefaultsKeys.activeConfiguration),
                       NetworkConfigurationType.remote.rawValue)
    }

    func testActivateNetworkConfigurationMethodStoresUpdatedMockActiveConfigurationInUserDefaults() {
        // Given
        Settings.shared.activateNewtorkConfiguration(of: .remote)

        // When
        Settings.shared.activateNewtorkConfiguration(of: .mock)

        // Then
        XCTAssertEqual(UserDefaults.standard.string(forKey: UserDefaultsKeys.activeConfiguration),
                       NetworkConfigurationType.mock.rawValue)
    }
}
