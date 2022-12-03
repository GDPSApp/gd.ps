from gd.enum_extensions import Enum, Flag

__all__ = (
    "Length",
    "Difficulty",
    "TimelyType",
    "IconType",
    "MessageState",
    "CommentState",
    "FriendRequestState",
    "Permissions",
)


class Length(Enum):
    TINY = 0
    SHORT = 1
    MEDIUM = 2
    LONG = 3
    XL = 4
    PLATFORMER = 5


class Difficulty(Enum):
    UNKNOWN = 0
    AUTO = 1
    EASY = 2
    MEDIUM = 3
    HARD = 4
    HARDER = 5
    INSANE = 6
    DEMON = 7
    EASY_DEMON = 8
    MEDIUM_DEMON = 9
    HARD_DEMON = 10
    INSANE_DEMON = 11
    EXTREME_DEMON = 12


class TimelyType(Enum):
    NOT_TIMELY = 0
    DAILY = 1
    WEEKLY = 2
    EVENT = 3


class IconType(Enum):
    CUBE = 0
    SHIP = 1
    BALL = 2
    UFO = 3
    WAVE = 4
    ROBOT = 5
    SPIDER = 6
    SWING_COPTER = 7


class MessageState(Enum):
    OPEN_TO_ALL = 0
    OPEN_TO_FRIENDS = 1
    CLOSED = 2


class CommentState(Enum):
    OPEN_TO_ALL = 0
    OPEN_TO_FRIENDS = 1
    CLOSED = 2


class FriendRequestState(Enum):
    OPEN_TO_ALL = 0
    OPEN_TO_FRIENDS_OF_FRIENDS = 1
    CLOSED = 2


class Permissions(Flag):
    CREATE_MAP_PACKS = 1 << 0
    CREATE_GAUNTLETS = 1 << 1
    CREATE_QUESTS = 1 << 2
    SUGGEST_DEMONS = 1 << 3
    SUGGEST_STARS = 1 << 4
    CHANGE_SONGS = 1 << 5
    CHANGE_PASSWORDS = 1 << 6
    CHANGE_DESCRIPTIONS = 1 << 7
    RENAME_LEVELS = 1 << 8
    DELETE_COMMENTS = 1 << 9
    DAILY_LEVELS = 1 << 10
    WEEKLY_LEVELS = 1 << 11
    EVENT_LEVELS = 1 << 12
    UNLIST_LEVELS = 1 << 13
    DELETE_LEVELS = 1 << 14
    MOVE_LEVELS = 1 << 15
    RATE_LEVELS = 1 << 16
    FEATURE_LEVELS = 1 << 17
    EPIC_LEVELS = 1 << 18
    LEGENDARY_LEVELS = 1 << 19
    GODLIKE_LEVELS = 1 << 20
    VERIFY_LEVEL_COINS = 1 << 21
    COMMENT_BAN = 1 << 22
    BAN = 1 << 23
