//
//  Alamofire+Decoable.swift
//  Pods
//
//  Created by Quoc Nguyen on 2019/03/04.
//

import Alamofire

public extension DataRequest {
    func responseObject<T: Decodable>(_ success: ((T) -> Void)?, fail: ((Error) -> Void)?) {
        self.responseJSON { (response) in
            response.parseObject(success).catchFail(fail)
        }
    }

    func responseArray<T: Decodable>(_ success: (([T]) -> Void)?, fail: ((Error) -> Void)?) {
        self.responseJSON { (response) in
            response.parseArray(success).catchFail(fail)
        }
    }
}

public extension DataResponse {
    @discardableResult
    func catchResponse(code: Int, action: ((HTTPURLResponse?, Result<Value>) -> Void)?) -> DataResponse {
        if self.response?.statusCode == code {
            action?(self.response, self.result)
        }
        return self
    }

    @discardableResult
    func parseObject<T: Decodable>(_ success: ((T) -> Void)?) -> DataResponse {
        guard let jsonData = self.data else {
            return self
        }
        do {
            let object = try JSONDecoder().decode(T.self, from: jsonData)
            success?(object)
            return self
        } catch {
            print(error)
            return self
        }
    }

    @discardableResult
    public func parseArray<T: Decodable>(_ success: (([T]) -> Void)?) -> DataResponse {
        guard let jsonData = self.data else {
            return self
        }
        do {
            let object = try JSONDecoder().decode([T].self, from: jsonData)
            success?(object)
            return self
        } catch {
            print(error)
            return self
        }
    }

    @discardableResult
    func catchFail(_ fail: ((Error) -> Void)?) -> DataResponse {
        switch self.result {
        case .failure(let error):
            fail?(error)
        default:
            break
        }
        return self
    }
}
