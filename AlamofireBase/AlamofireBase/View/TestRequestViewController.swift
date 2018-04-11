//
//  TestRequestViewController.swift
//  AlamofireBase
//
//  Created by 冨樫公一 on 2018/04/10.
//  Copyright © 2018年 冨樫公一. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TestRequestViewController: UIViewController {

    let viewModel = TestRequestViewModel()
    let disposeBag = DisposeBag()

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    @IBOutlet weak var requestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bind()
    }
    
    func initialize() {
        firstNameLabel.text = "名前"
        lastNameLabel.text = "苗字"
        ageLabel.text = "99"

    }
    
    func bind() {
        
        requestButton.rx.tap
            .subscribe( onNext: { _ in
                self.viewModel.loadDate()
            })
            .disposed(by: disposeBag)

        viewModel.firstName.asObservable()
            .subscribe(onNext: { [unowned self] in
                self.firstNameLabel.text = $0
            })
            .disposed(by: disposeBag)
        
        viewModel.famiryName.asObservable()
            .subscribe(onNext: { [unowned self] in
                self.lastNameLabel.text = $0
            })
            .disposed(by: disposeBag)

        viewModel.age.asObservable()
            .subscribe(onNext: { [unowned self] in
                self.ageLabel.text = $0.description
            })
            .disposed(by: disposeBag)

    }
}
