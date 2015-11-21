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
}
