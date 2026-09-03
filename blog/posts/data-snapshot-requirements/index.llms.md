# The power of data snapshots - how to make your data work for others

Data snapshot requirements for ORION-DBs

news

data snapshots

requirements

guidelines

Authors

Bianca Kramer [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-5965-6560)

Cameron Neylon [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-0068-716X)

Published

July 5, 2026

Doi

[10.59350/5pdvg-bhp08](https://doi.org/10.59350/5pdvg-bhp08)

Abstract

If you maintain a data set of open scholarly metadata (e.g. through APIs or full data snapshots) and would like us to consider including your data set in Google Big Query as part of the ORION-DBs collection, this posts outlines the requirements we set out regarding data provision. These include licensing, the availability of a complete data schema, information on versioning and data provenance, and preferred data formats.

Providing access to open research information in shared infrastructures, whether through Big Query or future alternatives, requires access to the data sources. Many organizations provide access to their data though APIs and full data snapshots in various formats and with varying frequency.

## The importance of data snapshots

Providing a full data snapshot is also a requirement of the [Principles of Open Scholarly Infrastructure](https://doi.org/10.14454/G8WV-VM65) which many of these organizations are committed to, with the 2.0 version of the Principles also stressing the importance of clear public documentation. Core to the intent of the original POSI authors was that data could be recovered without restrictions or permissions. A public snapshot under a liberal open license in a trusted repository is a powerful way to achieve this.

Data snapshots are therefore an opportunity to provide greater certainty about the future of data sources, reducing costs to providers, and enabling new applications. We argue that data snapshots should be a first class way of providing data, and for the provision of these to be accompanied by good documentation, including versioning, licensing and data provenance.

## Data snapshot requirements for ORION-DB

If you already maintain a publicly available Google BigQuery project with open scholarly metadata, we’d love to include it in this collection. More information, including on requirements, can be found [here](../../../contributing.llms.md).

If you maintain a data set of open scholarly metadata in a different format, and would like us to consider including your data set in Google Big Query as part of the ORION-DBs collection, we request the data set to meet the following requirements:

- **have the data set available at a publicly accessible location**\
  (either a location maintained by your own organization or a third-party digital archive, e.g. Zenodo)
- **use a permissive open license**\
  (CC0 waiver/public domain dedication recommended; feel free to include attribution guidelines regardless of the license and we will transmit these)
- **provide a complete, up-to-date schema, which can be used to validate the data**\
  (JSON schema recommended)
- **provide information on versioning and data provenance**\
  (including the date of the data snapshot, and intended frequency of updates)
- **use JSON, CSV or parquet as preferred data format**\
  (JSON-lines is the easiest for us to work with)

Having the data **available at a publicly accessible location** is important because we do not want ORION-DBs to be the sole location of any data set. It also provides up front insurance against the concern of data lock-in, and enables simultaneous exploration of other approaches to cloud-based infrastructure.

For inclusion of data sets in ORION-DBs, a **permissive open license** is a requirement for us to be able to ingest the data set and make it available. It also enables end users to use, combine and re-share the data without restrictions. We cannot see who uses the data we provide through ORION or what the data is used for. This is by design. Therefore any data we provide must be available to us under a liberal open license or be in the public domain.

A **complete, up-to-date schema** for the data set facilitates data ingest and enables verification of the data structure after ingest. It also provides end users with the required information about the content and structure of the data.

Similarly, complete and transparent information on **versioning and data provenance** (including the date the snapshot was taken) provided end users with the required information to verify and document the data they use.

We recognize that there are a multitude of **data formats**, and the choice of data format is often dependent on internal processes as much as on projected use and re-use. Both JSON and CSV formats are common data set formats that are relatively straightforward to ingest in Google Big Query, especially when accompanied with a well-documented schema (see above). Google Big Query is also able to ingest Parquet files, which are increasingly used as data format for complex data structures.

If an API is available, a record-level dump of the API output (as JSON-lines i.e. a valid JSON record for each API return on each line of a file) would make a suitable data set for inclusion in ORION-DBs. If the scale of the data is large then multiple files and compression are helpful (see for example the OpenAlex and OpenAIRE public data dumps)

## Optimising the design and delivery of data snapshots

While the data snapshot requirements outlined above reflect our current thinking and practical requirements, they are not set in stone. We hope the ORION-DBs initiative can contribute to a discussion amongst providers and users of open data sets how the design and delivery of data snapshots can be optimized, including file formats, regularity, documentation and more.

The potential benefits will be the provision of documented, reliable, and trustworthy data snapshots, optimised for usability and cost of production and transfer, and the development of shared infrastructure for opening up use of these data sets.

## Reuse

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
