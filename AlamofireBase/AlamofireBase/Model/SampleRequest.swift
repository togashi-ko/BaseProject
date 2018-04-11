//
//  SampleRequest.swift
//  AlamofireBase
//
//  Created by 冨樫公一 on 2018/04/10.
//  Copyright © 2018年 冨樫公一. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

class SampleRequest: RequestBase {
    func get(requestParameter: TestRequestParameter) -> Observable<TestObject> {
        return createSingle(withURLString: "http://:3000/sample.json",
                         method: .get,
                         parameters: nil,
                         encoding: JSONEncoding() as ParameterEncoding)
    }
}
