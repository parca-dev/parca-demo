import ArgumentParser
import Foundation
import Logging
import Synchronization

@main
struct Repeat: AsyncParsableCommand {
  static let logger = Logger(label: "dev.parca-demo.swift")

  @Option(help: "Fibonacci number to calculate")
  var fibNumber: UInt64 = 42

  @Option(help: "Memory allocation size in KB")
  var memSize: Int = 20

  func run() async throws {
    let calculator = FibonacciCalculator(logger: Self.logger)
    let memoryManager = MemoryManager()

    let cpu = Task.detached {
      while true {
        let result = calculator.calculateWithResult(self.fibNumber)
        Self.logger.info("CPU result: \(result.json)")
        try await Task.sleep(for: .seconds(1))
      }
    }

    let mem = Task.detached {
      while true {
        Self.logger.info("Allocating memory...")
        memoryManager.allocateChunk(size: self.memSize * 1024)
        Self.logger.info("Total memory: \(memoryManager.totalMemory)")
        try await Task.sleep(for: .seconds(1))
      }
    }

    let foundation = Task.detached {
      while true {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        let _ = formatter.string(from: date)

        let uuid = UUID()
        let _ = URL(string: "https://example.com/\(uuid.uuidString)")

        Self.logger.info("Foundation operations completed")
        try await Task.sleep(for: .seconds(2))
      }
    }

    _ = await cpu.result
    _ = await mem.result
    _ = await foundation.result
  }
}
