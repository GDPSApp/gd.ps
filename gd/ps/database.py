from attrs import field, frozen
from edgedb import AsyncIOClient, create_async_client  # type: ignore

__all__ = ("DATABASE", "Database")


@frozen()
class Database:
    client: AsyncIOClient = field(factory=create_async_client)


DATABASE = Database()
