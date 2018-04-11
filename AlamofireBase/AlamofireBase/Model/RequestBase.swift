//
//  RequestBase.swift
//  AlamofireBase
//
//  Created by 冨樫公一 on 2018/04/10.
//  Copyright © 2018年 冨樫公一. All rights reserved.
//

import Alamofire
import RxSwift
import Foundation

class RequestBase {
    func createSingle<T: Codable>(withURLString url: String,
                                   method: HTTPMethod = .get,
                                   parameters: Parameters? = nil,
                                   encoding: ParameterEncoding = JSONEncoding.default) -> Observable<T> {
        return Observable.create { (observer: AnyObserver<T>) in
            let request = Alamofire.request(url,
                                            method: method,
                                            parameters: parameters,
                                            encoding: encoding)
                .responseData { response in
                    switch response.result {
                    case .success(let json):
                        let entity = try! JSONDecoder().decode(T.self, from: json)
                        observer.on(.next(entity))
                        observer.onCompleted()
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create { request.cancel() }
        }
    }
}
