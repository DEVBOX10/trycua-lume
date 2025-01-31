import ArgumentParser
import Foundation

struct List: AsyncParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "ls",
        abstract: "List virtual machines"
    )
    
    init() {
    }
    
    @MainActor
    func run() async throws {
        let manager = LumeController()
        let vms = try manager.list()
        VMDetailsPrinter.printStatus(vms)
    }
}