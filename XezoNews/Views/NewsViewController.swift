//
//  ViewController.swift
//  XezoNews
//
//  Created by mozeX on 30.08.2022.
//

import UIKit
import SafariServices

protocol sendDataToVC {
    func sendText(text: String)
}

class NewsViewController: UIViewController, sendDataToVC {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var viewModel = NewsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        searchBar.delegate = self
        
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: K.newsCell)
        
        searchBar.searchBarStyle = .minimal
        fetchNews()
    }
    
    func fetchNews() {
        viewModel.getNews { (_) in
            self.newsTableView.reloadData()
        }
    }
    
    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print(segmentedControl.selectedSegmentIndex)
        case 1:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "weatherVC") as! WeatherViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        case 2:
            print(segmentedControl.selectedSegmentIndex)
        default:
            break;
        }
    }
    
    @IBAction func sendSomeData(_ sender: UIButton) {
        let dataToBeSent = self.myTextField.text
        let vc = WeatherViewController()
        vc.delegate = self
        vc.label.text = dataToBeSent
        vc.modalPresentationStyle = .popover
        present(vc, animated: true, completion: nil)
    }
    
    func sendText(text: String) {
        print(text)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: K.newsCell) as! NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell.newsVM = news
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        guard let url = URL(string: news.url) else {
            return
        }
        
        let config = SFSafariViewController.Configuration()
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.modalPresentationStyle = .fullScreen
        present(safariViewController, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
//        if self.delegate != nil && self.searchBar.text != nil {
//            let sendedData = self.searchBar.text
//            self.delegate?.sendText(text: sendedData!)
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "weatherVC") as! WeatherViewController
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true, completion: nil)
//        }
//        guard let text = searchBar.text, !text.isEmpty else {
//            return
//        }
        //print(text)
    }
    
}
