//
//  NewsViewModel.swift
//  XezoNews
//
//  Created by mozeX on 30.08.2022.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://demofree.sirv.com/nope-not-here.jpg"
    }
}
