# Chain of responsibility


> "Chain of Respon­si­bil­i­ty is a behav­ioral design pat­tern that lets you pass requests along a chain of han­dlers. Upon receiv­ing a request, each han­dler decides either to process the request or to pass it to the next han­dler in the chain." - SHVETS, Alexander (Dive Into Design Patterns, page 186 - https://refactoring.guru/design-patterns/book)

With this pattern we can have multiple handlers which can or not handle the request.

If some handler can handle the request, then it also can decide if it will pass to the next handler or not. If it can't handle, then it will pass to the next handler.

If none of the handlers can handle then the request will fallback to the base class handle.

## Current Implementation

In this implementation I've implemented a DataSource structure.

We have 3 types of data sources, `Memory`, `Local (storage)` and `Remote (API)`.

The chain starts with the Memory data source, if it has cached data, we just return it, if not, we check in the local storage, if it also don't have data, we pass it to the remote api and then we finish the chain returning what the remote answer. 

Also, after we get a non empty result we cache in the local and also in the memory datasource, so we won't need to always call the API which is an expensive thing.

### Chaining handlers

In this example I created a method `linkWith` which links a chain with the next one, you could also get this via constructor.

### Usage
```
dart run bin/chain_of_responsibility.dart
```

Output example

```
============================================
[COR] - STARTING THE CHAIN
[MEMORY] - I DO NOT HAVE DATA, REQUESTING DOWN THE CHAIN
[LOCAL] - I DO NOT HAVE DATA, REQUESTING DOWN THE CHAIN
[REMOTE] - FETCHING DATA
[LOCAL] - SAVING
[MEMORY] - SAVING
[COR RESULT] => [User1, User2, User3]
[COR] - END OF THE CHAIN
============================================


============================================
[COR] - STARTING THE CHAIN
[MEMORY] - I DO HAVE DATA, HERE IT IS
[COR RESULT] => [User1, User2, User3]
[COR] - END OF THE CHAIN
============================================


============================================
[MEMORY] - CLEARING DATA, SIMULATION
============================================


============================================
[COR] - STARTING THE CHAIN
[MEMORY] - I DO NOT HAVE DATA, REQUESTING DOWN THE CHAIN
[LOCAL] - I DO HAVE DATA, HERE IT IS
[MEMORY] - SAVING
[COR RESULT] => [User1, User2, User3]
[COR] - END OF THE CHAIN
============================================


============================================
[COR] - STARTING THE CHAIN
[MEMORY] - I DO HAVE DATA, HERE IT IS
[COR RESULT] => [User1, User2, User3]
[COR] - END OF THE CHAIN
============================================
```

## Author

Acácio Veit Schneider

![Acácio Veit Schneider ](https://avatars.githubusercontent.com/u/1805244?s=50&v=4)
