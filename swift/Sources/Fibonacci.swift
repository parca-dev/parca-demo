import Foundation
import Logging

struct FibonacciResult {
  let value: UInt64
  let input: UInt64
  let timestamp: Date

  var json: String {
    let dict = ["fibonacci": "\(value)", "input": "\(input)", "timestamp": "\(timestamp)"]
    guard let data = try? JSONSerialization.data(withJSONObject: dict),
      let string = String(data: data, encoding: .utf8)
    else {
      return "error"
    }
    return string
  }
}

struct FibonacciCalculator {
  private let logger: Logger

  init(logger: Logger) {
    self.logger = logger
  }

  @inline(never)
  func calculate(_ n: UInt64) -> UInt64 {
    switch n {
    case 0:
      fatalError("zero not allowed")
    case 1, 2:
      return 1
    default:
      return calculate(n - 1) + calculate(n - 2)
    }
  }

  func calculateWithResult(_ n: UInt64) -> FibonacciResult {
    let value = calculate(n)
    return FibonacciResult(value: value, input: n, timestamp: Date())
  }
}
