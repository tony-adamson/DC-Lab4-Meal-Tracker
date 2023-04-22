//
//  FoodTableViewController.swift
//  DC-Lab4-Meal Tracker
//
//  Created by Антон Адамсон on 22.04.2023.
//

import UIKit

class FoodTableViewController: UITableViewController {

    var meals: [Meal] {
        let breakfast = Meal(name: "Breakfast", food: [Food(name: "Coffee", description: "---"),
                                                      Food(name: "Eggs", description: "---"),
                                                      Food(name: "Toast", description: "---")])
        let lunch = Meal(name: "Lunch", food: [Food(name: "Juice", description: "---"),
                                              Food(name: "Soup", description: "---"),
                                              Food(name: "Cupcake", description: "---")])
        let dinner = Meal(name: "Dinner", food: [Food(name: "Beer", description: "---"),
                                                Food(name: "Steak", description: "---"),
                                                Food(name: "Potato chips", description: "---")])
        
        return [breakfast, lunch, dinner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //добираемся до подмассива в массиве meals через команду section
        let meal = meals[section]
        // добираемся до свойства food через подмассив meal обращением meal.food
        let food = meal.food
        //возвращаем количество упоминаний свойства food
        return food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        //снова добираемся до подмассива через indexPath.section
        let meal = meals[indexPath.section]
        //снова в food записываем через обращение meal.food значение по indexPath.row
        let food = meal.food[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let meal = meals[section]
        return meal.name
    }

}
