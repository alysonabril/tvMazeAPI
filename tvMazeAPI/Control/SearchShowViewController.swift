//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class SearchShowViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    
    var shows = [ShowResults]() {
        didSet {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureTableView() {
        searchTableView.dataSource = self
        loadData()
    }
    private func loadData() {
    }

}

extension SearchShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
//cellheight = 320
