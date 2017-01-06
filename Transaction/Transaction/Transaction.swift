import Foundation

open class Transaction {
    
    public init() {}
    
    open func startOn(_ currentViewController: UIViewController,
                        withSegue: UIStoryboardSegue,
                        options: UIViewAnimationOptions) {
        
        if currentViewController.childViewControllers.count > 0 {
            swapFromViewController(currentViewController,
                                   fromViewController: currentViewController.childViewControllers.last!,
                                   toViewController: withSegue.destination,
                                   options: options)
        } else {
            currentViewController.addChildViewController(withSegue.destination)
            withSegue.destination.view.frame = CGRect(x: 0, y: 0,
                                                                        width: currentViewController.view.frame.size.width,
                                                                        height: currentViewController.view.frame.size.height)
            currentViewController.view.addSubview(withSegue.destination.view)
            withSegue.destination.didMove(toParentViewController: currentViewController)
        }
    }
    
    fileprivate func swapFromViewController(_ currentViewController: UIViewController,
                                        fromViewController: UIViewController,
                                        toViewController: UIViewController,
                                        options: UIViewAnimationOptions) {
        
        toViewController.view.frame = CGRect(x: 0, y: 0,
                                                 width: currentViewController.view.frame.size.width,
                                                 height: currentViewController.view.frame.size.height)
        
        fromViewController.willMove(toParentViewController: nil)
        currentViewController.addChildViewController(toViewController)
        
        currentViewController.transition(from: fromViewController,
                                                           to: toViewController,
                                                           duration: 0.4,
                                                           options: options,
                                                           animations: nil) { finished in
                                                            fromViewController.removeFromParentViewController()
                                                            toViewController.didMove(toParentViewController: currentViewController)
        }
    }
    
}
