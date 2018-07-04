## How to build

* Install dependencies:
```sh
$ brew install swiftgen
$ gem install bundler
$ bundle install
$ bundle exec pod install
```
* Decrypt existing `API.swift`:
```sh
$ brew install blackbox
$ blackbox_postdeploy
```
* OR create new one at `./Dota2Stats/Resources/Keys/API.swift` with content
```swift
import Foundation

let DOTA2_API_KEY = "<YOUR_API_KEY>"
```
* Open xcworkspace in Xcode >9.4 and run


## TODO

1. Codable instead of SwiftyJSON
2. SwiftGen for strings
3. Extenstions with static typing UIKit classes
4. More unit tests
5. Switch to newest Dota 2 API
6. More information to display