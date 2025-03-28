//
//  MovieDetailViewController.swift
//  TheMovieDB
//
//  Created by Sandy Sánchez on 16/03/25.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RealmSwift

final class MovieDetailViewController: UIViewController {

    // MARK: - Public properties -
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var realDataBase = RegistrationMovieRealm()
    
    var presenter: MovieDetailPresenterInterface!
    var idMovie: Int?
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        if CheckConection.connection() {
            presenter.executeGetMovieDetail(idMovie: idMovie ?? 0)
        }else {
            //addRealm info 
        }
        loadUI()
    }
    
    func loadUI() {
        self.movieImage.layer.cornerRadius = 8
        movieImage.layer.masksToBounds = true
        movieImage.layer.shadowColor = UIColor.black.cgColor
        movieImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        movieImage.layer.shadowOpacity = 0.7
        movieImage.layer.shadowRadius = 10
    }
    
    func loadDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateType = dateFormatter.date(from: date)
        
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd-MM-YYYY"
        let dateString = dateStringFormatter.string(from: dateType ?? Date())
        return dateString
    }
	
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}

// MARK: - Extensions -

extension MovieDetailViewController: MovieDetailViewInterface {
    func successGetMovieDetail(response: MovieDetailResponse) {
        DispatchQueue.main.async {
            self.navBar.topItem?.title = response.original_title ?? ""
            let dateformat = self.loadDate(date: response.release_date ?? "")
            self.dateLabel.text = "Fecha de lanzamiento:  " + dateformat
            self.descriptionLabel.text = response.overview ?? ""
            self.movieImage.load(imageString: response.poster_path ?? "")
        }
    }
    
    func failureGetMovieDetail(errorMessage: String) {
        ATAlert.displayAlert(viewController: self,
                             title: "Aviso",
                             subtitle: errorMessage,
                             autoHide: true,
                             needConfirmation: false,
                             action: {})
    }
    
}
