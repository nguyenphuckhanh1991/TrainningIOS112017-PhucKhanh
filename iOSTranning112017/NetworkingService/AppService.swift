//
//  DataService.swift
//  iOSTranning112017
//
//  Created by nguyen.phuc.khanh on 12/12/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import Foundation

enum APIType {
    case login
    case logout
    case register
    case timeline
    case fetchAvaImage
    case createChatroom
}
enum httpMethod: String {
    case post = "POST"
    case get = "GET"
}
struct AppServices {
    private static let baseURL = "https://thl.herokuapp.com/api/v1"
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    private var dataTask: URLSessionDataTask?
    func getPath(API: APIType, parameter: [String: Any]?) -> String {
        var pathParam: String = ""
        switch API {
        case .login:
            pathParam = "/login"
        case .register:
            pathParam = "/users"
        case .logout:
            pathParam = "/logout"
        case .timeline:
            pathParam = "/chatroom?page=\(parameter![AppKey.Chatroom.page] ?? 0)&page_size=\(parameter![AppKey.Chatroom.pagesize] ?? 10)"
        case .createChatroom:
            pathParam = "/chatroom"
        case .fetchAvaImage:
            if let avatarUrl = parameter![AppKey.Chatroom.avatarUrl] as? String {
                pathParam = avatarUrl
            }
        }
        return pathParam
    }
    func parameterEncode(parameters: [String: Any]) -> Data {
        let array = Array(parameters.keys.map { "\($0)=\(parameters[$0]!)" })
        print(array.joined(separator: "&"))
        let data = array.joined(separator: "&").data(using: String.Encoding.utf8)
        return data!
    }
    mutating func request(httpMethod: httpMethod, parameter: [String: Any]?, apiType: APIType, completion: @escaping ([String: Any]?, Error?) -> Void) {
        let urlString = AppServices.baseURL + getPath(API: apiType, parameter: parameter)
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest.init(url: url)
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: AppKey.HeaderKey.Accept)
        if apiType == .login {
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: AppKey.HeaderKey.ContentType)
            request.httpBody = parameterEncode(parameters: parameter!)
        } else {
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: AppKey.HeaderKey.ContentType)
            if apiType != .register {
                if let token = UserDefaults.standard.value(forKey: AppKey.TokenKey.token) as? [String: String] {
                    let accessToken = token[AppKey.TokenKey.accessToken]
                    let tokenString = "JWT " + accessToken!
                    request.setValue(tokenString, forHTTPHeaderField: AppKey.HeaderKey.Authorization)
                }
            }
            if parameter != nil && httpMethod == .post {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: parameter!, options: .prettyPrinted)
                    request.httpBody = jsonData
                } catch let error {
                    completion(nil, error)
                }
            }
        }
        dataTask = session.dataTask(with: request, completionHandler: { (data, _, error) in
            if let jsonData = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    let responseData = jsonObject as? [String: Any]
                    completion(responseData, error)
                } catch let error {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        })
        dataTask?.resume()
    }
    mutating func requestImage(httpMethod: httpMethod, parameter: [String: Any]?, apiType: APIType, completion: @escaping (AnyObject?, Error?) -> Void) {
        let urlString = getPath(API: apiType, parameter: parameter)
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest.init(url: url)
        request.httpMethod = httpMethod.rawValue
        dataTask = session.dataTask(with: request) { (data, _, error) in
            if let jsonData = data {
                completion(jsonData as AnyObject, error)
            } else {
                completion(nil, error)
            }
        }
        dataTask?.resume()
    }
}
