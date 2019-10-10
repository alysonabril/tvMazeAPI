import UIKit

class ShowDVC: UIViewController {

    
    @IBOutlet weak var episodeTableView: UITableView!
    
    var showID: Int!
    var episodes = [Episode](){
        didSet {
            DispatchQueue.main.async {
            self.episodeTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableview()
    }
    
    private func configureTableview() {
        episodeTableView.dataSource = self
        loadData()
    }
    
    private func loadData() {
        EpisodeAPIClient.shared.getEpisodes(id: showID) { result in
            switch result {
            case let .success(episode):
                self.episodes = episode
            case .failure:
                print(AppError.noDataReceived)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? EpisodeDVC,
            let indexPath = episodeTableView.indexPathForSelectedRow else {return}
        let selectedEpisode = episodes[indexPath.row]
        destination.episodeDetails = selectedEpisode
    }
}

extension ShowDVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = episodes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath ) as! EpisodeTVCell
        cell.episodeNameLabel?.text = episode.name
        cell.episodeInfoLabel?.text = "S: \(episode.season)  E: \(episode.episodeNumber)"
        
        guard let imageURL = episode.image?.medium else {return cell}
        ImageHelper.shared.getImage(urlString: imageURL) { result in
                   
                   switch result {
                   case .failure(let error):
                       print(error)
                   case .success(let image):
                       DispatchQueue.main.async {
                           cell.episodeImage.image = image
                       }
                   }
               }
               return cell
    }
    
    
    
}
