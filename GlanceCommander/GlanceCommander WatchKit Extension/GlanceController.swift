import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    @IBOutlet var commandTable: WKInterfaceTable!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        super.willActivate()
        activateCommands(stop: false, kontinue: false)
        updateCommands()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    private func activateCommands(stop stop: Bool, kontinue: Bool) {
        var commands = [String]()
        commands.append(stop ? "GlanceCommandActive" : "GlanceCommandInactive")
        commands.append(kontinue ? "GlanceCommandActive" : "GlanceCommandInactive")

        commandTable.setRowTypes(commands)
        let command1 = commandTable.rowControllerAtIndex(0) as! GlanceCommand
        let command2 = commandTable.rowControllerAtIndex(1) as! GlanceCommand
        stop ? command1.activateStop() : command1.deactivateStop()
        kontinue ? command2.activateContinue() : command2.deactivateContinue()
    }

    private func updateCommands() {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            if (arc4random_uniform(2) != 0) {
                self.activateCommands(stop: false, kontinue: true)
            } else {
                self.activateCommands(stop: true, kontinue: false)
            }
        }
    }
}
