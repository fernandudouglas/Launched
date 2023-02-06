//
//  HomeViewTableViewCell.swift
//  Devskiller
//
//  Created by Fernando Douglas Vieira on 05/02/23.
//  Copyright © 2023 Mindera. All rights reserved.
//

import UIKit
import Kingfisher

class LaunchTableViewCell: UITableViewCell {
    
    private let missionPatchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let missionLabel: UILabel = UILabel()
    private let dateTimeLabel: UILabel = UILabel()
    private let rocketNameTypeLabel: UILabel = UILabel()
    private let launchDateLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        missionLabel.text = nil
        dateTimeLabel.text = nil
        rocketNameTypeLabel.text = nil
        launchDateLabel.text = nil
        missionPatchImageView.image = nil
        missionPatchImageView.kf.cancelDownloadTask()
    }
    
    private func buildViewHierarchy() {
        missionPatchImageView.translatesAutoresizingMaskIntoConstraints = false
        missionLabel.translatesAutoresizingMaskIntoConstraints = false
        dateTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        rocketNameTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        launchDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(missionPatchImageView)
        self.contentView.addSubview(missionLabel)
        self.contentView.addSubview(dateTimeLabel)
        self.contentView.addSubview(rocketNameTypeLabel)
        self.contentView.addSubview(launchDateLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            missionPatchImageView.heightAnchor.constraint(equalToConstant: 44),
            missionPatchImageView.widthAnchor.constraint(equalToConstant: 44),
            missionPatchImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            missionPatchImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            
            missionLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            missionLabel.leadingAnchor.constraint(equalTo: self.missionPatchImageView.trailingAnchor, constant: 12),
            missionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            
            dateTimeLabel.topAnchor.constraint(equalTo: self.missionLabel.bottomAnchor, constant: 4),
            dateTimeLabel.leadingAnchor.constraint(equalTo: self.missionLabel.leadingAnchor),
            dateTimeLabel.trailingAnchor.constraint(equalTo: self.missionLabel.trailingAnchor),
            
            rocketNameTypeLabel.topAnchor.constraint(equalTo: self.dateTimeLabel.bottomAnchor, constant: 4),
            rocketNameTypeLabel.leadingAnchor.constraint(equalTo: self.missionLabel.leadingAnchor),
            rocketNameTypeLabel.trailingAnchor.constraint(equalTo: self.missionLabel.trailingAnchor),
            
            launchDateLabel.topAnchor.constraint(equalTo: self.rocketNameTypeLabel.bottomAnchor, constant: 4),
            launchDateLabel.leadingAnchor.constraint(equalTo: self.missionLabel.leadingAnchor),
            launchDateLabel.trailingAnchor.constraint(equalTo: self.missionLabel.trailingAnchor),
            launchDateLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func setup(with launch: Launch) {
        missionLabel.text = "Mission: \(launch.name)"
        dateTimeLabel.text = "Date: \(launch.dateFormatted)"
        rocketNameTypeLabel.text = "Rocket: \(launch.rocketInfo?.name ?? "-") / \(launch.rocketInfo?.type ?? "-")"
        launchDateLabel.text = "Days from now: today / launch date"
        guard let url = launch.links.patch.small,
              let imageURL = URL(string: url) else { return }
        missionPatchImageView.kf.setImage(with: imageURL)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        label.text = launch.success ?? false ? "✅" : "❌"
        self.accessoryView = label
        
    }
}

