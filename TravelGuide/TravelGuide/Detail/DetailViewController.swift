//
//  DetailViewController.swift
//  TravelGuide


import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var addBookmarkButton: UIButton!
    @IBOutlet weak var removeBookmarkButton: UIButton!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addBookmarkButton(_ sender: Any) {

        viewModel?.didSaveCoreData()
        
        addBookmarkButton.isHidden = true
        removeBookmarkButton.isHidden = false
        //turn off the click feature
        addBookmarkButton.isUserInteractionEnabled = false
        //turn on my click feature
        removeBookmarkButton.isUserInteractionEnabled = true
    }
    
    @IBAction func removeBookmarkButton(_ sender: Any) {
        viewModel?.didDeleteCoreData()
        addBookmarkButton.isHidden = false
        removeBookmarkButton.isHidden = true
        //turn off the click feature
        addBookmarkButton.isUserInteractionEnabled = true
        //turn on my click feature
        removeBookmarkButton.isUserInteractionEnabled = false
    }
    
    var viewModel:DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDelegateDetail = self
        viewModel?.didViewLoad()
        setupUI()
    
    }
   

}
private extension DetailViewController{
    func setupUI(){
       
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        detailImage.image = UIImage(named: (viewModel?.model.detailItem.imageUrl)!)
        descriptionLabel.text = viewModel?.model.detailItem.description
        titleLabel.text = viewModel?.model.detailItem.title
        categoryLabel.text = viewModel?.model.detailItem.category ?? ""
        if ((viewModel?.model.detailItem.bookmarksControl) == true){
            addBookmarkButton.isHidden = true
            removeBookmarkButton.isHidden = false
            //turn off the click feature
            addBookmarkButton.isUserInteractionEnabled = false
            //turn on my click feature
            removeBookmarkButton.isUserInteractionEnabled = true
           
        }else{
            addBookmarkButton.isHidden = false
            removeBookmarkButton.isHidden = true
            //turn off the click feature
            removeBookmarkButton.isUserInteractionEnabled = false
            //turn on my click feature
            addBookmarkButton.isUserInteractionEnabled = true
        }
     
    }
    
    
}
extension DetailViewController:DetailViewModelViewProtocol{
    func didCellItemFetch() {
        
        DispatchQueue.main.async {
            self.viewDidLoad()
        }
    }
    
}
