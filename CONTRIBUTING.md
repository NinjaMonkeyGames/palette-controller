# Rules

1. Array indexing syntax

    All 2D (and higher) arrays must be created and indexed using the bracket nesting form: a[x][y].
    No tuple-style literals/indexing such as [x, y].

2. Global declarations placement

    Any global.* (or equivalent global-scope variables) must be declared at file scope, outside any function/method
    declaration.
    Functions may only reference globals, not introduce new global symbols.

3. No magic numbers

    No literal numeric constants may appear in game logic (except in obviously-constant contexts you explicitly allow,
    e.g., 0 and 1, if you choose).
    Replace with named constants: const SPEED_MAX = 120; or #macro SPEED_MAX 120.

4. No in-place calculation

    A calculation must not mutate a source operand in the same expression.
    If a value changes, compute into a new variable first, then assign:
        Bad: x = x + dx; (if you interpret that strictly)
        Good: var x2 = x + dx; x = x2;
    Also ban “side-effect in expression” patterns like arr[i] += something and var = func() used inside larger
    expressions.

5. Named references for new

    Every new call must be assigned to a variable immediately and never left anonymous:
        Bad: `new Obj(x, y);
        Good: var inst = new Obj(x, y);
