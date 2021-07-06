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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
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
    @objc func shareTapped() {
        guard let image = Picture.image?.jpegData(compressionQuality: 0.8) else {
            print("Image not found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
