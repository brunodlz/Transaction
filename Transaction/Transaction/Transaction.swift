import Foundation

protocol Presentable {
    func startOn(current: UIViewController,
                 with segue: UIStoryboardSegue,
                 options animation: UIViewAnimationOptions)
}

open class Transaction : Presentable {
    
    public init() {}
    
    open func startOn(current: UIViewController,
                      with segue: UIStoryboardSegue,
                      options animation: UIViewAnimationOptions) {
        
        guard current.childViewControllers.count > 0 else {
            addChildViewController(current: current,
                                   with: segue,
                                   options: animation)
            return
        }
        
        swapFrom(viewController: current,
                 fromViewController: current.childViewControllers.last!,
                 toViewController: segue.destination,
                 options: animation)
    }
    
    fileprivate func addChildViewController(current: UIViewController,
                                            with segue: UIStoryboardSegue,
                                            options: UIViewAnimationOptions) {
        let size = sizeFrom(viewController: current)
        
        current.addChildViewController(segue.destination)
        segue.destination.view.frame = CGRect(x: 0,
                                              y: 0,
                                              width: size.width,
                                              height: size.height)
        
        current.view.addSubview(segue.destination.view)
        segue.destination.didMove(toParentViewController: current)
    }
    
    fileprivate func swapFrom(viewController: UIViewController,
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
    
    fileprivate func sizeFrom(viewController: UIViewController) -> CGSize {
        return viewController.view.frame.size
    }
    
}
