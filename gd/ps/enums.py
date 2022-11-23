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
    CREATE_MAP_PACKS = 1
    CREATE_GAUNTLETS = 2
    CREATE_QUESTS = 4
    SUGGEST_DEMON = 8
    SUGGEST_STARS = 16
    CHANGE_SONGS = 32
    CHANGE_PASSWORDS = 64
    CHANGE_DESCRIPTIONS = 128
    RENAME_LEVELS = 256
    DELETE_COMMENTS = 512
    DAILY_LEVELS = 1024
    WEEKLY_LEVELS = 2048
    EVENT_LEVELS = 4096
    UNLIST_LEVELS = 8192
    DELETE_LEVELS = 16384
    MOVE_LEVELS = 32768
    RATE_LEVELS = 65536
    FEATURE_LEVELS = 131072
    EPIC_LEVELS = 262144
    VERIFY_LEVEL_COMMENTS = 524288
    COMMENT_BAN = 1048576
    BAN = 2097152
