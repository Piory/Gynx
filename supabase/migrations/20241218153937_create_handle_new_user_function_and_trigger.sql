CREATE OR REPLACE FUNCTION public.handle_new_user() RETURNS TRIGGER AS
$$
DECLARE
    -- Gynx ID のデフォルト値
    default_gynx_id VARCHAR(16);
BEGIN
    -- Gynx ID のデフォルト値を設定
    SELECT left(md5(NEW.id::TEXT), 16) INTO default_gynx_id;
    -- ユーザー情報を登録
    INSERT INTO public.t_users(id, gynx_id, created_at, updated_at)
    VALUES (NEW.id, default_gynx_id, NEW.created_at, NEW.updated_at);
    -- 匿名ユーザーの場合はプロフィール登録をスキップ
    IF NEW.is_anonymous THEN
        RETURN NEW;
    END IF;
    -- ユーザープロフィールを登録
    INSERT INTO public.t_user_profiles(user_id, username, avatar_url, created_at, updated_at)
    VALUES (NEW.id, NEW.raw_user_meta_data ->> 'full_name', NEW.raw_user_meta_data ->> 'avatar_url', NEW.created_at,
            NEW.updated_at);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT
    ON auth.users
    FOR EACH ROW
EXECUTE PROCEDURE handle_new_user();
