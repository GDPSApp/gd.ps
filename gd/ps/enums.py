from gd.enum_extensions import Flag

__all__ = ("Permissions",)


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
    GODLIKE_LEVELS = 1 << 19
    VERIFY_LEVEL_COINS = 1 << 20
    COMMENT_BAN = 1 << 21
    BAN = 1 << 22
