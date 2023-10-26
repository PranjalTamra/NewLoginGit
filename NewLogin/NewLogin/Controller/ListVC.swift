//
//  ListVC.swift
//  NewLogin
//
//  Created by Pranjal Tmarakar on 26/10/23.
//

import UIKit
import SDWebImage

public var pageNo:Int=1

class ListVC: UIViewController, LKPullToLoadMoreDelegate {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var dataModel : ListViewModel?
    var filteredItems: [DataList] = []
    var isPullDown = false
    var loadMoreControl: LKPullToLoadMore!


    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                                    #selector(handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMoreControl = LKPullToLoadMore(imageHeight: 40, viewWidth: tableView.frame.width, tableView: tableView)
        loadMoreControl.enable(true)
        loadMoreControl.delegate = self
        loadMoreControl.resetPosition()
        self.dataModel = ListViewModel()
        self.dataModel?.vc = self
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self

        let tablenNib:UINib = UINib(nibName: "DataTableViewCell", bundle: nil)
        tableView.register(tablenNib, forCellReuseIdentifier: "DataTableViewCell")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.dataModel?.listApi{[weak self] in
            self?.filteredItems = self?.dataModel?.dataArray?.data as? [DataList] ?? []
            self?.tableView.reloadData()

        }
    }
    
    
    func loadMore() {
        if !isPullDown{
            
            self.dataModel?.listApi{[weak self] in
                
                self?.filteredItems = self?.dataModel?.dataArray?.data as? [DataList] ?? []
                self?.tableView.reloadData()

            }
            
          
        }
    }
 
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView{
            loadMoreControl.scrollViewDidScroll(scrollView)
        }
        
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == tableView{
            loadMoreControl.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
        }
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        isPullDown = true
        pageNo = 1
        
        tableView.reloadData()
        refreshControl.endRefreshing()
        self.dataModel?.listApi{[weak self] in
            self?.filteredItems = self?.dataModel?.dataArray?.data as? [DataList] ?? []
            self?.tableView.reloadData()

            print("12", self?.filteredItems as Any)
        }
        
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource methods
extension ListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as! DataTableViewCell
        
        let dic = filteredItems[indexPath.row]
        if let firstName = dic.first_name, let lastName = dic.last_name {
            cell.nameLbl.text = firstName + " " + lastName
        }
        cell.emailLbl.text = dic.email
        cell.imagePic.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.imagePic.sd_setImage(with: URL(string: dic.avatar ?? ""), placeholderImage: UIImage(named: "") )
      
        
        
        return cell
    }

    
}
//MARK: - UISearchBarDelegate methods
extension ListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredItems = self.dataModel?.dataArray?.data as? [DataList] ?? []
        } else {
            filteredItems = (self.dataModel?.dataArray?.data)?.filter { DataList in

                return DataList.first_name?.lowercased().contains(searchText.lowercased()) ?? false
            } as? [DataList] ?? []
        }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredItems = self.dataModel?.dataArray?.data as? [DataList] ?? []
        tableView.reloadData()
    }
}


