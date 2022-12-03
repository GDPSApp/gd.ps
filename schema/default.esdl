using future nonrecursive_access_policies;

module default {
    # not exactly unsigned, one bit is unused

    scalar type int8 extending int16 {
        constraint min_value(-128);
        constraint max_value(127);
    }

    scalar type uint8 extending uint16 {
        constraint max_value(255);
    }

    scalar type uint16 extending int16 {
        constraint min_value(0);
    }

    scalar type uint32 extending int32 {
        constraint min_value(0);
    }

    scalar type uint64 extending int64 {
        constraint min_value(0);
    }

    scalar type int extending bigint;
    scalar type uint extending int {
        constraint min_value(0);
    }

    scalar type ufloat32 extending float32 {
        constraint min_value(0.0);
    }

    scalar type ufloat64 extending float64 {
        constraint min_value(0.0);
    }

    scalar type udecimal extending decimal {
        constraint min_value(0.0);
    }

    scalar type UserCommentID extending sequence;
    scalar type LevelCommentID extending sequence;
    scalar type FriendRequestID extending sequence;
    scalar type GauntletID extending sequence;
    scalar type MapPackID extending sequence;
    scalar type MessageID extending sequence;
    scalar type SongID extending sequence;
    scalar type UserID extending sequence;

    abstract type Entity {
        required property created_at -> datetime {
            default := datetime_current();
            readonly := true;
        };
    }

    abstract type Content {
        required property content -> str {
            constraint max_len_value(65535);
        }
    }

    abstract type Liked {
        multi link likes -> User {
            property dislike -> bool {
                default := false;
            };
        }

        property rating = sum(select -1 if .likes.@dislike else 1);
    }

    abstract type Sendable {
        required link author -> User;
        required link user -> User;
        required property author_deleted -> bool {
            default := false;
        };
        required property user_deleted -> bool {
            default := false;
        };
        required property is_read -> bool {
            default := false;
        };
    }

    type Artist extending Entity {
        required property name -> str;
    }

    abstract type Comment extending Content, Entity, Liked {
        required property author -> User;
    }

    type UserComment extending Comment {
        required property user_comment_id -> UserCommentID;
    }

    type LevelComment extending Comment {
        required property level_comment_id -> LevelCommentID;
        required link level -> Level {
            property record -> uint8 {
                constraint max_value(100);
                default := 0;
            };
        };
    }

    type FriendRequest extending Content, Entity, Sendable {
        required property friend_request_id -> FriendRequestID;
    }

    abstract type Named {
        required property name -> str {
            constraint max_len_value(255);
        }
    }

    type Gauntlet extending Entity, Named {
        required property gauntlet_id -> GauntletID;
        required multi link levels -> Level;
    }

    scalar type Length extending uint8 {
        # TINY = 0
        # SHORT = 1
        # MEDIUM = 2
        # LONG = 3
        # XL = 4
        # PLATFORMER = 5
        constraint max_value(5);
    }

    scalar type Difficulty extending uint8 {
        # UNKNOWN = 0
        # AUTO = 1
        # EASY = 2
        # MEDIUM = 3
        # HARD = 4
        # HARDER = 5
        # INSANE = 6
        # DEMON = 7
        # EASY_DEMON = 8
        # MEDIUM_DEMON = 9
        # HARD_DEMON = 10
        # INSANE_DEMON = 11
        # EXTREME_DEMON = 12
        constraint max_value(12);
    }

    scalar type TimelyType extending uint8 {
        # NOT_TIMELY = 0
        # DAILY = 1
        # WEEKLY = 2
        # EVENT = 3
        constraint max_value(3);
    }

    type Level extending Entity, Liked, Named {
        required property creator -> User;
        required property song -> Song;
        required property description -> str {
            constraint max_len_value(65535);
            default := "";
        };
        required property data -> bytes {
            constraint max_len_value(16777215);
            default := b"";
        };
        required property downloads -> uint32 {
            default := 0;
        };
        required property length -> Length {
            default := 0;
        };
        required property difficulty -> Difficulty {
            default := 0;
        };
        required property demon -> bool {
            default := false;
        };
        required property stars -> uint8 {
            default := 0;
        };
        required property requested_stars -> uint8 {
            default := 0;
        };
        required property score -> Score {
            default := 0;
        };
        required property unfeatured -> bool {
            default := false;
        };
        required property password -> uint32 {
            constraint max_ex_value(1000000);  # 6 digits
            default := 0;
        };
        required property copyable -> bool {
            default := false;
        };
        link original -> Level;
        required property two_player -> bool {
            default := false;
        };
        required property coins -> uint8 {
            constraint max_value(3);
            default := 0;
        };
        required property verified_coins -> bool {
            default := false;
        };
        required property low_detail -> bool {
            default := false;
        };
        required property epic -> bool {
            default := false;
        };
        required property object_count -> uint32 {
            default := 0;
        };
        required property updated_at -> datetime {
            default := datetime_current();
        };
        required property editor_time -> duration {
            default := to_duration();
        };
        required property copies_time -> duration {
            default := to_duration();
        };
        required property timely_type -> TimelyType {
            default := 0;
        };
        required property timely_id -> uint32 {
            default := 0;
        };
    }

    type MapPack extending Entity {
        required property map_pack_id -> MapPackID;
        required property name -> str;
        required multi link levels -> Level;
        required property stars -> uint8 {
            default := 0;
        };
        required property secret_coins -> uint8 {
            constraint max_value(3);
            default := 0;
        };
        required property difficulty -> Difficulty {
            default := 0;
        };
        required property primary_color -> uint32 {
            constraint max_value(16777215);
            default := 16777215;
        };
        required property secondary_color -> uint32 {
            constraint max_value(16777215);
            default := 16777215;
        };
    }

