# Transaction

Using Transaction, you will handle the flow between your segues much easier.

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
