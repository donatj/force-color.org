# `FORCE_COLOR`

<time datetime="${DATE}">Last Updated: ${DATE}</time>

Many command-line programs support the `NO_COLOR` environmental variable. While plain output is fine, users also find they need a way to force color on. In particular, cases where color often forces itself off like piping output. Up until now, the methods to force colored text output have varied by program. Many do not even provide such an option.

To address the desire for a consistent method to force enable color support, an informal standard was proposed in 2023:

> **Command-line software which outputs colored text should check for a `FORCE_COLOR` environment variable. When this variable is present and not an empty string (regardless of its value), it should force the addition of ANSI color.**

This standard allows users to enable color in any context. Add `FORCE_COLOR=1` to your environment, and color is enabled in all software supporting the standard.

If your software supports `NO_COLOR` but cannot force color, consider offering the `FORCE_COLOR` option. If your software already offers a method to force colored output, consider additionally supporting `FORCE_COLOR` . If you do add `FORCE_COLOR` support, please add your software to this list by submitting a pull request.

Additionally, please feel free to contribute to the standard by [submitting a pull request](https://github.com/donatj/force-color.org).

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

Other examples include CI environments which may disable color output by default or may be detected as a non-interactive terminal causing color to be disabled.

### Why not just use `--color` or `-c`?

Many software programs already use `--color` or `-c` to enable color output. This is a great option to have, but it's not always possible to use. For example, if you're internally piping output to another program, you can't externally use `--color` or `-c` to enable color output. In these cases, you can use `FORCE_COLOR` to force enable color output.

## Color libraries supporting `FORCE_COLOR` to force enable color support

${LIBRARIES}

## Software supporting `FORCE_COLOR` to force enable color support

${SOFTWARE}

## Forcing colored output in software not supporting `FORCE_COLOR`

${ALTERNATIVES}
