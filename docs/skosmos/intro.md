# Introduction into Skosmos

Skosmos is a service developed by the `test`, in order to host a controlled vocabulary service. The objective of this software is to provide the following:

1. A machine and human accessible service for vocabulary introspection.
2. A graph database service capable of dynamically generating nodes and linkages which may be explored.

Within the concept of ODISSEI, Skosmos is a major enrichment source, both with community controlled thesauri and our personally developed ones, based on data from CBS.

## CV's

A controlled vocabulary is a thesaurus of a common definition - effectively a single, community-accepted definition of a concept. By centralising this concept and creating linkages, it is enriched, and linked properly through a single service (or instance of a service). 

A controlled vocabulary is, programmatically, a RDF or TTL file, which may be ingested into a graph database such as Jena-Fuseki. A single controlled vocabulary has the following properties, in such a database:

- Terms; terms are the individual concepts which exist in the CV.
- Definitions; these are the definitions/meanings of terms within the CV.
- Linkages; these are references within definitions which might sub-reference other terms in the CV.
- Translations; these are the same terms and definitions in different languages, allowing of a term to be properly translated.

## Linkage

Linkage is achieved by selecting the correct, matching term in a CV, and adding the Skosmos link to it's metadata. Thus, a semantic linkage is formed, and the metadata is enriched, allowing it to found more easily or more comprehensively when searching.

## Connections with the ODISSEI Stack

The ODISSEI Stack, runnning Datavarse, integrates Skosmos in a [fairly specific but highly generic way](https://guides.dataverse.org/en/latest/installation/config.html). This allows you to build connections to services rather quickly, by basically doing fancy AJAX calls while typing in the correctly linked fields in the metadata for a dataset.

Naturally, human fingers are not the tool for choice for such a task; this is why we address and handle Skosmos programmatically, through the workflow orchestrator. In this manner, the dataset is enriched, and once ready, wholly deposited. 

The "downside" is that the software seeking the correct linkages, might make mistakes or might make unclear connections. This is a problem which might be solved with more computing (eg machine learning) or including a human in the loop. However, currently, this does not appear to be a problem.

## ODISSEI Skosmos-related outputs

One of the outputs for ODISSEI has been a CV which hosts CBS-related terms, based on their schema's for this. By converting this to Skosmos, we can access it programmatically (or rather, it's easier to access programmatically).

This output is generated by the ODISSEI VU team.
