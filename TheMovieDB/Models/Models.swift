//
//  Models.swift
//  TheMovieDB
//
//  Created by Sandy Sánchez on 17/03/25.
//

import Foundation

struct ListResponse: Codable {
    var page: Int?
    var results: [MovieInfo?]
    var total_pages: Int?
    var total_results: Int?
}

struct MovieInfo: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int?]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}

 
struct MovieDetailResponse: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: String?
    var budget: Int?
    var genres: [GenresList?]
    var homepage: String?
    var id: Int?
    var imdb_id: String?
    var origin_country: [String?]
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [ProductCompanyesList?]
    var production_countries: [ProductionCountriesList?]
    var release_date: String?
    var revenue: Int?
    var runtime: Int?
    var spoken_languages: [SpokenLanguagesList?]
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}

struct GenresList: Codable {
    var id: Int?
    var name: String?
}

struct ProductCompanyesList: Codable {
    var id: Int?
    var logo_path: String?
    var name: String?
    var origin_country: String?
}

struct ProductionCountriesList: Codable {
    var iso_3166_1: String?
    var name: String?
}

struct SpokenLanguagesList: Codable {
    var english_name: String?
    var iso_639_1: String?
    var name: String?
}

