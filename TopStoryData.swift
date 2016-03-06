//
//  TopStoryData.swift
//  HackerNews
//
//  Created by Wen Niao Qu on 3/5/16.
//  Copyright © 2016 Wen Niao Qu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsData{

    class func getTopStories(completionClosure: (newsID: AnyObject?, error: ErrorType?) -> ()) {
        let requestURL = "https://hacker-news.firebaseio.com/v0/topstories.json"
        Alamofire.request(.GET, requestURL)
            .responseJSON { response in
                
                if let result = response.result.value {
                    var newsIDs: [Int] = []
                    let data = JSON(result)
                    for id in data {
                        newsIDs.append(id.1.int!)
                    }
                    completionClosure(newsID: newsIDs, error: nil)
                }
                if let error = response.result.error {
                    completionClosure(newsID: nil, error: error)
                }
        }
    }
    
    class func getStoryData(newsId: Int , completionClosure: (newsModel: NewsModel?, error: ErrorType?) -> ()){
        let requestURL = "https://hacker-news.firebaseio.com/v0/item/\(newsId).json?"
        Alamofire.request(.GET, requestURL)
            .responseJSON { response in
                
                if let result = response.result.value {
                    let JSONData = JSON(result)
                    let storyTitle = JSONData["title"].string
                    let storyURL = JSONData["url"].string
                    let storyAuthor = JSONData["by"].string
                    let newsModel = NewsModel.init(id: newsId, title: storyTitle, author: storyAuthor, url: storyURL)
                    
                    completionClosure(newsModel: newsModel, error: nil)
                }
                if let error = response.result.error {
                    completionClosure(newsModel: nil, error: error)
                }
        }
    }
   
}
struct NewsModel {
    var id : Int = 0
    var title : String?
    var author : String?
    var url : String?
}
