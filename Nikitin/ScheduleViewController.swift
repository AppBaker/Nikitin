//
//  ScheduleViewController.swift
//  Nikitin
//
//  Created by Ivan Nikitin on 26.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataFetchService = DataFetcherService()
    var weekSchedule = [[Schedule](), [Schedule](), [Schedule](), [Schedule](), [Schedule](), [Schedule](), [Schedule]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = self.view.frame
        let loadView = UIView(frame: frame)
        let fonImageView = UIImageView(frame: frame)
        fonImageView.image = #imageLiteral(resourceName: "fon")
        
        let armImage = #imageLiteral(resourceName: "Arm")
        let armImageView = UIImageView(frame: CGRect(x: frame.width / 2 - 75, y: frame.height / 2 - 75, width: 150, height: 150))
        armImageView.contentMode = .scaleAspectFit
        armImageView.image = armImage
        armImageView.center = view.center

        let actityIndicator = UIActivityIndicatorView(style: .large)
        actityIndicator.center = view.center
        actityIndicator.hidesWhenStopped = true
        actityIndicator.startAnimating()
        
        loadView.addSubview(fonImageView)
        loadView.addSubview(armImageView)
        loadView.addSubview(actityIndicator)
        
        self.view.addSubview(loadView)
        
        dataFetchService.fetchSchedule { (scheduel) in
            guard let scheduel = scheduel else { return }
            
            for item in scheduel {
                self.weekSchedule[item.weekDay - 1].append(item)
            }
            loadView.isHidden = true
            actityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "scheduleCell")
    }
}

extension ScheduleViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Понедельник"
        case 1:
            return "Вторник"
        case 2:
            return "Среда"
        case 3:
            return "Четверг"
        case 4:
            return "Пятница"
        case 5:
            return "Суббота"
        case 6:
            return "Воскресенье"
            
        default:
            return "Default"
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekSchedule[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleTableViewCell
        
        let dayScheduel = weekSchedule[indexPath.section][indexPath.row]
        
        setCellWith(scheduel: dayScheduel, cell: cell)
        
        return cell
    }
    
    func setCellWith(scheduel: Schedule, cell: ScheduleTableViewCell) {
        cell.nameLabel.text = "Занятие: \(scheduel.name)"
        cell.descriptionLabel.text = "\(scheduel.description)"
        cell.timeLabel.text = "Время занятия: \(scheduel.startTime) - \(scheduel.endTime)"
        cell.teacherLabel.text = "Инструктор: \(scheduel.teacher)"
        cell.placeLabel.text = "Зал: \(scheduel.place)"
    }
}

