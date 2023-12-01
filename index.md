# `FORCE_COLOR`

<time datetime="${DATE}">Last Updated: ${DATE}</time>

An increasing number of command-line software programs support the NO_COLOR environment variable. While many developers and users appreciate the plain output this provides, there should likewise be a way to force color to be enabled in cases where it might otherwise become turned off, like piping the output to a non-interactive terminal. The methods to enable colored text output vary across software, and some don't offer an option at all.

To address the desire for a consistent method to force enable color support, an informal standard was proposed in 2023:

> **Command-line software which outputs colored text should check for a `FORCE_COLOR` environment variable. When this variable is present and not an empty string (regardless of its value), it should force the addition of ANSI color.**

By adopting this standard, users who want colored text output, even in situations like piping or CI environments can simply export `FORCE_COLOR=1` to their environment. This will automatically enable color by default in all software that follows the standard.

If your software supports `NO_COLOR` but doesn't offer a direct way to force enabling color, please consider offering the `FORCE_COLOR` option. If you decide to, please implement this standard to make it easy for your users to enable color and then add your software to this list by submitting a pull request.

This site is a work in progress and may not be fully complete or accurate. Please feel free to contribute by [submitting a pull request](https://github.com/donatj/force-color.org).

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

| Software | Description | Date / Version Supported |
|-|-|-|
| [chalk](https://github.com/chalk) | Color library for JavaScript | [2015-02-23 / 1.0.0](https://github.com/chalk/chalk/releases/tag/v1.0.0) |
| [supports-color](https://www.npmjs.com/package/supports-color) | JavaScript library to detect terminal color supports | |
| [colorette](https://www.npmjs.com/package/colorette) | JavaScript library to color text | [2018-07-13 / 1.0.0](https://github.com/jorgebucaran/colorette/releases/tag/1.0.0) |
| [rich](https://github.com/Textualize/rich) | Python library to display rich text | [2022-10-02 / 12.6.0](https://github.com/Textualize/rich/releases/tag/v12.6.0) |

## Color software supporting `FORCE_COLOR` to force enable color support

| Software | Description | Date / Version Supported |
|-|-|-|
| [node](https://nodejs.org/node) | JavaScript runtime | |
| [Nox](https://github.com/wntrblm/nox) | Flexible test automation | [2022-01-07 / 2022.1.7](https://github.com/wntrblm/nox/releases/tag/2022.1.7) |
| [npm](https://www.npmjs.com/npm) | Package manager for JavaScript | |
| [jest](https://jestjs.io/jest) | JavaScript testing framework | |
| [nox](https://nox.thea.codes) | Python automation | [2022-01-07 / 2022.1.7](https://github.com/wntrblm/nox/releases/tag/2022.1.7) |
| [pytest](https://docs.pytest.org) | Python testing framework | [2020-07-28 / 6.0.0](https://github.com/pytest-dev/pytest/releases/tag/6.0.0) |
