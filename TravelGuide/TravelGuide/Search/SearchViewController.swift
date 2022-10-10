//
//  SearchViewController.swift
//  TravelGuide


import UIKit

class SearchViewController: UIViewController {
    private let viewModel = SearchViewModel()
    var buttonTitleControl:String="flights"
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
        buttonTitleControl = "flights"
        searchTextField.text = ""
        searchTextField.placeholder = "Search Flights"
        searchTextField.resignFirstResponder()
        tableViewVisibilityControl()

    }
    
   
    @IBAction func hotelsButton(_ sender: Any) {
        linesLeftLabel.isHidden = true
        linesTrailingLabel.isHidden = false
        buttonTitleControl = "hotels"
        searchTextField.text = ""
        searchTextField.resignFirstResponder()
        searchTextField.placeholder = "Search Hotel"
        tableViewVisibilityControl()
    }
    

    
    @objc func textFieldDidChange(_ textField: UITextField) {
            viewModel.getDataUpdate(selectButton: buttonTitleControl, textDidChange: textField.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableViewVisibilityControl()
        viewModel.viewDelegateSearch = self
        
        viewModel.didViewLoad()
    }
    


}
private extension SearchViewController{
    func setupUI(){
        linesLeftLabel.isHidden = false
        linesTrailingLabel.isHidden = true
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTextField.addTarget(self, action: #selector(SearchViewController.textFieldDidChange(_:)), for: .editingChanged)
     
     
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
        let cellModel = viewModel.getModel(at: indexPath.row)
        cell.searchTitle.text = cellModel.title
        cell.searchDescription.text = cellModel.description

        cell.searchImage.image = UIImage(named: cellModel.imageUrl ?? "Image1" )
        return cell
    }
    
   
    
    
}


