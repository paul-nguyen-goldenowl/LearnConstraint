//
//  GCDViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 05/10/2022.
//

import UIKit

typealias GCDAction = () -> Void

class GCDViewController: UIViewController {
    private var data = [GCDAction]()
    private var dataName = [String]()

    lazy var tableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mycell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        data.append(handle_concurrent_sync)
        dataName.append("concurrent_sync")

        data.append(handle_concurrent_async)
        dataName.append("concurrent_async")

        data.append(handle_serial_sync)
        dataName.append("serial_sync")

        data.append(handle_serial_async)
        dataName.append("serial_async")

        data.append(handle_serial_asyncAfter)
        dataName.append("serial_asyncAfter")

        data.append(handle_concurrent_asyncAfter)
        dataName.append("concurrent_asyncAfter")

        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    /*
     concurrent_sync
     start1
     end1 2022-10-05 05:11:47 +0000
     start2
     end2 2022-10-05 05:11:49 +0000
     start3
     main thread
     end3 2022-10-05 05:11:51 +0000
     */
    let handle_concurrent_sync: GCDAction = {
        let queue = DispatchQueue(label: "handle_concurrent_async", attributes: .concurrent)
        queue.sync {
            print("start1")
            print("end1 \(Date())")
        }
        queue.sync {
            print("start2")
            sleep(2)
            print("end2 \(Date())")
        }
        queue.sync {
            print("start3")
            queue.asyncAfter(deadline: .now() + .seconds(2)) {
                print("end3 \(Date())")
            }
        }
        print("main thread")
    }

    /*
     concurrent_async
     main thread
     start1
     end1 2022-10-05 05:15:00 +0000
     start3
     start2
     end2 2022-10-05 05:15:02 +0000
     end3 2022-10-05 05:15:02 +0000
     */
    let handle_concurrent_async: GCDAction = {
        let queue = DispatchQueue(label: "handle_concurrent_async", attributes: .concurrent)
        queue.async {
            print("start1")
            print("end1 \(Date())")
        }
        queue.async {
            print("start2")
            sleep(2)
            print("end2 \(Date())")
        }
        queue.async {
            print("start3")
            queue.asyncAfter(deadline: .now() + .seconds(2)) {
                print("end3 \(Date())")
            }
        }
        print("main thread")
    }

    /*
     serial_async
     main thread
     start1
     end1 2022-10-05 05:15:35 +0000
     start2
     end2 2022-10-05 05:15:37 +0000
     start3
     end3 2022-10-05 05:15:39 +0000
     */
    let handle_serial_async: GCDAction = {
        let queue = DispatchQueue(label: "handle_serial_async")
        queue.async {
            print("start1")
            print("end1 \(Date())")
        }
        queue.async {
            print("start2")
            sleep(2)
            print("end2 \(Date())")
        }
        queue.async {
            print("start3")
            queue.asyncAfter(deadline: .now() + .seconds(2)) {
                print("end3 \(Date())")
            }
        }
        print("main thread")
    }

    /*
     serial_sync
     start1
     end1 2022-10-05 05:16:05 +0000
     start2
     end2 2022-10-05 05:16:07 +0000
     start3
     main thread
     end3 2022-10-05 05:16:09 +0000
     */
    let handle_serial_sync: GCDAction = {
        let queue = DispatchQueue(label: "handle_serial_sync")
        queue.sync {
            print("start1")
            print("end1 \(Date())")
        }
        queue.sync {
            print("start2")
            sleep(2)
            print("end2 \(Date())")
        }
        queue.sync {
            print("start3")
            queue.asyncAfter(deadline: .now() + .seconds(2)) {
                print("end3 \(Date())")
            }
        }
        print("main thread")
    }

    let handle_serial_asyncAfter: GCDAction = {
        let queue = DispatchQueue(label: "handle_serial_asyncAfter", qos: .userInitiated)
        print(Date())
        let additionalTime: DispatchTimeInterval = .seconds(2)
        queue.asyncAfter(deadline: .now() + additionalTime) {
            print(Date())
        }
        queue.asyncAfter(deadline: .now() + .seconds(3)) {
            print(Date())
        }
        print("main thread")
    }

    let handle_concurrent_asyncAfter: GCDAction = {
        let queue = DispatchQueue(label: "handle_concurrent_asyncAfter", qos: .userInitiated, attributes: .concurrent)
        print(Date())
        let additionalTime: DispatchTimeInterval = .seconds(2)
        queue.asyncAfter(deadline: .now() + additionalTime) {
            print(Date())
        }
        queue.asyncAfter(deadline: .now() + .seconds(3)) {
            print(Date())
        }
        print("main thread")
    }
}

extension GCDViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = dataName[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print()
        print(dataName[indexPath.row])
        data[indexPath.row]()
    }
}
