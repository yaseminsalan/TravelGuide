//
//  BookmarksViewController.swift
//  TravelGuide

import UIKit

class BookmarksViewController: UIViewController {
    
    @IBOutlet weak var bookmarksTableView: UITableView!
    
    
    private let viewModelBookmarks = BookmarksViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModelBookmarks.viewDelegateBookmarks = self
        
        viewModelBookmarks.didViewLoad()
        // Do any additional setup after loading the view.
    }
    


}
private extension BookmarksViewController{
    func setupUI(){
        bookmarksTableView.delegate = self
        bookmarksTableView.dataSource = self

    }
    
    
}
extension BookmarksViewController:BookmarksViewModelViewProtocol{
    func navigateToDetail(_ detailItem: DetailCellViewModel) {
 
        let vc = DetailViewController()
       
        let model = DetailModel(detailItem: detailItem)
        let vm = DetailViewModel(model: model)
        model.viewModel = vm
        vc.viewModel = vm
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    func didCellItemFetch() {
        //TODO
        
        DispatchQueue.main.async {
            self.bookmarksTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        //todo
    }
    
    func hideEmptyView() {
        //TODO
    }
    
   
    
    
}
extension BookmarksViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModelBookmarks.didClickItem(at:indexPath.row)
    }
    
    
}
extension BookmarksViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelBookmarks.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarksCell", for: indexPath) as! BookmarksTableViewCell
        let cellModel = viewModelBookmarks.getModel(at: indexPath.row)
    
        cell.bookmarksTitle.text = cellModel.title
        cell.bookmarksDescription.text = cellModel.description
        cell.bookmarksImage.image = UIImage(named: cellModel.imageUrl!)
      
        return cell
    }
    
   
    
    
}

