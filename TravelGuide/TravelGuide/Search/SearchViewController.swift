//
//  SearchViewController.swift
//  TravelGuide


import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var noDataImage: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var linesLeftLabel: UILabel!
    @IBOutlet weak var searchTableView: UITableView!
    
    @IBOutlet weak var linesTrailingLabel: UILabel!
    @IBOutlet weak var flightsButton: UIButton!
    
    @IBOutlet weak var hotelsButton: UIButton!
    
    @IBAction func flightsButton(_ sender: Any) {
        linesLeftLabel.isHidden = false
        linesTrailingLabel.isHidden = true
        
        
        viewModel.getDataUpdate(filterdata: [])
        // self.searchTableView.reloadData()
        
    }
    
    @IBAction func hotelsButton(_ sender: Any) {
        linesLeftLabel.isHidden = true
        linesTrailingLabel.isHidden = false
    }
    
    private let viewModel = SearchViewModel()
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableViewVisibilityControl()
        viewModel.viewDelegateSearch = self
        
        viewModel.didViewLoad()
        // Do any additional setup after loading the view.
    }
    


}
private extension SearchViewController{
    func setupUI(){
        linesLeftLabel.isHidden = false
        linesTrailingLabel.isHidden = true
        searchTableView.delegate = self
        searchTableView.dataSource = self
     
     
    }
    func tableViewVisibilityControl(){
        searchTableView.isHidden = true
        noDataImage.isHidden = true
        noDataLabel.isHidden = true
    }
    
    
}
extension SearchViewController:SearchViewModelViewProtocol{
    func navigateToDetail(_ detailItem: DetailCellViewModel) {
       
        
        let vc = DetailViewController()
       
        let model = DetailModel(detailItem: detailItem)
        let vm = DetailViewModel(model: model)
        model.viewModel = vm
        vc.viewModel = vm
        vc.modalPresentationStyle = .fullScreen
       // navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true)
        
    }
    
    func didCellItemFetch() {
        //TODO
        searchTableView.isHidden = false
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        //todo
        searchTableView.isHidden = true
        noDataImage.isHidden = false
        noDataLabel.isHidden = false

    }
    
    func hideEmptyView() {
        //TODO
     
    }
    
   
    
    
}
extension SearchViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        viewModel.didClickItem(at:indexPath.row)
    }
    
    
}
extension SearchViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
      
        return cell
    }
    
   
    
    
}

