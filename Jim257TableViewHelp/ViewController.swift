//
//  ViewController.swift
//  Jim257TableViewHelp
//
//  Created by Karen Mathes on 12/2/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

//        var centralManager: CBCentralManager!
//        var peripherals = Array<CBPeripheral>()
    
        var petArray = ["dog", "cat", "fish"]
    
        //***** Use this if doing "if" logic in tableView|cellForRowAt
        var cellID = "cellID"
        
        @IBOutlet weak var tableView: UITableView!
        //@IBOutlet weak var bleScan: UITextField!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //***** Definitely need these
            tableView.delegate = self
            tableView.dataSource = self
            
//            centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
        }
    }
        
//    extension ViewController: CBCentralManagerDelegate {
//        func centralManagerDidUpdateState(_ central: CBCentralManager) {
//            if (central.state == CBManagerState.poweredOn){
//
//                // Turned on
//                self.centralManager?.scanForPeripherals(withServices: nil, options: nil)
//                print("BLE powered on")
//            }
//            else {
//                print("Something wrong with BLE")
//                // Not on
//            }
//            }
//
//        func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//            peripherals.append(peripheral)
//            tableView.reloadData()
//
//            // Print scan info in debugger area
//            print(peripherals)
//
//            // Write device name to text box on storyboard
//            bleScan.text = peripheral.name
//
//            }
//    }

    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            //***** changed this from "let" to "var" and "cell" will need to be declared for prototype cell on storyboard (which we have to add)
            var cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
            
            //.. I don't think you really need this as long as you put "cell" in prototype cell identifier on storyboard
            if (cell == nil ) {
                cell = UITableViewCell(style: UITableViewCell.CellStyle.default,reuseIdentifier: cellID)
            }

            let pet = petArray[indexPath.row]
            //let peripheral = peripherals[indexPath.row]
            //cell.textLabel?.text = peripheral.name
            cell.textLabel?.text = pet
            
            return cell
            }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //return peripherals.count
            return petArray.count
            }
    }



