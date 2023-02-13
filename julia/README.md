# Julia

See https://docs.julialang.org/en/v1/manual/profile/#External-Profiling

> **Note**
>
> This demo is _incomplete_: Julia does not [disable frame pointer omission on Linux](https://github.com/JuliaLang/julia/blob/v1.8.3/src/codegen.cpp#L13-L15)
> ([JuliaLang/julia#40655](https://github.com/JuliaLang/julia/issues/40655)), Parca Agent is not be able to unwind the stacktraces at the moment.
