//
//  DetailViewController.swift
//  TravelGuide
//
//  Created by amarenasoftware on 4.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var addBookmarkButton: UIButton!
    
    @IBOutlet weak var removeBookmarkButton: UIButton!
    
    
    
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
        //tıklama özelliğinim kapatma
        addBookmarkButton.isUserInteractionEnabled = false
        //tıklama özelliğinim açma
        removeBookmarkButton.isUserInteractionEnabled = true
    }
    
    @IBAction func removeBookmarkButton(_ sender: Any) {
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
        descriptionLabel.text = viewModel?.model.detailItem.description
        titleLabel.text = viewModel?.model.detailItem.title
        categoryLabel.text = viewModel?.model.detailItem.category ?? ""
        if ((viewModel?.model.detailItem.bookmarksControl) == true){
            print("kontrol\(viewModel?.model.detailItem.bookmarksControl)")
         
            
            addBookmarkButton.isHidden = true
            removeBookmarkButton.isHidden = false
            //tıklama özelliğinim kapatma
            addBookmarkButton.isUserInteractionEnabled = false
            //tıklama özelliğinim açma
            removeBookmarkButton.isUserInteractionEnabled = true
           
        }else{
            addBookmarkButton.isHidden = false
            removeBookmarkButton.isHidden = true
            //tıklama özelliğinim kapatma
            removeBookmarkButton.isUserInteractionEnabled = false
            //tıklama özelliğinim açma
            addBookmarkButton.isUserInteractionEnabled = true
        }
     
    }
    
    
}
extension DetailViewController:DetailViewModelViewProtocol{
    func didCellItemFetch() {
        //
        DispatchQueue.main.async {
            self.viewDidLoad()
        }
    }
    
    func showEmptyView() {
        //
    }
    
    func hideEmptyView() {
        //
    }
}
