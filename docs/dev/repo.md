# Full list of repo's and their functions

| Name  | URL  | Type  | Description  |
|:--|:--|:--|:--|
| Odissei Stack  |   | Core  | Main repo to run Dataverse + Skosmos  | 
| Prefect  |   | Ingestion  | Main repo to run enrichment services  |
| Labs  |   | Enrichment  | Main repo to spin docker containers used for enrichments  |
| Semantic enrichment  |   | Enrichment  | Repo to perform Solr-based enrichments based on Skosmos  |
| Skosmos  |   | Controlled vocabularies  | Controlled vocabulary service, part of Odissei Stack  |
| TSV files  |   | Core dependency  | Files that help configure dataverse with metadata blocks  |
| Harvester  |   | Ingestion  | Harvester to take care of creating .dsc or json files |
| Metadata fetcher  |   | Enrichment | A container to fetch metadata |
| Metadata mapper  |   | Enrichment | A container to transform metadata to Dataverse JSON |
| Email sanitizer  |   | Enrichment | A container to strip email addresses  |
| Metadata enhancer  |   | Enrichment | A container to enhance metadata with Skosmos URI's |
| Docs  |   | Documentation  | A container to host documents |
|   |   |   |   |