    type Relationship extending Entity {
        required link user_1 -> User;
        required link user_2 -> User;
        required property blocked -> bool {
            default := false;
        };
    }

    type Message extending Content, Entity, Sendable {
        required property message_id -> MessageID;
        required property subject -> str {
            constraint max_len_value(255);
        }
    }

    type Song extending Entity {
        required property name -> str;
        required link artist -> Artist;
        required property size -> ufloat32 {
            default := 0.0;
        };
        required property url -> str;
    }

    scalar type IconType extending uint8 {
        # CUBE = 0
        # SHIP = 1
        # BALL = 2
        # UFO = 3
        # WAVE = 4
        # ROBOT = 5
        # SPIDER = 6
        # SWING_COPTER = 7
        constraint max_value(7);
    }

    scalar type MessageState extending uint8 {
        # OPEN_TO_ALL = 0
        # OPEN_TO_FRIENDS = 1
        # CLOSED = 2
        constraint max_value(2);
    }

    scalar type CommentState extending uint8 {
        # OPEN_TO_ALL = 0
        # OPEN_TO_FRIENDS = 1
        # CLOSED = 2
        constraint max_value(2);
    }

    scalar type FriendRequestState extending uint8 {
        # OPEN_TO_ALL = 0
        # OPEN_TO_FRIENDS_OF_FRIENDS = 1
        # CLOSED = 2
        constraint max_value(2);
    }

    type Role extending Entity, Named {
        required property permissions -> uint64;
        # CREATE_MAP_PACKS = 1 << 0
        # CREATE_GAUNTLETS = 1 << 1
        # CREATE_QUESTS = 1 << 2
        # SUGGEST_DEMONS = 1 << 3
        # SUGGEST_STARS = 1 << 4
        # CHANGE_SONGS = 1 << 5
        # CHANGE_PASSWORDS = 1 << 6
        # CHANGE_DESCRIPTIONS = 1 << 7
        # RENAME_LEVELS = 1 << 8
        # DELETE_COMMENTS = 1 << 9
        # DAILY_LEVELS = 1 << 10
        # WEEKLY_LEVELS = 1 << 11
        # EVENT_LEVELS = 1 << 12
        # UNLIST_LEVELS = 1 << 13
        # DELETE_LEVELS = 1 << 14
        # MOVE_LEVELS = 1 << 15
        # RATE_LEVELS = 1 << 16
        # FEATURE_LEVELS = 1 << 17
        # EPIC_LEVELS = 1 << 18
        # LEGENDARY_LEVELS = 1 << 19
        # GODLIKE_LEVELS = 1 << 20
        # COMMENT_BAN = 1 << 21
        # VERIFY_LEVEL_COINS = 1 << 22
        # BAN = 1 << 23
        required property assign -> bool {
            default := false;
        };
        required property badge -> uint32 {
            default := 0;
        };
        required property color -> uint32 {
            constraint max_value(16777215);
            default := 16777215;
        };
    }

    type Suggestion extending Entity {
        required link author -> User;
        required link level -> Level;
        required property difficulty -> Difficulty;
        required property stars -> uint8;
        required property feature -> bool;
    }

    type User extending Entity {
        required property user_id -> UserID;
        required property name -> str {
            constraint exclusive;
        };
        required property email -> str {
            constraint exclusive;
        };
        required property password_hash -> str;
        required property stars -> uint32 {
            default := 0;
        };
        required property demons -> uint16 {
            default := 0;
        };
        required property diamonds -> uint32 {
            default := 0;
        };
        required property orbs -> uint32 {
            default := 0;
        };
        required property user_coins -> uint32 {
            default := 0;
        };
        required property secret_coins -> uint8 {
            default := 0;
        };
        required property creator_points -> uint16 {
            default := 0;
        };
        required property rank -> uint32 {
            default := 0;
        };
        required property color_1_id -> uint16 {
            default := 0;
        };
        required property color_2_id -> uint16 {
            default := 0;
        };
        required property icon_type -> IconType {
            default := 0;
        };
        required property icon_id -> uint16 {
            default := 0;
        };
        required property cube_id -> uint16 {
            default := 0;
        };
        required property ship_id -> uint16 {
            default := 0;
        };
        required property ball_id -> uint16 {
            default := 0;
        };
        required property ufo_id -> uint16 {
            default := 0;
        };
        required property wave_id -> uint16 {
            default := 0;
        };
        required property robot_id -> uint16 {
            default := 0;
        };
        required property spider_id -> uint16 {
            default := 0;
        };
        required property swing_copter_id -> uint16 {
            default := 0;
        };
        required property explosion_id -> uint16 {
            default := 0;
        };
        required property glow -> bool {
            default := false;
        };
        multi link roles -> Role;
        required property message_state -> MessageState {
            default := 0;
        };
        required property comment_state -> CommentState {
            default := 0;
        };
        required property friend_request_state -> FriendRequestState {
            default := 0;
        };
        property youtube -> str {
            constraint max_len_value(255);
        };
        property twitter -> str {
            constraint max_len_value(255);
        };
        property twitch -> str {
            constraint max_len_value(255);
        };
        property discord -> str {
            constraint max_len_value(255);
        };
        required property banned -> bool {
            default := false;
        };
    }
}
