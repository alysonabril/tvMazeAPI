import UIKit

class ShowDVC: UIViewController {

    
    @IBOutlet weak var episodeTableView: UITableView!
    
    var showID: Int!
    var episodes = [Episode](){
        didSet {
            self.episodeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configureTableview() {
        episodeTableView.dataSource = self
        loadData()
    }
    
    private func loadData() {
        EpisodeAPIClient.shared.getEpisodes(id: 1) { result in
            switch result {
            case let .success(episode):
                self.episodes = episode
            case .failure:
                print(AppError.noDataReceived)
            }
        }
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
