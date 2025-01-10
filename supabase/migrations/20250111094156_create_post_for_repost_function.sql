CREATE OR REPLACE FUNCTION create_post_for_repost(
    userId UUID,
    timelineType TIMELINE_TYPE,
    targetPostId BIGINT
)
    RETURNS VOID AS
$$
DECLARE
    postId      BIGINT := generate_snowflake_id();
    followCount INT;
BEGIN
    BEGIN
        -- 投稿を作成
        INSERT INTO t_posts (id, user_id, post_id) VALUES (postId, userId, targetPostId);
        -- 自分のタイムラインに投稿を追加
        INSERT INTO t_user_timelines (user_id, type, post_id) VALUES (userId, timelineType, postId);
        -- フォロワーのタイムラインにも投稿を追加
        SELECT COUNT(*) FROM t_user_follows WHERE follow_user_id = userId INTO followCount;
        IF followCount > 0 THEN
            INSERT INTO t_user_timelines (user_id, type, post_id)
            SELECT user_id, timelineType, postId
            FROM t_user_follows
            WHERE follow_user_id = userId;
        END IF;
        RETURN;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE;
    END;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION create_post_for_repost IS 'リポスト投稿作成';
