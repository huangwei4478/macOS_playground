import Cocoa

func loadSignature(url: URL) async throws -> String? {
    let (data, _) = try await URLSession.shared.data(from: url)
    return String(data: data, encoding: .utf8)
}

actor Holder {
    var results: [String] = []
    
    func setResults(_ results: [String]) {
        self.results = results
    }
    
    func append(_ value: String) {
        results.append(value)
    }
}

let holder = Holder()

Task {
    await holder.setResults([])
//    await holder.append(Data().appending)
}

struct FibonacciSequene: Sequence {
    func makeIterator() -> Iterator {
        .init()
    }
    
    struct Iterator: IteratorProtocol {
        var state = (0, 1)
        
        mutating func next() -> Int? {
            let upcommingNumber = state.0
            state = (state.1, state.0 + state.1)
            return upcommingNumber
        }
    }
}

//public protocol AsyncSequence {
//    associatedtype AsyncIterator: AsyncIteratorProtocol
//    func makeAsyncIterator() -> Self.AsyncIterator
//}
//
//public protocol AsyncIteratorProtocol {
//    associatedtype Element
//    mutating func next() async throws -> Self.Element?
//}

struct AsyncFibonacciSequence: AsyncSequence {
    typealias Element = Int
    
    struct AsyncIterator: AsyncIteratorProtocol {
        var currentIndex = 0
        
        mutating func next() async throws -> Int? {
            defer { currentIndex += 1 }
            return try await loadFibNumber(at: currentIndex)
        }
    }
    
    func makeAsyncIterator() -> AsyncIterator {
        .init()
    }
}

func loadFibNumber(at index: Int) async throws -> Int {
    try await Task.sleep(nanoseconds: NSEC_PER_SEC)
    return fibNumber(at: index)
}

func fibNumber(at index: Int) -> Int {
    if index == 0 { return 0 }
    if index == 1 { return 1 }
    return fibNumber(at: index - 2) + fibNumber(at: index - 1)
}

let asyncFib = AsyncFibonacciSequence()
for try await v in asyncFib {
    if v < 20 {
        print("Async Fib: \(v)")
    } else {
        break
    }
}
