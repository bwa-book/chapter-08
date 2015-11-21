import WatchKit

class GlanceCommand: NSObject {
    @IBOutlet weak var group: WKInterfaceGroup!
    @IBOutlet weak var label: WKInterfaceLabel!

    func activateStop() {
        updateWithText("STOP!", UIColor.redColor())
    }

    func deactivateStop() {
        updateWithText("STOP!", UIColor.darkGrayColor())
    }

    func activateContinue() {
        updateWithText("CONTINUE!", UIColor.greenColor())
    }

    func deactivateContinue() {
        updateWithText("CONTINUE!", UIColor.darkGrayColor())
    }

    private func updateWithText(text: String, _ color: UIColor) {
        label.setText(text)
        group.setBackgroundColor(color)
    }
}