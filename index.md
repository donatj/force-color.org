# `FORCE_COLOR`

An increasing number of command-line software programs support the NO_COLOR environment variable. While many developers and users appreciate the plain output this provides, there should likewise be a way to force color to be enabled in cases where it might otherwise become turned off, like piping the output to a non-interactive terminal. The methods to enable colored text output vary across software, and some don't offer an option at all.

To address the desire for a consistent method to force enable color support, an informal standard was proposed in 2023:

> **Command-line software which outputs colored text should check for a `FORCE_COLOR` environment variable. When this variable is present and not an empty string (regardless of its value), it should force the addition of ANSI color.**

By adopting this standard, users who want colored text output, even in situations like piping or CI environments can simply export `FORCE_COLOR=1` to their environment. This will automatically enable color by default in all software that follows the standard.

If your software supports `NO_COLOR` but doesn't offer a direct way to force enabling color, please consider offering the `FORCE_COLOR` option. If you decide to, please implement this standard to make it easy for your users to enable color and then add your software to this list by submitting a pull request.

This site is a work in progress and may not be fully complete or accurate. Please feel free to contribute by <a href="https://github.com/donatj/force-color.org">submitting a pull request</a>.

## Example Implementation

```c
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

int
main(int argc, char *argv[])
{
    char *no_color = getenv("NO_COLOR");
    char *force_color = getenv("FORCE_COLOR");
    bool color = true;

    if (no_color != NULL && no_color[0] != '\0')
        color = false;

    /* do getopt(3) and/or config-file parsing */

    if (force_color != NULL && force_color[0] != '\0')
        color = true;
    ...
}
```

## Frequently Asked Questions

### Why would I want to force enable color?

Some users prefer to have color enabled. Certain actions like piping output through `less`, `grep` or `tee` will disable color output. This can be frustrating for users who want to see color output in these situations.

Other examples include CI environments which may disable color output by default or may be detected as a non-interative terminal causing color to be disabled.

### Why not just use `--color` or `-c`?

Many software programs already use `--color` or `-c` to enable color output. This is a great option to have, but it's not always possible to use. For example, if you're piping output to another program, you can't use `--color` or `-c` to enable color output. In these cases, you can use `FORCE_COLOR` to force enable color output.

## Color libraries supporting `FORCE_COLOR` to force enable color support

| Software       | Description                                          | Date / Version Supported | 
|----------------|------------------------------------------------------|--------------------------| 
| <a href="https://github.com/chalk">chalk</a>          | Color library for JavaScript                         | <a href="https://github.com/chalk/chalk/releases/tag/v1.0.0">2015-02-23 / 1.0.0</a>       | 
| <a href="https://www.npmjs.com/package/supports-color">supports-color</a> | JavaScript library to detect terminal color supports |                          | 

## Color libraries supporting `FORCE_COLOR` to force enable color support

| Software | Description                    | Date / Version Supported | 
|----------|--------------------------------|--------------------------| 
| <a href="https://www.npmjs.com/">npm</a>      | Package manager for JavaScript |                          | 
| <a href="https://nodejs.org/">node</a>	   | JavaScript runtime             |                          |
