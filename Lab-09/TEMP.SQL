DELIMITER $$
CREATE
    TRIGGER `blog_after_insert` AFTER INSERT
        ON fb.`blog`
    FOR EACH ROW BEGIN
    INSERT INTO audit (blog_id, changetype) VALUES (NEW.id, 'NEW');
    END $$
    DELIMITER ;