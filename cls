[1mdiff --git a/.gitignore b/.gitignore[m
[1mindex ce55a04..0bfa5fc 100644[m
[1m--- a/.gitignore[m
[1m+++ b/.gitignore[m
[36m@@ -13,6 +13,7 @@[m [mvenv/[m
 .env[m
 .env.*[m
 !.env.example[m
[32m+[m[32m!**/.env.example[m
 [m
 # Node[m
 node_modules/[m
[1mdiff --git a/backend/app/main.py b/backend/app/main.py[m
[1mindex e384169..d6130e5 100644[m
[1m--- a/backend/app/main.py[m
[1m+++ b/backend/app/main.py[m
[36m@@ -1,11 +1,13 @@[m
[31m-[m
 from fastapi import FastAPI[m
 from fastapi.middleware.cors import CORSMiddleware[m
 [m
[32m+[m[32mfrom app.api.v1.endpoints.router import api_router[m
[32m+[m[32mfrom app.core.config import settings[m
[32m+[m
 app = FastAPI([m
[31m-    title="VocaSygnal API",[m
[31m-    description="Job Market Intelligence and Career Matching Platform",[m
[31m-    version="0.1.0",[m
[32m+[m[32m    title=settings.app_name,[m
[32m+[m[32m    description=("Job market intelligence and career matching platform."),[m
[32m+[m[32m    version=settings.app_version,[m
 )[m
 [m
 app.add_middleware([m
[36m@@ -18,16 +20,11 @@[m [mapp.add_middleware([m
 [m
 [m
 @app.get("/")[m
[31m-async def root() -> dict[str, str]:[m
[32m+[m[32mdef root() -> dict[str, str]:[m
     return {[m
         "message": "Welcome to VocaSygnal API",[m
[31m-        "version": "0.1.0",[m
[32m+[m[32m        "version": settings.app_version,[m
     }[m
 [m
 [m
[31m-@app.get("/api/v1/health")[m
[31m-async def health_check() -> dict[str, str]:[m
[31m-    return {[m
[31m-        "status": "healthy",[m
[31m-        "service": "vocasygnal-api",[m
[31m-    }[m
[32m+[m[32mapp.include_router(api_router, prefix="/api/v1")[m
[1mdiff --git a/backend/pyproject.toml b/backend/pyproject.toml[m
[1mindex 2cdaa5b..456c90a 100644[m
[1m--- a/backend/pyproject.toml[m
[1m+++ b/backend/pyproject.toml[m
[36m@@ -5,11 +5,15 @@[m [mbuild-backend = "setuptools.build_meta"[m
 [m
 [project][m
 name = "vocasygnal-backend"[m
[31m-version = "0.1.0"[m
[32m+[m[32mversion = "0.2.0"[m
 description = "Job market intelligence and career matching API"[m
 requires-python = ">=3.12"[m
 dependencies = [[m
     "fastapi[standard]",[m
[32m+[m[32m    "sqlalchemy>=2.0",[m
[32m+[m[32m    "psycopg[binary]",[m
[32m+[m[32m    "alembic",[m
[32m+[m[32m    "pydantic-settings",[m
 ][m
 [m
 [project.optional-dependencies][m
[1mdiff --git a/backend/tests/test_health.py b/backend/tests/test_health.py[m
[1mindex b329aae..631d477 100644[m
[1m--- a/backend/tests/test_health.py[m
[1m+++ b/backend/tests/test_health.py[m
[36m@@ -1,4 +1,3 @@[m
[31m-[m
 from fastapi.testclient import TestClient[m
 [m
 from app.main import app[m
[36m@@ -6,15 +5,23 @@[m [mfrom app.main import app[m
 client = TestClient(app)[m
 [m
 [m
[31m-def test_root_endpoint_returns_welcome_message() -> None:[m
[32m+[m[32mdef test_root_endpoint() -> None:[m
     response = client.get("/")[m
 [m
     assert response.status_code == 200[m
     assert response.json()["message"] == "Welcome to VocaSygnal API"[m
 [m
 [m
[31m-def test_health_endpoint_returns_healthy_status() -> None:[m
[32m+[m[32mdef test_health_endpoint() -> None:[m
     response = client.get("/api/v1/health")[m
 [m
     assert response.status_code == 200[m
     assert response.json()["status"] == "healthy"[m
[32m+[m
[32m+[m
[32m+[m[32mdef test_database_readiness_endpoint() -> None:[m
[32m+[m[32m    response = client.get("/api/v1/health/ready")[m
[32m+[m
[32m+[m[32m    assert response.status_code == 200[m
[32m+[m[32m    assert response.json()["status"] == "ready"[m
[32m+[m[32m    assert response.json()["database"] == "connected"[m
