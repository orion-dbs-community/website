# ORION--DBS Community website

Website: <https://orion-dbs.community>

A growing and daily updated collection of publicly available and community-curated datasets on Google BigQuery. We are not affiliated with the data providers or with Google.

## Purpose

This project brings together independent groups that host open scholarly data on Google BigQuery. Rather than each group separately maintaining copies of the same core data sources, the goal is to share the load -- coordinating storage, preprocessing, and documentation so that key open research information resources like Crossref, OpenAIRE, and OpenAlex are combinable and actionable at scale. This website serves as the shared discovery and documentation layer for these collections.

## Featured data sources

The collection currently covers datasets from major open scholarly data providers, including Crossref, OpenAIRE, and OpenAlex, made available through contributing projects:

- [CWTS Leiden Datasets](https://orion-dbs.community/collections/cwts/)
- [InSySPo Campinas Datasets](https://orion-dbs.community/collections/insyspo/)
- [MultiObs Campinas Datasets](https://orion-dbs.community/collections/multiobs/)
- [Sesame Open Science Datasets (SOS)](https://orion-dbs.community/collections/sos/)
- [SUB Göttingen Datasets](https://orion-dbs.community/collections/subugoe/)

## Contributing

If you maintain a publicly available Google BigQuery project with open scholarly data, we'd love to include it in this collection. See [here](https://orion-dbs.community/contributing.html) for details on how to share your project description and submit a pull request.

You can also get in touch with us via email.

## Technical setup

The website is built with [Quarto](https://quarto.org/) and uses R with [bigrquery](https://bigrquery.r-dbi.org/) to fetch dataset metadata from the Google BigQuery REST API. Each contributing project has its own page under `collections/`, created from a shared template (`collections/_template.qmd`). The template takes a BigQuery project ID as a parameter and automatically lists all public datasets and tables in that project. Table metadata -- including schemas, descriptions, row counts, sizes, and update times -- is pulled directly from BigQuery at build time and rendered as interactive tables using [reactable](https://glin.github.io/reactable/). A shared child document (`collections/_dataset_table.qmd`) handles the per-dataset table rendering.

To add a new collection, copy `_template.qmd` to a new folder under `collections/`, set the `bq_project` parameter in the YAML header, add a description, and submit a pull request.

GitHub Actions rebuild the site daily (see `.github/workflows/website-build.yml`) to keep all metadata current.

## Local development

To test the site locally, you need [Quarto](https://quarto.org/docs/get-started/) and R installed.

Install the R dependencies listed in the `DESCRIPTION` file using [pak](https://pak.r-lib.org/):

```r
# install.packages("pak")
pak::local_install_deps()
```

Then, render the full site:

```bash
quarto render
```

Or start a live-reloading preview server:

```bash
quarto preview
```

Note: Rendering requires public access to all BigQuery datasets listed in the collections. If a dataset or table isn't publicly available, the build will fail.

## Contact

Please report any issues or bugs: <https://github.com/orion-dbs-community/website/issues>

Repo-Maintainer: Najko Jahn <najko.jahn@sub.uni-goettingen.de>

## License

Website content is licensed under [CC0](https://creativecommons.org/publicdomain/zero/1.0/). Code is licensed under [MIT](LICENSE).
