//
//  MobileDataTableViewController.swift
//  MobileDataUsage
//
//  Created by Weidian on 15/1/20.
//  Copyright © 2020 sph. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import DIKit

class MobileDataTableViewController: UITableViewController {
    @Inject var viewModel: MobileDataTableViewModel

    private let disposeBag = DisposeBag()
    
    // Builder pattern
    static func build() -> MobileDataTableViewController {
        let storageBoard = UIStoryboard(name: "MobileDataTableView", bundle: nil)
        let viewController = storageBoard.instantiateViewController(withIdentifier: "mobileDataTableView")
        viewController.title = "Mobile Data"
        guard let mViewController = viewController as? MobileDataTableViewController else {
            fatalError("Cannot instantiate view controller")
        }
        return mViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = MobileDataTableItemCell.HEIGHT
        tableView.rowHeight = MobileDataTableItemCell.HEIGHT

        tableView.delegate = nil
        tableView.dataSource = nil

        tableView.register(MobileDataTableItemCell.self, forCellReuseIdentifier: MobileDataTableItemCell.ReuseIdentifier)

        bindViewModel()
    }
}

extension MobileDataTableViewController {
    
    private func bindViewModel() {
        let output = viewModel.transform(input: nil)
            
        output.mobileDataItems
            .drive(tableView.rx.items(cellIdentifier: MobileDataTableItemCell.ReuseIdentifier, cellType: MobileDataTableItemCell.self)) { (row, element, cell) in
                cell.lblYear.text = element.year
                cell.lblVolume.text = element.volume
                cell.btnDropped.isHidden = !element.decreased
            }.disposed(by: disposeBag)
    }
}
