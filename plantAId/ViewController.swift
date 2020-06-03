//
//  ViewController.swift
//  Ecosity
//
//  Created by Krish Malik on 2/11/20.
//  Copyright © 2020 Krish Malik. All rights reserved.
//

import UIKit
import GTProgressBar

var total_1 = ""
var fridge_display: Bool = false
var lights_display: Bool = false
var heating_water_display: Bool = false
var television_display: Bool = false


class ViewController: UIViewController {
    
    @IBOutlet weak var progressBarResult: GTProgressBar!
    var miles_tips_display: String = ""
    var dishwasher_tips_display: String = ""
    var dryer_tips_display: String = ""
    var washer_tips_display: String = ""
    var null_display: String = "We don't have tips for you! Good job being environmentally pro-active."
    
 
    @IBAction func restartButton(_ sender: UIButton) {
        storyboard?.instantiateInitialViewController()

    }
    
    var totalFloat = String(total)
    var dishwasher_tips: String = """
For your dishwasher:\

    Let Dishes Air Dry.  This is one of the easiest and most convenient methods to cut down on emissions as it cuts down energy used to heat your dishwasher, and in turn also prevents any damage that would have occured with the heat on your dishes. To do this, either turn off the heat-dry setting or prop open the door after the wash cycle is over and turn the entire machine off. \

\

    By scraping excess waste in your trash can instead of the sink, you are saving energy by ensuring your dishwasher drain isn’t getting clogged, which will then make your machine run more efficiently. \


    By lowering your water temperature, you will also be saving energy.  Dishwashers normally heat your water in accordance to the temperature that is needed to wash your dishes (normally around 140 degrees).  You can decrease the temperature on your hot water heater to around 130 degrees, and your dishwasher will still heat it to the temperature that is needed, thereby saving you energy costs and lowering emissions.
"""
    
    var dryer_tips: String = """
For your dryer:\
    Buying the most energy efficient models will go a long way in saving energy with dryers. Dryer ratings usually go from A+++ down to D, which causes a vast difference on how much energy is used. \

\

    Waiting to use the dryer until you have collected a large load of clothes is good advice, but make sure not to overload the dryers, as if the load goes past its limits it will put more pressure on the machine which can damage it.  Make sure to read the manual for knowledge on load maximums. \

    Clean the lint screen. Doing this before every load will better the air circulation of the clothes and ensure the clothes are still wet, which would require another round and more energy usage.
"""
    var washer_tips: String = """

    For your washing machine/washer:\

    By increasing the spin speed of your washer, your total time will be cut.  If this leads to clothes coming out wrinkled after drying, remove the landru from the washer, untangle, and shake out before tossing into the dryer again. \

    Choosing cold water is a good way to cut energy usage.  Studies have shown laundry detergent has improved in being able to remove dirt and stains at lower water temperatures.  However, hot water is more optimal for oily stains, washinging sheets, or towels.
    
    """
    var miles_tips: String = "a"
    
    override func viewDidLoad() {
        self.navigationItem.backBarButtonItem?.title = ""
        super.viewDidLoad()
        progressBar()
        self.navigationItem.setHidesBackButton(true, animated: true);
        if dishwasher_value > 3
        {
            dishwasher_tips_display = """
            For your dishwasher:\

                Let Dishes Air Dry.  This is one of the easiest and most convenient methods to cut down on emissions as it cuts down energy used to heat your dishwasher, and in turn also prevents any damage that would have occured with the heat on your dishes. To do this, either turn off the heat-dry setting or prop open the door after the wash cycle is over and turn the entire machine off. \

            \

                By scraping excess waste in your trash can instead of the sink, you are saving energy by ensuring your dishwasher drain isn’t getting clogged, which will then make your machine run more efficiently. \


                By lowering your water temperature, you will also be saving energy.  Dishwashers normally heat your water in accordance to the temperature that is needed to wash your dishes (normally around 140 degrees).  You can decrease the temperature on your hot water heater to around 130 degrees, and your dishwasher will still heat it to the temperature that is needed, thereby saving you energy costs and lowering emissions.
            """
        }
        
        if dryer_value > 3
        {
            dryer_tips_display = """
            For your dryer:\
                Buying the most energy efficient models will go a long way in saving energy with dryers. Dryer ratings usually go from A+++ down to D, which causes a vast difference on how much energy is used. \

            \

                Waiting to use the dryer until you have collected a large load of clothes is good advice, but make sure not to overload the dryers, as if the load goes past its limits it will put more pressure on the machine which can damage it.  Make sure to read the manual for knowledge on load maximums. \

                Clean the lint screen. Doing this before every load will better the air circulation of the clothes and ensure the clothes are still wet, which would require another round and more energy usage.
            """
        }
        if washer_value > 3
        {
            washer_tips_display = """

            For your washing machine/washer:\

            By increasing the spin speed of your washer, your total time will be cut.  If this leads to clothes coming out wrinkled after drying, remove the landru from the washer, untangle, and shake out before tossing into the dryer again. \

            Choosing cold water is a good way to cut energy usage.  Studies have shown laundry detergent has improved in being able to remove dirt and stains at lower water temperatures.  However, hot water is more optimal for oily stains, washinging sheets, or towels.
            
            """
        }
        if miles_value > 50
        {
            miles_tips_display = """
For your driving:\

As for short trips try going by foot or via non emission based transportation such as a bike or scooter.  Not only will your emissions slowly but surely plummet down, you’ll also get some exercise in! \

            If driving is necessary, try car-pooling or using a bus in order to lower emissions via shared transportation.  These also apply to every day commute such as going to work. \

            Quite possibly the easiest and the most effective - Buy an electric car!  It may seem expensive, but the amount of money saved by not having to buy gas will end up being cheaper then if you buy a normal car. \

"""
        }
        updateUI()
        tipsUI()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tips: UITextView!
    @IBOutlet weak var final: UILabel!
    func updateUI() {
            final.text = String(totalFloat) + " Lbs of Carbon"
    }
    func tipsUI() {
        tips.text = dishwasher_tips_display + dryer_tips_display  + washer_tips_display  + miles_tips_display + null_display
}
    func progressBar() {
        let newResultProgress: CGFloat = progressBarResult.progress == 1.00 ? 0.45 : 1.00; progressBarResult.animateTo(progress: newResultProgress)
        progressBarResult.font = UIFont.boldSystemFont(ofSize: 18)
        progressBarResult.barMaxHeight = 12
        progressBarResult.cornerRadius = (progressBarResult.barMaxHeight ?? progressBarResult.bounds.height) / 3.0
    }

}
