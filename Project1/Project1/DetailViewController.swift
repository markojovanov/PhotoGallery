//
//  DetailViewController.swift
//  Project1
//
//  Created by Finki User on 30.6.21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var Picture: UIImageView!
    var imageOutput: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title=imageOutput
        navigationItem.largeTitleDisplayMode = .never
        if let imageLoad = imageOutput {
            Picture.image = UIImage(named: imageLoad)
        }

        // Do any additional setup after loading the view.
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
