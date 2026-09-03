# Dimensions Open Datasets

The Dimensions Open Datasets collection provides free access to large-scale scholarly and bibliometric datasets in the Google BigQuery environment. These datasets allow data analysts, scientometricians, and researchers to carry out advanced investigations taking advantage of the speed and flexibility of the BigQuery platform.

This collection currently features the public data files for ORCID and DataCite.

GitHub Repo: <https://github.com/digital-science/ds-external-dataset-transformations>

## ORCID Dataset

This dataset is a SQL representation of the ORCID public data file. ORCID (Open Researcher and Contributor ID) is a free, unique, persistent identifier (PID) for individuals to use as they engage in research, scholarship, and innovation activities.

An ORCID record may contain information about a researcher’s work, affiliations, funding, peer review, and more. Items on ORCID records can be broken down into assertions that connect the ORCID iD-holder with an activity or affiliation.

- **Release date:** Feb 2025

- **Update frequency:** Yearly

- **License:** CC0

- **Documentation:** [ORCID Official Schema](https://info.orcid.org/documentation/integration-guide/)

- **Sample Queries:** [Dimensions BigQuery Lab - ORCID](https://bigquery-lab.dimensions.ai/tutorials/09-orcid/)

## DataCite Dataset

DataCite is a leading global non-profit organization that provides persistent identifiers (DOIs) for research data and other research outputs. A DataCite record contains descriptive metadata for research outputs and resources structured according to the DataCite Metadata Schema. These records may include links to other persistent identifiers (PIDs) for works (DOIs), people (ORCID iDs), and organizations (ROR IDs). Both yearly and weekly snapshots are available. Note that the weekly snapshot will also contain DOIs that have subsequently been unpublished in the current year.

- **Release date:** Jan 2026

- **Update frequency:** Yearly, Weekly

- **License:** CC0

- **Documentation:** [DataCite API documentation](https://support.datacite.org/docs/api)

- **Sample Queries:** [Dimensions BigQuery Lab - DataCite](https://bigquery-lab.dimensions.ai/tutorials/10-datacite/)

## datacite

**Created:** Jan 12, 2026 23:11 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=ds-open-datasets&p=ds-open-datasets&d=datacite&page=dataset)

## orcid

**Created:** Dec 03, 2024 21:56 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=ds-open-datasets&p=ds-open-datasets&d=orcid&page=dataset)
