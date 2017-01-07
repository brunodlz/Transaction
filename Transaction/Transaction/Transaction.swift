import Foundation

protocol Presentable {
    func startOn(current: UIViewController,
                 with: UIStoryboardSegue,
                 options: UIViewAnimationOptions)
    
    func swapFrom(viewController: UIViewController,
                  fromViewController: UIViewController,
                  toViewController: UIViewController,
                  options: UIViewAnimationOptions)
    
    func sizeFrom(viewController: UIViewController) -> CGSize
}

open class Transaction : Presentable {
    
    public init() {}
    
    open func startOn(current: UIViewController,
                      with withSegue: UIStoryboardSegue,
                      options: UIViewAnimationOptions) {
        
        guard current.childViewControllers.count > 0 else {
            swapFrom(viewController: current,
                     fromViewController: current.childViewControllers.last!,
                     toViewController: withSegue.destination,
                     options: options)
            return
        }
        
        let size = sizeFrom(viewController: current)
        
        current.addChildViewController(withSegue.destination)
        withSegue.destination.view.frame = CGRect(x: 0,
                                                  y: 0,
                                                  width: size.width,
                                                  height: size.height)
        
        current.view.addSubview(withSegue.destination.view)
        withSegue.destination.didMove(toParentViewController: current)
    }
    
    internal func swapFrom(viewController: UIViewController,
                           fromViewController: UIViewController,
                           toViewController: UIViewController,
                           options: UIViewAnimationOptions) {
        
        let size = sizeFrom(viewController: viewController)
        
        toViewController.view.frame = CGRect(x: 0,
                                             y: 0,
                                             width: size.width,
                                             height: size.height)
        
        fromViewController.willMove(toParentViewController: nil)
        viewController.addChildViewController(toViewController)
        
        viewController.transition(from: fromViewController,
                                  to: toViewController,
                                  duration: 0.4,
                                  options: options,
                                  animations: nil) { finished in
                                    fromViewController.removeFromParentViewController()
                                    toViewController.didMove(toParentViewController: viewController)
        }
    }
    
    func sizeFrom(viewController: UIViewController) -> CGSize {
        return viewController.view.frame.size
    }
    
}
