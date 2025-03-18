//
//  MovieListTableViewCell.swift
//  TheMovieDB
//
//  Created by Sandy Sánchez on 17/03/25.
//
import UIKit


class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieContentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var ratingView: UIView!
    let shape = CAShapeLayer()
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0/10"
        label.textColor = #colorLiteral(red: 0.06274509804, green: 0.7098039216, blue: 0.8784313725, alpha: 1)
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    
    var cell: MovieInfo? {
        didSet {
            cofigureCell()
        }
    }
    
    func cofigureCell() {
        label.sizeToFit()
        movieContentView.addSubview(label)
        label.center = CGPoint(x: 245, y: 110)
        if let info = cell {
            
            let rating = String(cell?.popularity ?? 0.rounded())
            label.text = rating + "/10"
            titleLabel.text = info.original_title ?? "No"
            movieImage.load(imageString: info.poster_path ?? "")
        }
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 120, y: 80),
                                      radius: 50,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 8
        trackShape.fillColor = UIColor.clear.cgColor
        ratingView.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 8
        shape.strokeColor = #colorLiteral(red: 0.06274509804, green: 0.7098039216, blue: 0.8784313725, alpha: 1)
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        ratingView.layer.addSublayer(shape)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 2
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        movieImage.layer.cornerRadius = 8
    }
}
