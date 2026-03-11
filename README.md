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

### Collection info snapshots

Each time a collection page is rendered, it overwrites `data/collection_info_{project}.jsonl` with the current snapshot for that project (one line per table). Git tracks the diff between builds, providing a full history of how metadata evolves over time without the file growing unboundedly. Each line is a JSON object with the following fields:

| Field | Description |
|---|---|
| `collected_at` | ISO 8601 UTC timestamp of the build |
| `project` | BigQuery project ID |
| `dataset` | Dataset ID |
| `table` | Table ID |
| `description` | Table description |
| `dataset_description` | Dataset description |
| `location` | BigQuery region (e.g. `US`, `EU`) |
| `created_at` | Table creation timestamp |
| `last_modified` | Last modification timestamp |
| `num_bytes` | Table size in bytes |
| `num_rows` | Row count |
| `schema` | Full field schema, including nested RECORD fields |

The per-project files are committed back to `main` after every build. The helper that writes the snapshots is in `collect_collection_info.R`.

## Writing blog posts

Blog posts live under `blog/posts/`. Each post is a folder containing an `index.qmd` file.

Blog posts are **rendered locally only** — GitHub Actions never re-renders them. This is controlled by `blog/posts/_metadata.yml` which sets `freeze: true`. Quarto stores the pre-rendered output in the `_freeze/` directory, which is committed to the repository. CI/CD picks up that frozen output instead of re-rendering.

### Adding a new post

1. Create a new folder under `blog/posts/` and add your `index.qmd`.
2. Render the post locally:

```bash
quarto render blog/posts/<your-post>/index.qmd
```

3. Commit both the post source and its frozen output:

```bash
git add blog/posts/<your-post>/ _freeze/blog/posts/<your-post>/
git commit -m "Add blog post: <title>"
```

### Editing an existing post

After editing the `.qmd`, re-render locally and commit the updated freeze output:

```bash
quarto render blog/posts/<your-post>/index.qmd
git add _freeze/blog/posts/<your-post>/
git commit -m "Update blog post: <title>"
```

The knitr cache (`execute: cache: true`) ensures that expensive computations like BigQuery queries are not re-run unless the corresponding code chunk changes.

### Working on a post in progress (WIP)

To keep a post out of the public blog listing while still being able to render and preview it locally, add `status: "wip"` to the post's YAML front matter:

```yaml
status: "wip"
```

The blog listing is configured to exclude posts with this field. Once the post is ready, remove `status: "wip"`, re-render, and commit as usual. Do not use Quarto's built-in `draft: true` — it produces empty HTML and prevents the freeze cache from being populated.

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

Or start a live-reloading preview server without re-rendering everything (recommended after an initial render):

```bash
quarto preview --no-render
```

This skips the expensive initial re-render of collection pages (which make BigQuery calls) and serves whatever is already in `_site/`. Individual files are still re-rendered as you edit them.

Note: Rendering requires public access to all BigQuery datasets listed in the collections. If a dataset or table isn't publicly available, the build will fail.

## Contact

Please report any issues or bugs: <https://github.com/orion-dbs-community/website/issues>

Repo-Maintainer: Najko Jahn <najko.jahn@sub.uni-goettingen.de>

## License

Website content is licensed under [CC0](https://creativecommons.org/publicdomain/zero/1.0/). Code is licensed under [MIT](LICENSE).
