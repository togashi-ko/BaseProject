//
//  TestRequestViewModel.swift
//  AlamofireBase
//
//  Created by 冨樫公一 on 2018/04/10.
//  Copyright © 2018年 冨樫公一. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation

class TestRequestViewModel: NSObject {
    
    let param = TestRequestParameter()
    
    let request: SampleRequest = SampleRequest()
    let disposeBag = DisposeBag()

    let firstName: Variable<String> = Variable("名前")
    let famiryName: Variable<String> = Variable("苗字")
    let age: Variable<Int> = Variable(99)


    
    func loadDate() {
        request.get(requestParameter: param).subscribe(
            onNext: { [unowned self] in
                self.firstName.value = $0.firstName
                self.famiryName.value = $0.famiryName
                self.age.value = $0.age
                print("success")
                
            },
            onError: { error in
                print(error)
        })
            .disposed(by: disposeBag)

    }
    
}
