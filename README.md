# Data Structures & Algorithms

This repository is a curated collection of hands‑on implementations for core Data Structures and Algorithms.  
Primary language: JavaScript (Node.js). Additional examples in Ruby, C, and C# to demonstrate multi‑language proficiency and implementation patterns across ecosystems. It documents approaches I use to learn, practice, and demonstrate problem solving, complexity awareness, and implementation details for interview‑style and educational challenges.

Purpose

- Implement canonical data structures from scratch (no built‑in shortcuts).
- Show traversal, insertion, deletion and search operations.
- Handle common edge cases (collisions, empty structures, recursion bases).
- Keep implementations readable, testable, and easily runnable.

Languages & Platforms

- JavaScript (Node.js) — primary
- Ruby — companion implementations and challenges
- C — low‑level implementations (arrays, pointers, simple structures)
- C# — higher‑level implementations using static typing and OOP patterns

Repository structure (high level)

- Solve Coding Challenges in JS and Ruby/
  - Queue-coding-challenge/ — Queue using LinkedList (enqueue, dequeue, print)
  - Trees-coding-challenge/ — array→node tree conversion, traversal challenges
- Binary-tree-advance-DS/
  - binaryTree.js — BFS & DFS traversals, insert/search utilities (JS)
  - binary_tree.rb — Ruby tree traversals
- sets-maps-hashTables/
  - maps.js — JS Map usage demo
  - hashTables.js — custom HashTable (string hashing, separate chaining, keys/values/delete/loadFactor/display)
- c/ (examples) — C implementations (arrays, basic linked lists, simple algorithmic problems)
- csharp/ (examples) — C# implementations (classes for data structures, algorithm demos)

Highlights — what I've implemented and why it matters

- Linked List: node insertion, traversal, deletion — used as a building block for Queues.
- Queue: correct enqueue/dequeue semantics, explicit empty behavior.
- Maps & Hash Tables:
  - Built‑in Map demonstrations (API usage and iterators).
  - Custom HashTable with string hashing, collision handling via chaining, and utilities to inspect load factor and contents.
- Trees:
  - Array → Node tree conversion; recursive traversals (pre, in, post).
  - Binary tree insertions using level order (BFS) and DFS traversals.
- Multi‑language perspective:
  - Implementations in JS/Ruby for rapid prototyping and readability.
  - C examples to show pointer manipulation and memory awareness.
  - C# examples to show typed implementations, interfaces, and unitable code patterns.

How to run the demos (Windows examples)

- Open a terminal at the repository root.
- Node (JS):
  - node "f:\Data Structures and Algortims\Data-Structures---Algorithms\sets-maps-hashTables\maps.js"
  - node "f:\Data Structures and Algortims\Data-Structures---Algorithms\Solve Coding Challenges in JS and Ruby\Queue-coding-challenge\queueChallenge.js"
  - node "f:\Data Structures and Algortims\Data-Structures---Algorithms\Binary-tree-advance-DS\binaryTree.js"
- Ruby:
  - ruby "f:\Data Structures and Algortims\Data-Structures---Algorithms\Binary-tree-advance-DS\binary_tree.rb"
- C:
  - Compile with gcc: gcc -o program c/<file>.c && .\program.exe
- C#:
  - Build with dotnet: dotnet run --project csharp/<ProjectFolder>

Coding conventions, Notes & best practices shown in code

- Favor explicit return values (good for reuse and testing); printing is reserved for demo blocks.
- Clear base cases in recursion to avoid stack overflow.
- Use small, focused functions and document complexity where relevant.
- Prefer readability and correctness before micro‑optimizations; add notes when optimizations are applied.

Future work (planned)

- Implement Binary Search Tree (BST) with balanced variants.
- Graphs: adjacency lists, BFS/DFS, Dijkstra, and common interview problems.
- Sorting algorithms: in‑place and stable sorts with complexity notes and visual examples.
- Expand C and C# folders with corresponding versions of key structures and algorithms.

Notes for reviewers or collaborators

- This repo is evolving — expect new implementations and refinements.
- If you want per‑file usage snippets or a short walk‑through, I can add them to each folder.

Contact / Contribute

- Suggestions, bug‑fixes, or improvements are welcome. Create issues or PRs with focused changes and short descriptions.

---

This README summarizes implemented programs and the concepts they demonstrate — a snapshot of practical knowledge in Data Structures & Algorithms across multiple languages.
