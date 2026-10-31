# Portfolio 5: Distributed and Cloud Database Architecture

## 1. Introduction

This activity examines how cloud database services and distributed database concepts can support EliZeta Group, a simulated e-commerce organisation operating six stores in Spain.

The practical implementation uses the PostgreSQL database hosted through Supabase. The existing database contains store, product, customer, order and order-item information.

## 2. Cloud Database Implementation

Supabase provides a hosted PostgreSQL environment that allows the database to be accessed through its online platform.

The EliZeta Group database was created and managed through the Supabase SQL Editor. SQL queries were executed against the hosted database to retrieve information about all six stores.

The multi-store query returned each store's product count and order count. The results showed six products and four orders across the sample dataset.

This demonstrates cloud-hosted database access and centralised management of information for multiple stores.

## 3. Distributed Database Concepts

### 3.1 Replication

Replication involves maintaining copies of database data across multiple database servers or locations.

For EliZeta Group, replication could help maintain availability if one database server becomes unavailable. A primary database could handle writes while one or more replicas serve read requests.

However, replication introduces challenges involving synchronisation and the possibility of replicas temporarily containing older data.

### 3.2 Sharding

Sharding involves dividing a database into smaller portions and distributing them across different servers.

EliZeta Group could consider distributing data by store identifier. For example, records associated with different stores could be assigned to different database partitions or servers.

This approach could support growth as the organisation adds stores and transactions. However, queries involving several stores would require coordination across the relevant data partitions.

### 3.3 Availability

Availability refers to the ability of users and applications to access database services when needed.

A cloud-hosted database can reduce the operational burden of maintaining local database infrastructure. High availability also depends on the service configuration, backups, recovery procedures and infrastructure reliability.

### 3.4 Consistency

Consistency means maintaining reliable and correct data across database operations and copies.

For an e-commerce organisation, consistency is particularly important for stock quantities, payments and order status. For example, an order should not incorrectly reduce inventory or record a payment twice because of inconsistent updates.

Database transactions and suitable replication strategies can help maintain data correctness.

## 4. Suitability for EliZeta Group

A cloud-hosted database provides a central location for managing information across the six stores.

As the organisation grows, distributed database techniques such as replication and sharding could be considered to improve availability, scalability and read performance.

The appropriate design would depend on transaction volume, geographic distribution, consistency requirements, infrastructure costs and operational complexity.

## 5. Implementation Evidence and Limitations

The practical work demonstrated:

- A PostgreSQL database hosted through Supabase.
- SQL access to the hosted database.
- Retrieval of product and order counts for all six stores.
- A shared database model for multi-store operations.

The practical exercise did not configure or test physical database replication or sharding. These concepts are discussed as possible architectural approaches rather than completed implementations.

## 6. Conclusion

The activity demonstrated how a cloud-hosted PostgreSQL database can support centralised information management for a multi-store e-commerce organisation.

It also examined how replication, sharding, availability and consistency could influence the future database architecture of EliZeta Group.

The exercise highlights that cloud hosting provides a foundation for database access, while additional architecture and configuration decisions are required to implement a fully distributed database system.
