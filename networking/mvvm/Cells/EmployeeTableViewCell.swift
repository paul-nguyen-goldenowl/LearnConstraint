//
//  EmployeeTableViewCell.swift
//  LearnConstraint
//
//  Created by Golden Owl on 06/10/2022.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    lazy var employeeIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var employeeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(employeeIdLabel)
        contentView.addSubview(employeeNameLabel)

        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            employeeIdLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            employeeIdLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            employeeIdLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            employeeNameLabel.topAnchor.constraint(equalTo: employeeIdLabel.bottomAnchor),
            employeeNameLabel.leadingAnchor.constraint(equalTo: employeeIdLabel.leadingAnchor),
            employeeNameLabel.trailingAnchor.constraint(equalTo: employeeIdLabel.trailingAnchor),
            employeeNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
