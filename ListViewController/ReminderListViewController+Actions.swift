//
//  ReminderListViewController+Actions.swift
//  TodayReminder
//
//  Created by Tengku Zulfadli on 23/10/2022.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(with: id)
    }
}
