# Open Scholarly Data @ SUB Göttingen

The Scholarly Communication Analytics team at the State and University Library in Göttingen maintains a publicly accessible Open Scholarly Data Warehouse, which is based on Google BigQuery.

The warehouse features monthly Crossref snapshots, as well as data from various other sources, including OpenAlex, Semantic Scholar and Unpaywall, and provides access to open bibliometric data from the German Competence Network for Bibliometrics.

Google BigQuery is provided as part of the OCRE 2024 Framework, with support from the GWGD.

More info: <https://subugoe.github.io/scholcomm_analytics/>; see <https://subugoe.github.io/scholcomm_analytics/data.html> for links to the data processing pipelines used.

Contact: [Najko Jahn](mailto:najko.jahn@sub.uni-goettingen.de), [Nick Haupka](mailto:nick.haupka@sub.uni-goettingen.de)

## cr_history

Description

Historical Crossref Snapshots. Only includes publications with type ‘journal-article’.

**Created:** Oct 29, 2021 07:20 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=cr_history&page=dataset)

## cr_instant

Description

This dataset contains the most recent Crossref Snapshot.

**Created:** Oct 29, 2021 07:37 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=cr_instant&page=dataset)

## hoaddata

Description

Datasets used to compile hoaddata, an R package containing data about hybrid open access publishing <https://subugoe.github.io/hoaddata/>

**Created:** May 12, 2023 11:06 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=hoaddata&page=dataset)

## oa2020

Description

Estimating global publishing output by leading commercial publishers using open metadata.

Work carried out for OA2020 WG on financial flows and future cost scenarios <https://oa2020.org/working-groups/>

**Created:** Dec 11, 2025 10:48 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=oa2020&page=dataset)

## openalex

Description

This dataset contains the most recent OpenAlex Snapshot (before Walden).

**Created:** Jan 10, 2022 14:46 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=openalex&page=dataset)

## openalex_walden

Description

This dataset contains the most recent publicly available OpenAlex-Walden Snapshot. Snapshot date 2026-06-26

**Created:** Dec 03, 2025 10:07 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=openalex_walden&page=dataset)

## openbib

Description

This dataset contains the most recent OPENBIB snapshot.

For more information, see: <https://zenodo.org/records/18429476>

**Created:** Mar 28, 2025 14:22 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=openbib&page=dataset)

## resources

**Created:** Nov 02, 2021 07:53 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=resources&page=dataset)

## semantic_scholar

Description

This dataset contains a snapshot from Semantic Scholar.

–

**Data Source & License**

This dataset contains information from the **Semantic Scholar Open Research Corpus**, provided by the Allen Institute for Artificial Intelligence (AI2) and made available under the [Open Data Commons Attribution License (ODC-By) v1.0](https://opendatacommons.org/licenses/by/1-0/).

The ODC-By license governs the **database rights only** — that is, the structure, organisation, and compilation of the data. It does **not** cover the rights in the individual contents of the database, such as paper titles, abstracts, or full texts, which may be subject to separate copyright or license terms held by their respective authors, publishers, or other rights holders. Users are responsible for ensuring their use of any such content complies with the applicable terms.

For scientific publications making use of this data, please also cite:

Kyle Lo, Lucy Lu Wang, Mark Neumann, Rodney Kinney, and Daniel Weld. 2020. S2ORC: The Semantic Scholar Open Research Corpus. In *Proceedings of the 58th Annual Meeting of the Association for Computational Linguistics*, pages 4969–4983, Online. Association for Computational Linguistics. <https://doi.org/10.18653/v1/2020.acl-main.447>

**Created:** Jun 10, 2024 13:46 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=semantic_scholar&page=dataset)

## upw_history

Description

Historical Unpaywall Snapshots. Only includes records from 2008 onwards.

**Created:** Oct 29, 2021 07:51 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=upw_history&page=dataset)

## upw_instant

Description

This dataset contains the most recent Unpaywall Snapshot. Only records from 2008 onwards are included.

**Created:** Oct 29, 2021 07:52 \| **Location:** US \| [View in BigQuery Console](https://console.cloud.google.com/bigquery?project=subugoe-collaborative&p=subugoe-collaborative&d=upw_instant&page=dataset)
