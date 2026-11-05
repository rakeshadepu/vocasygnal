from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy import text
from sqlalchemy.orm import Session

from app.db.session import get_db

router = APIRouter(tags=["Health"])


@router.get("/health")
def health_check() -> dict[str, str]:
    """Check whether the API application is running."""
    return {
        "status": "healthy",
        "service": "vocasygnal-api",
    }


@router.get("/health/ready")
def readiness_check(
    db: Session = Depends(get_db),
) -> dict[str, str]:
    """Check whether the API can communicate with PostgreSQL."""
    try:
        db.execute(text("SELECT 1"))
    except Exception as exc:
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail="Database connection unavailable",
        ) from exc

    return {
        "status": "ready",
        "database": "connected",
    }
