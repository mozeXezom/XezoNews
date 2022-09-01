//
//  NewsListViewModel.swift
//  XezoNews
//
//  Created by mozeX on 30.08.2022.
//

import Foundation

class NewsListViewModel {
    var newsVM = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(completion: @escaping ([NewsViewModel]) -> Void) {
        NetworkManagment.shared.getNews { (news) in
            guard let news = news else { return }
            let newsVM = news.map(NewsViewModel.init)
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}
