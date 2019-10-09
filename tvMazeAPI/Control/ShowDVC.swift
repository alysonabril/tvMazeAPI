import UIKit

class ShowDVC: UIViewController {

    
    var show: ShowResults!
    
    @IBOutlet weak var episodeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configureTableview() {
        episodeTableView.dataSource = self
    }
    
}

extension ShowDVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
