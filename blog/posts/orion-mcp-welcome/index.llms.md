# Introducing an MCP Server for ORION-DBs

Navigating Open Research Information Resources on BigQuery with LLMs

mcp

news

tools

ai

Author

Najko Jahn [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0001-5105-1463)

Published

April 7, 2026

Abstract

ORION-DBs is a collection of open research information resources hosted on BigQuery. Their heterogeneous schemas make exploration and querying difficult. When properly guardrailed, LLMs can be genuinely useful for this kind of work, because they are reasonably good at writing SQL once they have enough context about the data. This post presents `orion-mcp`, an experiemental MCP server that lets LLMs like Claude explore schemas, draft SQL, estimate costs, and run queries, providing a practical entry point for users less familiar with open research information resources and BigQuery.

## Introduction

The [ORION-DBs community](https://orion-dbs.community/) maintains open research information resources such as OpenAlex, Crossref, ORCID, DataCite, and more on Google BigQuery. Its [collections](https://orion-dbs.community/collections/) currently span six different BigQuery projects, 52 datasets with various tables, and over 15 TB of data. However, the providers, including [Sesame Open Science](https://orion-dbs.community/collections/sos/), [MultiObs Campinas](https://orion-dbs.community/collections/multiobs/), [CWTS](https://orion-dbs.community/collections/cwts/), [Digital Science](https://orion-dbs.community/collections/ds-open-datasets/) and the [SUB Göttingen](https://orion-dbs.community/collections/subugoe/), use different database schemas and pre-processing routines, which can make it hard to navigate the resources and retrieve data from them.

To broaden use of ORION-DBs, the experimental [`orion-mcp`](https://github.com/orion-dbs-community/orion-mcp) gives language models guided and database-aware access to ORION-DBs through AI apps like Claude Desktop. `orion-mcp` follows a [growing number of Model Context Protocol (MCP) servers combining scholarly resources with language models](https://aarontay.substack.com/p/creating-your-own-research-assistant), many of them offered by commercial vendors and publishers. It provides the language model enough context to write SQL that is executed on BigQuery [rather than in the conversation](https://www.anthropic.com/engineering/code-execution-with-mcp), which reduces token use and keeps data retrieval controllable. BigQuery handles large datasets well and only returns results to the language model, typically at low cost. This allows users to discuss and refine retrieval strategies based on open data in natural language.

This post walks through a use case navigating open research information on BigQuery with `orion-mcp`. The tool is at an early stage, so feedback is welcome.

## What it does

### Explore schemas

These tools work without a BigQuery account, using pre-fetched schemas the ORION-DBs website when [`orion-mcp`](https://github.com/orion-dbs-community/orion-mcp) is started:

- `orion_list_datasets` — list all available ORION-DBs datasets
- `orion_list_tables` — list tables in a specific dataset
- `orion_get_db_schema` — inspect the full schema of a table

### Query BigQuery

Once you know what you want to query, the LLM writes and executes SQL. To avoid surprise costs, a dry-run cost estimate is always shown before any query runs. `SELECT *` queries are blocked to prevent unnecessary large scans.

- `orion_estimate_query_cost` — estimate bytes scanned and cost before running
- `orion_run_bq_query` — execute the confirmed query

### Use case

This screencast demonstrates a typical session.

[Sign in](https://accounts.google.com/ServiceLogin?service=wise&passive=1209600&osid=1&continue=https://drive.google.com/file/d/1gpj5kVV5RRBdN-xxoh7CFz1oXcc6KQJ4/preview&followup=https://drive.google.com/file/d/1gpj5kVV5RRBdN-xxoh7CFz1oXcc6KQJ4/preview&ec=GAZAGQ)

First, I ask whether OpenAlex is available and which version is the most recent. Then, I ask Claude to compare the version provided by MultiObs with the version provided by SUB Göttingen. Having gained this overview, I ask Claude to retrieve the number of diamond open access articles from first authors from Germany between 2021 and 2025. Throughout, Claude provides me with the estimated query costs and presents the SQL for the queries.

You may wish to be more explicit about how the results are presented. Often, a dynamic chart is unnecessary.

## Installation

Full instructions are in the [GitHub repo README](https://github.com/orion-dbs-community/orion-mcp).

In summary, the server runs in a Docker container connected to Claude Desktop via its MCP config file. Authentication uses Google’s [Application Default Credentials](https://cloud.google.com/docs/authentication/application-default-credentials), so your local `gcloud` credentials are used directly. No service account keys needed. A [Google Cloud account](https://cloud.google.com/free) includes 1 TB of free queries per month.

Requirements: [Docker](https://docs.docker.com/desktop/) and the [Google Cloud CLI (`gcloud`)](https://docs.cloud.google.com/sdk/docs/install-sdk). The server is implemented in R using [`{mcptools}`](https://posit-dev.github.io/mcptools/) and [`{ellmer}`](https://ellmer.tidyverse.org/).

## Responsible use

LLMs make mistakes. Always verify that queries return the results you intended before using them in any analysis. If you plan to use this in a publication, check the outlet’s policy on AI-assisted work and document your process accordingly. Please acknowledge resources used.

## Reuse

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

## Citation

BibTeX citation:

``` quarto-appendix-bibtex
@online{jahn2026,
  author = {Jahn, Najko},
  title = {Introducing an {MCP} {Server} for {ORION-DBs}},
  date = {2026-04-07},
  url = {https://orion-dbs.community/blog/posts/orion-mcp-welcome/},
  langid = {en},
  abstract = {ORION-DBs is a collection of open research information
    resources hosted on BigQuery. Their heterogeneous schemas make
    exploration and querying difficult. When properly guardrailed, LLMs
    can be genuinely useful for this kind of work, because they are
    reasonably good at writing SQL once they have enough context about
    the data. This post presents `orion-mcp`, an experiemental MCP
    server that lets LLMs like Claude explore schemas, draft SQL,
    estimate costs, and run queries, providing a practical entry point
    for users less familiar with open research information resources and
    BigQuery.}
}
```

For attribution, please cite this work as:

Jahn, Najko. 2026. “Introducing an MCP Server for ORION-DBs.” ORION-DBs Blog, April 7. <https://orion-dbs.community/blog/posts/orion-mcp-welcome/>.
