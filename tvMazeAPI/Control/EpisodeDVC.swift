import UIKit

class EpisodeDVC: UIViewController {

    
    var episodeDetails: Episode?
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeSeasonInfo: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeSummary: UITextView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func configureEpisodeDetails() {
        episodeName.text = episodeDetails?.name
        episodeSeasonInfo.text = "Season: " + String(episodeDetails?.season ?? 0)
        episodeNumber.text = "Episode: " + String(episodeDetails?.episodeNumber ?? 0)
        episodeSummary.text = episodeDetails?.summary
        
        guard let imageURL = episodeDetails?.image?.medium else {return}
        ImageHelper.shared.getImage(urlString: imageURL) { result in
                   
                   switch result {
                   case .failure(let error):
                       print(error)
                   case .success(let image):
                       DispatchQueue.main.async {
                        self.episodeImage.image = image
                       }
                   }
               }
        
    }

}
