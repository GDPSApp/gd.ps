from attrs import field, frozen
from edgedb import AsyncIOClient, create_async_client  # type: ignore


@frozen()
class Database:
    client: AsyncIOClient = field(factory=create_async_client)
