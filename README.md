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

Then run `pod install` with CocoaPods 0.36 or newer.

## Usage

```Swift
import Transaction
```
```Swift
override func viewDidLoad() {
        super.viewDidLoad()

        performSegueWithIdentifier("FlowOne", sender: nil)
    }
```
```Swift
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "FlowOne" {
            transaction.startOn(self, withSegue: segue, options: .TransitionFlipFromTop)
        } else if segue.identifier == "FlowTwo" {
            transaction.startOn(self, withSegue: segue, options: .TransitionFlipFromRight)
        }
    }
```
## Support

Please, don't hesitate to [file an
issue](https://github.com/brunodlz/Transaction/issues/new) if you have questions.
