import Synchronization

class MemoryManager {
  private let buffers = Mutex<[[UInt8]]>([])

  @inline(never)
  func allocateChunk(size: Int) {
    buffers.withLock { buffers in
      buffers.append(Array(repeating: 0, count: size))
    }
  }

  var totalMemory: Int {
    buffers.withLock { buffers in
      buffers.reduce(0) { $0 + $1.count }
    }
  }
}
