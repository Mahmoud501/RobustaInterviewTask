//
//  ListScreenVC.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import UIKit

class ListScreenVC: UIViewController {

    
    //ui variables -> Logic
    var presenter: ListScreenPresenter?
    var isHeaderShown = false
    
    //ui variables -> Component
    var emptyGetView: EmptyData!
    var refreshControl = UIRefreshControl()
    var headerView: SearchHeaderView!
    ///////////////////////////////////////////////////////////////////////////
    
    //outlets
    @IBOutlet weak var TVRepo: UITableView!
    @IBOutlet weak var activityGetList: UIActivityIndicatorView!
    @IBOutlet weak var vuContain: UIView!
    @IBOutlet weak var skeletonViw: SkeletonProfileView!
    
    
    //actions
    @IBAction func searchClicked(_ sender: Any) {
        isHeaderShown = !isHeaderShown
        self.TVRepo.reloadData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.getList()
    }

}


// life cycle

extension ListScreenVC {
    
    //for skeletonView config
    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if presenter == nil {
            presenter = ListScreenPresenter.init(GetListView: self)
        }
        setupUI()
        initFunc()
    }
    
}

//setupUI
extension ListScreenVC {

    func setupUI() {
        TVRepo.register(UINib.init(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: "RepoCell")
        
        //setupEmpty View
        emptyGetView = EmptyData.init()
        emptyGetView.setupViewConstraint(vu: self.vuContain)
        self.emptyGetView.alpha = 0
        emptyGetView.didClickedButton = { [weak self] in
            guard let self = self else { return }
            self.emptyGetView.alpha = 0
            self.showSkeleton(true)
            self.getList()
        }
        
        //setup Pull
        setupPullToRefresh()
        //setup searchView
        setupHeaderView()
       
    }
    
    //setupHeaderView = Search =>
    //logic when clicked search button the view will appear or disappear
    func setupHeaderView() {
        headerView = SearchHeaderView.init()
        headerView.didChangeText = { [weak self] text in
            guard let self = self else { return }
            print(text)
        }
    }
    
    func showSkeleton(_ val: Bool) {
        if val == true {
            DispatchQueue.main.async {
                self.view.showAnimatedGradientSkeleton()
                self.skeletonViw.showAnimatedGradientSkeleton()
            }
            self.vuContain.alpha = 0
        }else {
            self.skeletonViw.hideSkeleton(transition: .crossDissolve(0.3))
            self.vuContain.alpha = 1
        }
    }
    
    func setupPullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.TVRepo.addSubview(refreshControl) // not required when using UITableViewController
    }

}

//business of ui like binding | of any logic
extension ListScreenVC {

    // init Func: Is Function include all methods that begin with start of loading screen
    func initFunc() {
        self.showSkeleton(true)
        self.getList()
    }
    
    func getList() {
        presenter?.getRepoList()
    }


}
