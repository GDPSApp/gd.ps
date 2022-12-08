import uvicorn

from gd.ps.core import app


def run() -> None:
    uvicorn.run(app)
