# SwiftLint

This file describes how to set up and integrate SwiftLint into our project.

### How to set up the environment

1. [Install SwiftLint via Homebrew](https://github.com/realm/SwiftLint#using-homebrew).
2. [Integrate SwiftLint into an Xcode scheme](https://github.com/realm/SwiftLint#xcode). Just add a new ["Run Script Phase"](https://stackoverflow.com/questions/39632301/where-is-the-run-script-and-build-phase-in-xcode).
3. [Configure SwiftLint](https://github.com/realm/SwiftLint#configuration) by adding a [.swiftlint.yml](../.swiftlint.yml) file to the project root directory.

**NOTE:** We are currently using the default set of [rules](https://realm.github.io/SwiftLint/rule-directory.html) of SwiftLint because `.swiftlint.yml` file is empty.

### Useful links:

- [SwiftLint](https://github.com/realm/SwiftLint)
- [SwiftLint — чистота и порядок в iOS проекте](https://habr.com/ru/company/tinkoff/blog/317892/)
