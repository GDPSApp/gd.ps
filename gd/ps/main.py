import uvicorn

from gd.ps.core import app

__all__ = ("ps",)


def ps() -> None:
    uvicorn.run(app)
