import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            let fileManager = FileManager.default
            let path = Bundle.main.resourcePath!
            let items = try! fileManager.contentsOfDirectory(atPath: path)
            for item in items{
                if item.hasPrefix("nssl"){
                    self?.pictures.append(item)
                }
            }
        }
        DispatchQueue.main.async {
            [weak self] in
            self?.tableView.reloadData()
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(recomendApp))
    }
    
    func sortPictures(pictures: [String]) -> [String]{
        return pictures.sorted();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = sortPictures(pictures: pictures)[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.imageOutput=sortPictures(pictures: pictures)[indexPath.row]
            vc.numberOfImage=indexPath.row + 1
            vc.numberOfAllImages=pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc func recomendApp() {
        let vc = UIActivityViewController(activityItems: ["You need to start using this application"],
                                          applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }
}
