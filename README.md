# Transaction

Using Transaction, you will handle the flow between your segues much easier.

### [CocoaPods]

[CocoaPods]: http://cocoapods.org

Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

```ruby
pod 'Transaction'
```

You will also need to make sure you're opting into using frameworks:

```ruby
use_frameworks!
```

Then run `pod install`

## Swift Version

Use the table below to determine which versions of Transaction are compatible with your project.

|Swift version        |Transaction version |
|:--------------------|:-------------------|
|Swift 3              |v1.0.1 or later     |
|Swift 2.2 / Swift 2.3|v1.0.0              |

## Usage

```Swift
import Transaction
```
```Swift
override func viewDidLoad() {
        super.viewDidLoad()

        performSegue(withIdentifier: Segue.First.rawValue, sender: nil)
    }
```
```Swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.First.rawValue {
            animation.startOn(current: self, destination: segue.destination, animation: .transitionFlipFromRight)
        } else if segue.identifier == Segue.Second.rawValue {
            animation.startOn(current: self, destination: segue.destination, animation: .transitionFlipFromLeft)
        }
    }
```

## Demo

- [x] Storyboard
- [ ] ViewCode

## Support

Please, don't hesitate to [file an
issue](https://github.com/brunodlz/Transaction/issues/new) if you have questions.

## Author

Bruno da Luz. :octocat: [GitHub](https://github.com/brunodlz) :bird: [Twitter](https://twitter.com/brunodlz)

## License

This project is distributed under the [MIT License](https://raw.githubusercontent.com/brunodlz/Transaction/develop/LICENSE)

