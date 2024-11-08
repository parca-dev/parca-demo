# .NET

Version 7 and greater are supported. Version 8 introduced some things that make tracking functions a bit more difficult, but should largely still work.

Known issues:
- Very large functions can fail to be symbolized. This will be fixed with: https://github.com/dotnet/runtime/pull/108939
- The runtime can incorrectly track inlining and line numbers. This is an issue with exception backtraces as well. https://dotnetdocs.ir/Post/47/wrong-exception-line-number-in-stack-trace-in-release-mode
