
protocol CacheEntry {
    associatedtype Value
    var value: Value { get }
}

protocol BaseCache<Key, Entry> {
    associatedtype Key: Hashable
    associatedtype Entry: CacheEntry
}

// Other protocols remain the same as in the previous design

// For thread-safe implementations
protocol ConcurrentCache: BaseCache, Sendable where Key: Sendable, Entry.Value: Sendable {}

// For actor-based implementations
@actor protocol ActorCache: AsyncCache, ConcurrentCache {}
