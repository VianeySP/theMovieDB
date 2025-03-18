//
//  RealmDB.swift
//  TheMovieDB
//
//  Created by Sandy Sánchez on 18/03/25.
//
import RealmSwift


class MovieDataRealm: Object {
    @objc dynamic var app = ""
    @objc dynamic var id = 0
    @objc dynamic var movieName = ""
    @objc dynamic var movieRatin = ""
    @objc dynamic var movieDate = ""
    @objc dynamic var movieDesc = ""
}

class RegistrationMovieRealm {
    var movieDB: Realm = try! Realm()
    
    public func saveMovie(_ record: MovieDataRealm) {
        try! movieDB.write {
            movieDB.add(record)
        }
    }
    
    public func findMovieInfo(_ app: String) -> Results<MovieDataRealm> {
        let predicate = NSPredicate(format: "app", app)
        return movieDB.objects(MovieDataRealm.self).filter(predicate)
    }
    
    public func findMovieDetail(_ id: Int) -> Results<MovieDataRealm> {
        let predicate = NSPredicate(format: "id", id)
        return movieDB.objects(MovieDataRealm.self).filter(predicate)
    }
    
    public func deleteAllMovies() throws {
        try! movieDB.write{
            movieDB.deleteAll()
        }
    }
    
    public func createNewMovie(app: String, id: Int, movieName: String, movieRatin: String, movieDate: String, movieDesc: String) -> MovieDataRealm {
        let newModel = MovieDataRealm()
        newModel.app = app
        newModel.id = id
        newModel.movieName = movieName
        newModel.movieRatin = movieRatin
        newModel.movieDate = movieDate
        newModel.movieDesc = movieDesc
        return newModel
    }
    
}
