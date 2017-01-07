import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showNextFlow(_ sender: Any) {
        guard let controller = parent as? ViewController else {
            return
        }
        
        controller.showSecondSegue()
    }
}
