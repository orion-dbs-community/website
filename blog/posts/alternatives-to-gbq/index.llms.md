# Alternatives for what?

Public infrastructure alternatives to Google Big Query - an overview of features

news

google big query

alternatives

public infrastructure

Authors

Bianca Kramer [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-5965-6560)

Cameron Neylon [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-0068-716X)

Published

July 6, 2026

Doi

[10.59350/pdkx9-j2b63](https://doi.org/10.59350/pdkx9-j2b63)

Abstract

There are emerging alternatives to Google Big Query in the cloud and for local computing, and organisations exploring these alternatives or interested in doing so. With ORION-DBs, we hope to spur on these developments and their application for opening up use of scholarly data sets. As a first contribution, in this blog post we discuss some features, or lack thereof, of Google Big Query infrastructure, what they mean for how data are made available and how public infrastructure could strive to emulate or improve these features.

There are pragmatic reasons why, as both data providers and users, we independently arrived at Google Big Query as a useful tool for sharing open data sets. Google solves a bunch of the hard problems, including authentication without the need for institutional affiliation, systems provisioning and a highly performant database system.

At the same time, Google Big Query is certainly not open scholarly infrastructure, nor is it fully equitable and [accessible in all parts of the world](https://knowledge.workspace.google.com/admin/support/troubleshooting/countries-or-regions-where-google-workspace-is-available), and Google is not an organisation many of us feel able to trust. Thus, reliance on Google is not a desirable long-term solution.

There are emerging alternatives both in the cloud and for local computing, and organisations exploring these alternatives or interested in doing so. With ORION-DBs, we hope to spur on these developments and their application for opening up use of scholarly data sets.

As a first contribution, in this blog we discuss some features, or lack thereof, of Google Big Query infrastructure, what they mean for how data are made available and how public infrastructure could strive to emulate or improve these features. Considering these features separately can help to ensure conscious and justified choices are made as to which to prioritise when thinking about local server or cloud deployment.

- **Having the underlying data available (stored) in publicly owned/governed infrastructure/data storage**\
  This not the case currently in the Google Big Query setup. However, none of the data sources are made available exclusively through ORION-DBs or any of the subsidiary providers. A condition for inclusion in ORION-DBs is that the data sets are openly available somewhere else with an open license. So at the level of the original data sources, there is no lock-in effect. For the harmonised format of the datasources (table structure after ingest) that’s different - an agreed on archival format (e.g parquet) and storage frequency and location could be of added value here.

- **Having the underlying data available (stored) in Europe or other non-US localities**\
  Data in Google Big Query can be stored on (Google-owned) servers in Europe rather than US (other locations are also available). A point of attention is that combining data sets is only possible if they are in the same locality storage-wise. In Google Big Query, this can be solved by mirroring data sets across 2 or more localities (or have them hosted separately in 2 or more localities). This is a barrier that an open alternative might be able to circumvent entirely.

- **Having the code of the infrastructure open source**\
  Core to our goals is helping people build new kinds of analysis and applications. Investing in new platforms will only work if people trust them to remain accessible. This is why open source is one of the Principles of Open Scholarly Infrastructure; a requirement Google Big Query clearly does not meet. Open source doesn’t guarantee continued accessibility, but it helps provide insurance against risks. BigQuery is a major product for Google and is unlikely to disappear quickly, but pricing could increase or other restrictions could make it difficult. An alternative should provide both access as well as enabling others to support that access if needed and open source (and well documented) systems substantially mitigate the risks of infrastructure disappearing from underneath people.

- **Access to the infrastructure (for computing) with no or minimal gate-keeping authentication/access control**\
  Access to Google Big Query requires a Google account, which is in itself a barrier (dependency on US tech, personal information sharing, etc.). However, beyond this, there is no specific authentication (institutional or otherwise) required with the provider(s) of the ORION databases, minimising friction and social barriers. Risks of misuse/overuse are mitigated by a) all data sets being openly available with no or minimal re-use restrictions, b) all compute costs being borne by the user (see below) and c) the infrastructure being robust enough to not break from excessive use.

- **Cost for storage (incl. pre-processing and ingest) kept separate from cost for compute**\
  This removes administrative burden and risk for providers (keeping their costs contained and predictable), gives users agency over their usage (no externally imposed usage limits) and could be considered an interesting sustainability model.

- **Ability to combine data sources from different providers that all use the same infrastructure** This removes the necessity for any provider to host ‘all’ data sets - reducing costs for providers and increasing options and flexibility for both users and providers. It also makes it possible for different providers to offer the same data set with a different structure (e.g flat or nested, fully relational or not), rather than enforcing one structure for all hosted databases. As an extension, users can add their local data sets to include in analysis (without publicly exposing them) and providers can also contribute with a single public data set.

- **The infrastructure providing both access to the data and an analysis interface**\
  Meaning in principle, end users do not have to install specific software to use the data for analysis. At the same time, for Google Big Query, integration with other platforms/software is well documented, extending usage options to, for example, Python and other languages and workflows.

All this is not to uncritically defend our current choice for Google Big Query, but to explain what we, at least, see as some of its separate characteristics that are relevant both for data providers and users. We recommend considering all elements in this list (and potentially others) when scoping the development of public infrastructure for sharing and facilitating usage of public scholarly metadata sources.
