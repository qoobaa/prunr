# Prunr

Notes:

- only 200 and 5xx server responses are supported at the moment, any
  other response will result in `404 Not Found`
- since I've decided to use a destructive `keep_if` array's method, a
  deep cloning the object is necessary to avoid side effects - maybe
  it's not the most elegant solution and certainly not the most memory
  efficient, but it does the job and the implementation is pretty
  straightforward
