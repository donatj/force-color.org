# FORCE_COLOR

`FORCE_COLOR` is a standard for enabling colored output in command-line tools. It provides a consistent way to keep color when output is piped or captured.

## Usage

Set `FORCE_COLOR=1` to request color from software that supports it:

```sh
FORCE_COLOR=1 your-command | less -R
```

## The standard

Command-line software that produces colored output should enable color when `FORCE_COLOR` is present and not empty. The value does not matter.

See [force-color.org](https://force-color.org/) for the full standard, an example implementation, and lists of supporting software and libraries.

## Contributing

To add software or a library, first read the [submission guidelines](https://github.com/donatj/force-color.org/wiki/Submission-Guidelines). Then edit the appropriate table and open a pull request:

- [Software](tables_software.tsv)
- [Libraries](tables_libraries.tsv)

The website generates its tables from these tab-separated files. Contributions to the standard and website are also welcome.

## Local development

The project uses Node.js 24. Building the site also requires npm, `make`, and `envsubst`.

```sh
npm ci
make all
```

The generated site is written to `public/`.

## License

[MIT](LICENSE.md)
