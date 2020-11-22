//
//  BaseApi.swift
//  myapp
//
//  Created by Ростислав Ермаченков on 13/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import Foundation
import Alamofire

class BaseApi {
    private let manager = Alamofire.SessionManager.default
    
    func call(with request: URLRequest, completion: @escaping (ResponseModel) -> ()) {
        manager.request(request).responseJSON {
            response in
            if let responseValue = response.result.value {
                let responseModel = ResponseModel(data: response.data)
                completion(responseModel)
            }
        }
    }
}
