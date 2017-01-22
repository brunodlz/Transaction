import Foundation

protocol Presentable {
    func startOn(current: UIViewController,
                 destination: UIViewController,
                 animation: UIViewAnimationOptions)
}

open class Transaction: Presentable {

    public init() {}

    open func startOn(current: UIViewController,
                      destination: UIViewController,
                      animation: UIViewAnimationOptions) {

        guard current.childViewControllers.count > 0 else {
            addChildViewController(current: current,
                                   destination: destination,
                                   options: animation)
            return
        }

        guard let viewController = current.childViewControllers.last else {
            fatalError("should have a view controller")
        }

        swapFrom(viewController: current,
                 fromViewController: viewController,
                 toViewController: destination,
                 options: animation)
}

    fileprivate func addChildViewController(current: UIViewController,
                                            destination: UIViewController,
                                            options: UIViewAnimationOptions) {
        let size = sizeFrom(viewController: current)

        current.addChildViewController(destination)
        destination.view.frame = CGRect(x: 0,
                                        y: 0,
                                        width: size.width,
                                        height: size.height)

        current.view.addSubview(destination.view)
        destination.didMove(toParentViewController: current)
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
