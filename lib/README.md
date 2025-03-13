# Hash Map

### A hash map (or hash table) is a data structure that stores key-value pairs, allowing efficient search, insertion, and deletion. It uses a hash function to convert each key into an index within an array, where the corresponding value is stored.

## Characteristics:

### Fast access: Basic operations (search, insertion, and deletion) have an average complexity of O(1).

### Collisions: These occur when two different keys generate the same hash index. They are handled with techniques such as chaining (linked lists) or open addressing (linear probing, quadratic probing, etc.).

### Unordered: Elements are not stored in a specific order.

### Common use: Used in databases, caches, indexing systems, and counting algorithms.

### Based on the steps from of the Odin Project: https://www.theodinproject.com/lessons/ruby-hashmap
