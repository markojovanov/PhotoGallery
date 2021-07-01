import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var Picture: UIImageView!
    var imageOutput: String?
    var numberOfImage: Int?
    var numberOfAllImages: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Picture \(numberOfImage!) of \(numberOfAllImages!)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageLoad = imageOutput {
            Picture.image = UIImage(named: imageLoad)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
