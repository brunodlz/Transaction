import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backToTheFlow(_ sender: Any) {
        guard let controller = parent as? ViewController else {
            return
        }
        
        controller.showFirstSegue()
    }
}
