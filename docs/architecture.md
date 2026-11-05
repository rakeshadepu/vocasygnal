
# VocaSygnal - System Architecture

## 1. Architecture Overview

VocaSygnal follows a modular monolithic architecture.

The frontend communicates with the backend through
versioned REST APIs.

The backend separates API handling, business logic,
data access, and persistence.

## 2. Backend Layers

### API Layer
Handles HTTP requests, routing, and response validation.

### Service Layer
Contains application business logic.

### Repository Layer
Handles database queries and persistence.

### Database Layer
Uses SQLAlchemy ORM and PostgreSQL.

### ML Layer
Contains NLP processing, skill extraction,
job matching, and machine learning workflows.

## 3. Database Entities

Initial entities:

- Company
- Job
- Skill
- JobSkill

## 4. Relationships

- One company can publish multiple jobs.
- One job can require multiple skills.
- One skill can belong to multiple jobs.
- JobSkill represents the many-to-many relationship.

## 5. Technology Decisions

- FastAPI for REST API development.
- SQLAlchemy 2.0 for database operations.
- PostgreSQL for relational data storage.
- Alembic for database migrations.
- Pydantic Settings for application configuration.

## 6. Architectural Principles

- Separation of concerns.
- Modular design.
- Dependency injection.
- Explicit database migrations.
- Automated testing.
- Reproducible development.
- Secure configuration management.

## 7. Future Extensions

- Authentication and authorization.
- Background job processing.
- Job ingestion pipelines.
- NLP skill extraction.
- Semantic job matching.
- Recommendation engine.
