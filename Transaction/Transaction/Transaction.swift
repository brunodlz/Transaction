import Foundation

public class Transaction {
    
    public init() {}
    
    public func startOn(currentViewController: UIViewController,
                        withSegue: UIStoryboardSegue,
                        options: UIViewAnimationOptions) {
        
        if currentViewController.childViewControllers.count > 0 {
            swapFromViewController(currentViewController,
                                   fromViewController: currentViewController.childViewControllers.last!,
                                   toViewController: withSegue.destinationViewController,
                                   options: options)
        } else {
            currentViewController.addChildViewController(withSegue.destinationViewController)
            withSegue.destinationViewController.view.frame = CGRectMake(0, 0,
                                                                        currentViewController.view.frame.size.width,
                                                                        currentViewController.view.frame.size.height)
            currentViewController.view.addSubview(withSegue.destinationViewController.view)
            withSegue.destinationViewController.didMoveToParentViewController(currentViewController)
        }
    }
    
    private func swapFromViewController(currentViewController: UIViewController,
                                        fromViewController: UIViewController,
                                        toViewController: UIViewController,
                                        options: UIViewAnimationOptions) {
        
        toViewController.view.frame = CGRectMake(0, 0,
                                                 currentViewController.view.frame.size.width,
                                                 currentViewController.view.frame.size.height)
        
        fromViewController.willMoveToParentViewController(nil)
        currentViewController.addChildViewController(toViewController)
        
        currentViewController.transitionFromViewController(fromViewController,
                                                           toViewController: toViewController,
                                                           duration: 0.4,
                                                           options: options,
                                                           animations: nil) { finished in
                                                            fromViewController.removeFromParentViewController()
                                                            toViewController.didMoveToParentViewController(currentViewController)
        }
    }
    
}
