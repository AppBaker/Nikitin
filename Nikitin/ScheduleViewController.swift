//
//  ScheduleViewController.swift
//  Nikitin
//
//  Created by Ivan Nikitin on 26.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    var dataFetchService = DataFetcherService()
    
    var scheduel : [Schedule]?
    
    var weekSchedule = [[Schedule](), [Schedule](), [Schedule](), [Schedule](), [Schedule](), [Schedule](), [Schedule]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        self.view = tableView
        tableView.dataSource = self
        
        dataFetchService.fetchSchedule { (scheduel) in
            guard let scheduel = scheduel else { return }
            
            for item in scheduel {
                self.weekSchedule[item.weekDay - 1].append(item)
            }
            tableView.reloadData()
            
        }
        
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
        cell.weekDayLabel.text = String(scheduel.weekDay)
    }
    
}

//MARK:- Custom methods
extension ScheduleViewController {
    
    
    
}

