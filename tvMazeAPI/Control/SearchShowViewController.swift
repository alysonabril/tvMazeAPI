//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import UIKit

class SearchShowViewController: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var showsSearchBar: UISearchBar!
    
    var shows = [ShowResults]() {
        didSet {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }
    
    var searchText: String? = nil  {
        didSet {
            searchTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        searchTableView.dataSource = self
        showsSearchBar.delegate = self
        loadData()
    }
    private func loadData() {
        guard let searchText = searchText else {return}
        ShowAPIClient.shared.getShows(searchTerm: searchText) { result in
            switch result {
            case let .success(show):
                self.shows = show
            case .failure:
                print(AppError.noDataReceived)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let destination = segue.destination as? ShowDVC,
             let indexPath = searchTableView.indexPathForSelectedRow else {return}
         let selectedShow = shows[indexPath.row]
         destination.show = selectedShow
    }
}

extension SearchShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let show = shows[indexPath.row].show
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchShowTVCell
        cell.searchShowName?.text = show.name
        guard let imageURL = show.image?.medium else {return cell}
        ImageHelper.shared.getImage(urlString: imageURL) { result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let image):
                DispatchQueue.main.async {
                    cell.searchImage.image = image
                }
            }
        }
        return cell
    }
}

extension SearchShowViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchText = searchBar.text
        loadData()
    }
}
//cellheight = 320
