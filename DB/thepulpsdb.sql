-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema thepulpsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `thepulpsdb` ;

-- -----------------------------------------------------
-- Schema thepulpsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `thepulpsdb` DEFAULT CHARACTER SET utf8 ;
USE `thepulpsdb` ;

-- -----------------------------------------------------
-- Table `user_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_profile` ;

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(255) NULL,
  `bio` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `user_profile_id` INT NOT NULL,
  `email` VARCHAR(100) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_user_profile1_idx` (`user_profile_id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  CONSTRAINT `fk_user_user_profile1`
    FOREIGN KEY (`user_profile_id`)
    REFERENCES `user_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `collection` ;

CREATE TABLE IF NOT EXISTS `collection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `thumbnail_url` VARCHAR(255) NULL,
  `background_url` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_collection_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_collection_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story` ;

CREATE TABLE IF NOT EXISTS `story` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL,
  `description` VARCHAR(255) NULL,
  `thumbnail_url` VARCHAR(255) NULL,
  `background_url` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collection_story`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `collection_story` ;

CREATE TABLE IF NOT EXISTS `collection_story` (
  `collection_id` INT NOT NULL,
  `story_id` INT NOT NULL,
  INDEX `fk_collection_story_collection1_idx` (`collection_id` ASC),
  INDEX `fk_collection_story_story1_idx` (`story_id` ASC),
  CONSTRAINT `fk_collection_story_collection1`
    FOREIGN KEY (`collection_id`)
    REFERENCES `collection` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_collection_story_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `publication` ;

CREATE TABLE IF NOT EXISTS `publication` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `thumbnail_url` VARCHAR(255) NULL,
  `image_url` VARCHAR(255) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cover_artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cover_artwork` ;

CREATE TABLE IF NOT EXISTS `cover_artwork` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `magazine_html`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `magazine_html` ;

CREATE TABLE IF NOT EXISTS `magazine_html` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_url` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `magazine_editor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `magazine_editor` ;

CREATE TABLE IF NOT EXISTS `magazine_editor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `magazine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `magazine` ;

CREATE TABLE IF NOT EXISTS `magazine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cover_artwork_id` INT NULL,
  `publication_id` INT NULL,
  `name` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL,
  `thumbnail_url` VARCHAR(255) NULL,
  `image_url` VARCHAR(1000) NULL,
  `magazine_html_id` INT NULL,
  `volume` INT NULL,
  `issue` INT NULL,
  `magazine_editor_id` INT NULL,
  `table_of_contents` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_magazine_cover_artwork1_idx` (`cover_artwork_id` ASC),
  INDEX `fk_magazine_publication1_idx` (`publication_id` ASC),
  INDEX `fk_magazine_magazine_html1_idx` (`magazine_html_id` ASC),
  INDEX `fk_magazine_magazine_editor1_idx` (`magazine_editor_id` ASC),
  CONSTRAINT `fk_magazine_cover_artwork1`
    FOREIGN KEY (`cover_artwork_id`)
    REFERENCES `cover_artwork` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_magazine_publication1`
    FOREIGN KEY (`publication_id`)
    REFERENCES `publication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_magazine_magazine_html1`
    FOREIGN KEY (`magazine_html_id`)
    REFERENCES `magazine_html` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_magazine_magazine_editor1`
    FOREIGN KEY (`magazine_editor_id`)
    REFERENCES `magazine_editor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `author_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `author_profile` ;

CREATE TABLE IF NOT EXISTS `author_profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(255) NULL,
  `bio` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `author` ;

CREATE TABLE IF NOT EXISTS `author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(100) NULL,
  `author_profile_id` INT NULL,
  `thumbnail_url` VARCHAR(255) NULL,
  `image_url` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_author_author_profile1_idx` (`author_profile_id` ASC),
  UNIQUE INDEX `full_name_UNIQUE` (`full_name` ASC),
  CONSTRAINT `fk_author_author_profile1`
    FOREIGN KEY (`author_profile_id`)
    REFERENCES `author_profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `magazine_story`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `magazine_story` ;

CREATE TABLE IF NOT EXISTS `magazine_story` (
  `story_id` INT NOT NULL,
  `magazine_id` INT NOT NULL,
  INDEX `fk_magazine_story_story1_idx` (`story_id` ASC),
  INDEX `fk_magazine_story_magazine1_idx` (`magazine_id` ASC),
  CONSTRAINT `fk_magazine_story_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_magazine_story_magazine1`
    FOREIGN KEY (`magazine_id`)
    REFERENCES `magazine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_author` ;

CREATE TABLE IF NOT EXISTS `story_author` (
  `story_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  INDEX `fk_story_author_story1_idx` (`story_id` ASC),
  INDEX `fk_story_author_author1_idx` (`author_id` ASC),
  CONSTRAINT `fk_story_author_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_story_author_author1`
    FOREIGN KEY (`author_id`)
    REFERENCES `author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_comment` ;

CREATE TABLE IF NOT EXISTS `story_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `story_id` INT NOT NULL,
  `content` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `parent_comment_id` INT NULL,
  `is_deleted` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_story_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_story_comment_story1_idx` (`story_id` ASC),
  INDEX `fk_story_comment_story_comment1_idx` (`parent_comment_id` ASC),
  CONSTRAINT `fk_story_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_story_comment_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_story_comment_story_comment1`
    FOREIGN KEY (`parent_comment_id`)
    REFERENCES `story_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genre` ENUM('DETECTIVE_CRIME', 'HORROR', 'WESTERN', 'ADVENTURE', 'ROMANCE', 'SCIENCE_FICTION', 'FANTASY', 'WAR_AND_AIR_COMBAT', 'SPORTS', 'NOT_SPECIFIED') NULL DEFAULT 'NOT_SPECIFIED',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticket` ;

CREATE TABLE IF NOT EXISTS `ticket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ticket_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_ticket_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticket_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticket_message` ;

CREATE TABLE IF NOT EXISTS `ticket_message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `user_id` INT NOT NULL,
  `ticket_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ticket_message_user1_idx` (`user_id` ASC),
  INDEX `fk_ticket_message_ticket1_idx` (`ticket_id` ASC),
  CONSTRAINT `fk_ticket_message_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_message_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notification` ;

CREATE TABLE IF NOT EXISTS `notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_notification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_notification` ;

CREATE TABLE IF NOT EXISTS `user_notification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `notification_id` INT NOT NULL,
  `viewed` TINYINT NULL,
  `viewed_at` TIMESTAMP NULL,
  `dismissed` TINYINT NULL,
  `dismissed_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_notification_user1_idx` (`user_id` ASC),
  INDEX `fk_user_notification_notification1_idx` (`notification_id` ASC),
  CONSTRAINT `fk_user_notification_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_notification_notification1`
    FOREIGN KEY (`notification_id`)
    REFERENCES `notification` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating_value` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `publication_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `publication_tag` ;

CREATE TABLE IF NOT EXISTS `publication_tag` (
  `publication_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  INDEX `fk_publication_tag_publication1_idx` (`publication_id` ASC),
  INDEX `fk_publication_tag_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_publication_tag_publication1`
    FOREIGN KEY (`publication_id`)
    REFERENCES `publication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publication_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `magazine_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `magazine_tag` ;

CREATE TABLE IF NOT EXISTS `magazine_tag` (
  `magazine_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  INDEX `fk_magazine_tag_magazine1_idx` (`magazine_id` ASC),
  INDEX `fk_magazine_tag_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_magazine_tag_magazine1`
    FOREIGN KEY (`magazine_id`)
    REFERENCES `magazine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_magazine_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_tag` ;

CREATE TABLE IF NOT EXISTS `story_tag` (
  `story_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  INDEX `fk_story_tag_story1_idx` (`story_id` ASC),
  INDEX `fk_story_tag_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_story_tag_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_story_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `author_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `author_tag` ;

CREATE TABLE IF NOT EXISTS `author_tag` (
  `author_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  INDEX `fk_author_tag_author1_idx` (`author_id` ASC),
  INDEX `fk_author_tag_tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_author_tag_author1`
    FOREIGN KEY (`author_id`)
    REFERENCES `author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_author_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_pdf`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_pdf` ;

CREATE TABLE IF NOT EXISTS `story_pdf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `story_id` INT NOT NULL,
  `story_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_story_url_story1_idx` (`story_id` ASC),
  CONSTRAINT `fk_story_url_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `member` ;

CREATE TABLE IF NOT EXISTS `member` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(255) NULL,
  `thumbnail_url` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_member` ;

CREATE TABLE IF NOT EXISTS `story_member` (
  `story_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  INDEX `fk_story_character_story1_idx` (`story_id` ASC),
  INDEX `fk_story_member_member1_idx` (`member_id` ASC),
  CONSTRAINT `fk_story_character_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_story_member_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_follower`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_follower` ;

CREATE TABLE IF NOT EXISTS `user_has_follower` (
  `follower_id` INT NOT NULL,
  `followed_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  INDEX `fk_user_has_follower_user1_idx` (`follower_id` ASC),
  INDEX `fk_user_has_follower_user2_idx` (`followed_id` ASC),
  CONSTRAINT `fk_user_has_follower_user1`
    FOREIGN KEY (`follower_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_follower_user2`
    FOREIGN KEY (`followed_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_conversation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_conversation` ;

CREATE TABLE IF NOT EXISTS `group_conversation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `member_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `member_group` ;

CREATE TABLE IF NOT EXISTS `member_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `group_conversation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_group_user1_idx` (`user_id` ASC),
  INDEX `fk_group_group_conversation1_idx` (`group_conversation_id` ASC),
  CONSTRAINT `fk_group_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_group_conversation1`
    FOREIGN KEY (`group_conversation_id`)
    REFERENCES `group_conversation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_member` ;

CREATE TABLE IF NOT EXISTS `group_member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `member_group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_group_member_user1_idx` (`user_id` ASC),
  INDEX `fk_group_member_member_group1_idx` (`member_group_id` ASC),
  CONSTRAINT `fk_group_member_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_member_member_group1`
    FOREIGN KEY (`member_group_id`)
    REFERENCES `member_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_conversation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_conversation` ;

CREATE TABLE IF NOT EXISTS `user_conversation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_conversation_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_conversation_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `private_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `private_message` ;

CREATE TABLE IF NOT EXISTS `private_message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_conversation_id` INT NOT NULL,
  `content` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `sender_id` INT NOT NULL,
  `recipient_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_private_message_user_conversation1_idx` (`user_conversation_id` ASC),
  INDEX `fk_private_message_user1_idx` (`sender_id` ASC),
  INDEX `fk_private_message_user2_idx` (`recipient_id` ASC),
  CONSTRAINT `fk_private_message_user_conversation1`
    FOREIGN KEY (`user_conversation_id`)
    REFERENCES `user_conversation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_private_message_user1`
    FOREIGN KEY (`sender_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_private_message_user2`
    FOREIGN KEY (`recipient_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `group_message` ;

CREATE TABLE IF NOT EXISTS `group_message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `group_conversation_id` INT NOT NULL,
  `group_member_id` INT NOT NULL,
  `message` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `parent_message_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_group_message_group_conversation1_idx` (`group_conversation_id` ASC),
  INDEX `fk_group_message_group_member1_idx` (`group_member_id` ASC),
  INDEX `fk_group_message_group_message1_idx` (`parent_message_id` ASC),
  CONSTRAINT `fk_group_message_group_conversation1`
    FOREIGN KEY (`group_conversation_id`)
    REFERENCES `group_conversation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_message_group_member1`
    FOREIGN KEY (`group_member_id`)
    REFERENCES `group_member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_message_group_message1`
    FOREIGN KEY (`parent_message_id`)
    REFERENCES `group_message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `magazine_pdf`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `magazine_pdf` ;

CREATE TABLE IF NOT EXISTS `magazine_pdf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `magazine_url` VARCHAR(255) NULL,
  `magazine_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_magazine_pdf_magazine1_idx` (`magazine_id` ASC),
  CONSTRAINT `fk_magazine_pdf_magazine1`
    FOREIGN KEY (`magazine_id`)
    REFERENCES `magazine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_anchor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_anchor` ;

CREATE TABLE IF NOT EXISTS `story_anchor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `anchor_tag` VARCHAR(100) NULL,
  `magazine_html_id` INT NOT NULL,
  `story_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_story_anchor_magazine_html1_idx` (`magazine_html_id` ASC),
  INDEX `fk_story_anchor_story1_idx` (`story_id` ASC),
  CONSTRAINT `fk_story_anchor_magazine_html1`
    FOREIGN KEY (`magazine_html_id`)
    REFERENCES `magazine_html` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_story_anchor_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artist` ;

CREATE TABLE IF NOT EXISTS `artist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `image_url` VARCHAR(255) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cover_artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cover_artist` ;

CREATE TABLE IF NOT EXISTS `cover_artist` (
  `cover_artwork_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  INDEX `fk_cover_artist_cover_artwork1_idx` (`cover_artwork_id` ASC),
  INDEX `fk_cover_artist_artist1_idx` (`artist_id` ASC),
  CONSTRAINT `fk_cover_artist_cover_artwork1`
    FOREIGN KEY (`cover_artwork_id`)
    REFERENCES `cover_artwork` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cover_artist_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `content` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `parent_comment_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_comment1_idx` (`parent_comment_id` ASC),
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`parent_comment_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS thepulps@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'thepulps'@'localhost' IDENTIFIED BY 'thepulps';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'thepulps'@'localhost';
GRANT ALL ON * TO 'thepulps'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user_profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `user_profile` (`id`, `image_url`, `bio`) VALUES (1, 'https://w7.pngwing.com/pngs/831/88/png-transparent-user-profile-computer-icons-user-interface-mystique-miscellaneous-user-interface-design-smile-thumbnail.png', 'I am the ruler of this domain');
INSERT INTO `user_profile` (`id`, `image_url`, `bio`) VALUES (2, 'https://www.comicbookreligion.com/img/s/o/Solomon_Kane_2.jpg', 'A somber-looking man who wanders the world with no apparent goal other than to vanquish evil in all its forms.');
INSERT INTO `user_profile` (`id`, `image_url`, `bio`) VALUES (3, 'https://i0.wp.com/www.tor.com/wp-content/uploads/2014/12/GaryGianniConan.jpg', 'Hither came Conan, the Cimmerian, black-haired, sullen-eyed, sword in hand, a thief, a reaver, a slayer, with gigantic melancholies and gigantic mirth, to tread the jeweled thrones of the Earth under his sandalled feet.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `user_profile_id`, `email`, `first_name`, `last_name`) VALUES (1, 'admin', '$2a$10$4SMKDcs9jT18dbFxqtIqDeLEynC7MUrCEUbv1a/bhO.x9an9WGPvm', 1, 'ADMIN', 1, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `user_profile_id`, `email`, `first_name`, `last_name`) VALUES (2, 'Solomon', '$2a$10$4SMKDcs9jT18dbFxqtIqDeLEynC7MUrCEUbv1a/bhO.x9an9WGPvm', 1, 'STANDARD', 2, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `user_profile_id`, `email`, `first_name`, `last_name`) VALUES (3, 'Conan', '$2a$10$4SMKDcs9jT18dbFxqtIqDeLEynC7MUrCEUbv1a/bhO.x9an9WGPvm', 1, 'STANDARD', 3, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `collection`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `collection` (`id`, `user_id`, `name`, `created_at`, `thumbnail_url`, `background_url`) VALUES (1, 1, 'Favorites', '2023-03-03T12:35:22', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (1, 'The Mystery of Black Jean', '2023-03-03T12:35:22', 'A story of blood-curdling realism, with a smashing surprise at the end.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (2, 'The Grave', '2023-03-03T12:35:22', 'A soul-gripping story of terror.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (3, 'Hark! The Rattle!', '2023-03-03T12:35:22', 'An uncommon tale that will cling to your memory for many a day.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (4, 'The Ghost Guard', '2023-03-03T12:35:22', 'A “spooky” tale with a grim background.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (5, 'The Ghoul and the Corpse', '2023-03-03T12:35:22', 'An amazing yarn of weird adventure in the frozen North.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (6, 'Fear', '2023-03-03T12:35:22', 'Showing how fear can drive a strong man to the verge of insanity.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (7, 'The Place of Madness', '2023-03-03T12:35:22', 'What two hours in a prison “solitary” did to a man.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (8, 'The Closing Hand', '2023-03-03T12:35:22', 'A brief story powerfully written.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (9, 'The Unknown Beast', '2023-03-03T12:35:22', 'An unusual tale of a terrifying monster.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (10, 'The Basket', '2023-03-03T12:35:22', 'A queer little story about San Francisco.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (11, 'The Accusing Voice', '2023-03-03T12:35:22', 'The singular experience of Allen Defoe.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (12, 'The Sequel', '2023-03-03T12:35:22', 'A new conclusion to Edgar Allen Poe’s “Cask of Amontillado.”', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (13, 'The Weaving Shadows', '2023-03-03T12:35:22', 'Chet Burke’s strange adventures in a haunted house.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (14, 'Nimba, the Cave Girl', '2023-03-03T12:35:22', 'An odd, fantastic little story of the Stone Age.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (15, 'The Young Man Who Wanted to Die', '2023-03-03T12:35:22', 'An anonymous author submits a startling answer to the question, “What comes after death?”', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (16, 'The Scarlet Night', '2023-03-03T12:35:22', 'A tale with an eerie thrill.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (17, 'The Extraordinary Experiment of Dr. Calgroni', '2023-03-03T12:35:22', 'An eccentric doctor creates a frightful living thing.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (18, 'The Return of Paul Slavsky', '2023-03-03T12:35:22', 'A “creepy” tale that ends in a shuddering, breath-taking way.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (19, 'The House of Death', '2023-03-03T12:35:22', 'The strange secret of a lonely woman.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (20, 'The Gallows', '2023-03-03T12:35:22', 'An out-of-the-ordinary story.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (21, 'The Skull', '2023-03-03T12:35:22', 'A grim tale with a terrifying end.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (22, 'The Ape-Man', '2023-03-03T12:35:22', 'A Jungle tale that is somehow “different.”', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (23, 'The Dead Man’s Tale', '2023-03-03T12:35:22', 'An astounding yarn that will hold you spellbound and make you breathe fast with a new mental sensation.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (24, 'Ooze', '2023-03-03T12:35:22', 'A Remarkable short novel by a master of “gooseflesh” fiction.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (25, 'The Chain', '2023-03-03T12:35:22', 'Craigie is at his best here.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (26, 'The Thing of a Thousand Shapes', '2023-03-03T12:35:22', 'Don’t start this story late at night.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (27, 'The Eyrie', '2023-03-03T12:35:22', NULL, NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (28, 'The Scar', '2023-03-03T12:35:22', 'A Thrilling Novelette.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (29, 'Beyond the Door', '2023-03-03T12:35:22', 'A Short Story of Gripping Interest.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (30, 'The Tortoise Shell Comb', '2023-03-03T12:35:22', 'A Fantasy of a Mad Brain.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (31, 'A Photographic Phantasm', '2023-03-03T12:35:22', NULL, NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (32, 'The Living Nightmare', '2023-03-03T12:35:22', 'A Night in a House of Death.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (33, 'The Incubus', '2023-03-03T12:35:22', 'A Frightful Adventure in an Ancient Tomb.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (34, 'The Bodymaster', '2023-03-03T12:35:22', 'An Amazing Novelette.', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (35, 'Jungle Death', '2023-03-03T12:35:22', 'A Story in Which Crocodiles and Voodooism Play the Stellar Roles.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (36, 'The Snake Fiend', '2023-03-03T12:35:22', 'A Tale of Diabolic Terror.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (37, 'A Square of Canvas', '2023-03-03T12:35:22', 'A Story of an Insane Artist.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (38, 'The Affair of the Man in Scarlet', '2023-03-03T12:35:22', 'A Weird Story of the Thirteenth Century.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (39, 'The Hideous Face', '2023-03-03T12:35:22', 'A Grim Tale of Frightful Revenge.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (40, 'The Forty Jars', '2023-03-03T12:35:22', 'A Strange Story of the Orient.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (41, 'The Whispering Thing', '2023-03-03T12:35:22', 'A Two-part Novel of Death and Terror.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (42, 'The Thing of a Thousand Shapes', '2023-03-03T12:35:22', 'The Concluding Chapters of a Weird Novel.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (43, 'The Conquering Will', '2023-03-03T12:35:22', 'Do the Dead Return to Life?	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (44, 'Six Feet of Willow', '2023-03-03T12:35:22', 'The Strange Tale of a Yellow Man and His Beloved Reptile.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (45, 'The Hall of the Dead', '2023-03-03T12:35:22', 'An Occult Story of Ancient Egypt.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (46, 'The Parlor Cemetery', '2023-03-03T12:35:22', 'A Grisly Satire.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (47, 'Golden Glow', '2023-03-03T12:35:22', 'A “Haunted House” Story with a Touch of Humor.	', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `description`, `thumbnail_url`, `background_url`) VALUES (48, 'The Eyrie', '2023-03-03T12:35:22', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `collection_story`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `collection_story` (`collection_id`, `story_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `publication`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `publication` (`id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `description`) VALUES (1, 'Weird Tales Magazine', '2023-03-03T12:35:22', 'https://ia800908.us.archive.org/33/items/WeirdTalesV01n01192303/__ia_thumb.jpg', NULL, 'Weird Tales is an American fantasy and horror fiction pulp magazine founded by J. C. Henneberger and J. M. Lansinger in late 1922. The first issue, dated March 1923, appeared on newsstands February 18.The first editor, Edwin Baird, printed early work by H. P. Lovecraft, Seabury Quinn, and Clark Ashton Smith, all of whom would go on to be popular writers, but within a year the magazine was in financial trouble. Henneberger sold his interest in the publisher, Rural Publishing Corporation, to Lansinger and refinanced Weird Tales, with Farnsworth Wright as the new editor. The first issue under Wright’s control was dated November 1924. The magazine was more successful under Wright, and despite occasional financial setbacks it prospered over the next fifteen years. Under Wright’s control the magazine lived up to its subtitle, “The Unique Magazine”, and published a wide range of unusual fiction.\n\nLovecraft’s Cthulhu mythos stories first appeared in Weird Tales, starting with “The Call of Cthulhu” in 1928. These were well-received, and a group of writers associated with Lovecraft wrote other stories set in the same milieu. Robert E. Howard was a regular contributor, and published several of his Conan the Barbarian stories in the magazine, and Seabury Quinn’s series of stories about Jules de Grandin, a detective who specialized in cases involving the supernatural, was very popular with the readers. Other well-liked authors included Nictzin Dyalhis, E. Hoffmann Price, Robert Bloch, and H. Warner Munn. Wright published some science fiction, along with the fantasy and horror, partly because when Weird Tales was launched there were no magazines specializing in science fiction, but he continued this policy even after the launch of magazines such as Amazing Stories in 1926. Edmond Hamilton wrote a good deal of science fiction for Weird Tales, though after a few years he used the magazine for his more fantastic stories, and submitted his space operas elsewhere.\n\nIn 1938 the magazine was sold to William Delaney, the publisher of Short Stories, and within two years Wright, who was ill, was replaced by Dorothy McIlwraith as editor. Although some successful new authors and artists, such as Ray Bradbury and Hannes Bok, continued to appear, the magazine is considered by critics to have declined under McIlwraith from its heyday in the 1930s. Weird Tales ceased publication in 1954, but since then numerous attempts have been made to relaunch the magazine, starting in 1973. The longest-lasting version began in 1988 and ran with an occasional hiatus for over 20 years under an assortment of publishers. In the mid-1990s the title was changed to Worlds of Fantasy & Horror because of licensing issues, with the original title returning in 1998.\n\nThe magazine is regarded by historians of fantasy and science fiction as a legend in the field, with Robert Weinberg, author of a history of the magazine, considering it “the most important and influential of all fantasy magazines”. Weinberg’s fellow historian, Mike Ashley, is more cautious, describing it as “second only to Unknown in significance and influence”, adding that “somewhere in the imagination reservoir of all U.S. (and many non-U.S.) genre-fantasy and horror writers is part of the spirit of Weird Tales”.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cover_artwork`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (1, 'https://ia800908.us.archive.org/BookReader/BookReaderImages.php?zip=/33/items/WeirdTalesV01n01192303/Weird%20Tales%20v01n01%20%281923-03%29_jp2.zip&file=Weird%20Tales%20v01n01%20%281923-03%29_jp2/Weird%20Tales%20v01n01%20%281923-03%29_0000.jp2&id=WeirdTalesV01n01192303&scale=2&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (2, 'https://ia803003.us.archive.org/BookReader/BookReaderImages.php?zip=/35/items/WeirdTalesV01n02192304/Weird%20Tales%20v01n02%20%281923-04%29_jp2.zip&file=Weird%20Tales%20v01n02%20%281923-04%29_jp2/Weird%20Tales%20v01n02%20%281923-04%29_0000.jp2&id=WeirdTalesV01n02192304&scale=2&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (3, 'https://ia800909.us.archive.org/BookReader/BookReaderImages.php?zip=/34/items/WeirdTalesV01n03192305/Weird%20Tales%20v01n03%20%281923-05%29_jp2.zip&file=Weird%20Tales%20v01n03%20%281923-05%29_jp2/Weird%20Tales%20v01n03%20%281923-05%29_0000.jp2&id=WeirdTalesV01n03192305&scale=4&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (4, 'https://ia600904.us.archive.org/BookReader/BookReaderImages.php?zip=/22/items/Weird_Tales_v01n04_1923-06/weird_tales_1923-06_jp2.zip&file=weird_tales_1923-06_jp2/weird_tales_1923-06_0000.jp2&id=Weird_Tales_v01n04_1923-06&scale=4&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (5, 'https://ia803006.us.archive.org/BookReader/BookReaderImages.php?zip=/6/items/WeirdTales_v02n01_1923-07-08/weird_tales_1923-07-08_jp2.zip&file=weird_tales_1923-07-08_jp2/weird_tales_1923-07-08_0000.jp2&id=WeirdTales_v02n01_1923-07-08&scale=4&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (6, 'https://ia600903.us.archive.org/BookReader/BookReaderImages.php?zip=/12/items/Weird_Tales_v02n02_1923-09/weird_tales_1923-09_jp2.zip&file=weird_tales_1923-09_jp2/weird_tales_1923-09_0000.jp2&id=Weird_Tales_v02n02_1923-09&scale=4&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (7, 'https://ia800909.us.archive.org/BookReader/BookReaderImages.php?zip=/22/items/Weird_Tales_v02n03_1923-10/weird_tales_1923-10_jp2.zip&file=weird_tales_1923-10_jp2/weird_tales_1923-10_0000.jp2&id=Weird_Tales_v02n03_1923-10&scale=4&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (8, 'https://ia600906.us.archive.org/BookReader/BookReaderImages.php?zip=/18/items/WeirdTalesV02N04192311/Weird%20Tales%20v02%20n04%20%281923-11%29_jp2.zip&file=Weird%20Tales%20v02%20n04%20%281923-11%29_jp2/Weird%20Tales%20v02%20n04%20%281923-11%29_0000.jp2&id=WeirdTalesV02N04192311&scale=4&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (9, 'https://ia803005.us.archive.org/BookReader/BookReaderImages.php?zip=/9/items/WeirdTalesV03N01192401/Weird%20Tales%20v03%20n01%20%281924-01%29_jp2.zip&file=Weird%20Tales%20v03%20n01%20%281924-01%29_jp2/Weird%20Tales%20v03%20n01%20%281924-01%29_0000.jp2&id=WeirdTalesV03N01192401&scale=4&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (10, 'https://ia803008.us.archive.org/BookReader/BookReaderImages.php?zip=/35/items/WeirdTalesV03N02192402/Weird%20Tales%20v03%20n02%20%281924-02%29_jp2.zip&file=Weird%20Tales%20v03%20n02%20%281924-02%29_jp2/Weird%20Tales%20v03%20n02%20%281924-02%29_0000.jp2&id=WeirdTalesV03N02192402&scale=2&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (11, 'https://ia803006.us.archive.org/BookReader/BookReaderImages.php?zip=/0/items/WeirdTalesV03n03192403/Weird%20Tales%20v03n03%20%281924-03%29_jp2.zip&file=Weird%20Tales%20v03n03%20%281924-03%29_jp2/Weird%20Tales%20v03n03%20%281924-03%29_0000.jp2&id=WeirdTalesV03n03192403&scale=8&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (12, 'https://ia903009.us.archive.org/BookReader/BookReaderImages.php?zip=/26/items/WeirdTalesV03n04192404/Weird%20Tales%20v03n04%20%281924-04%29_jp2.zip&file=Weird%20Tales%20v03n04%20%281924-04%29_jp2/Weird%20Tales%20v03n04%20%281924-04%29_0000.jp2&id=WeirdTalesV03n04192404&scale=2&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (13, 'https://ia800907.us.archive.org/BookReader/BookReaderImages.php?zip=/3/items/WeirdTales1924050607ATLPM/Weird%20Tales%20-%201924-05-06-07%20%5BAT-LPM%5D_jp2.zip&file=Weird%20Tales%20-%201924-05-06-07%20%5BAT-LPM%5D_jp2/Weird%20Tales%20-%201924-05-06-07%20%5BAT-LPM%5D_0000.jp2&id=WeirdTales1924050607ATLPM&scale=4&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (14, 'https://ia803009.us.archive.org/BookReader/BookReaderImages.php?zip=/34/items/WeirdTalesV04N03192411/Weird%20Tales%20v04%20n03%20%281924-11%29_jp2.zip&file=Weird%20Tales%20v04%20n03%20%281924-11%29_jp2/Weird%20Tales%20v04%20n03%20%281924-11%29_0000.jp2&id=WeirdTalesV04N03192411&scale=2&rotate=0');
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (15, 'https://ia903005.us.archive.org/BookReader/BookReaderImages.php?zip=/35/items/WeirdTalesV04N04192412/Weird%20Tales%20v04%20n04%20%281924-12%29_jp2.zip&file=Weird%20Tales%20v04%20n04%20%281924-12%29_jp2/Weird%20Tales%20v04%20n04%20%281924-12%29_0000.jp2&id=WeirdTalesV04N04192412&scale=2&rotate=0');

COMMIT;


-- -----------------------------------------------------
-- Data for table `magazine_html`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `magazine_html` (`id`, `file_url`) VALUES (1, 'https://www.gutenberg.org/files/68957/68957-h/68957-h.htm');
INSERT INTO `magazine_html` (`id`, `file_url`) VALUES (2, 'https://www.gutenberg.org/files/69606/69606-h/69606-h.htm');
INSERT INTO `magazine_html` (`id`, `file_url`) VALUES (3, 'https://www.gutenberg.org/files/69607/69607-h/69607-h.htm');
INSERT INTO `magazine_html` (`id`, `file_url`) VALUES (4, 'https://www.gutenberg.org/files/69608/69608-h/69608-h.htm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `magazine_editor`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `magazine_editor` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (1, 'Edwin Baird', 'Edwin Baird (1886 – September 27, 1954) was the first editor of Weird Tales, the pioneering pulp magazine that specialized in horror fiction, as well as Detective Tales, later re-titled Real Detective Tales.', '2023-03-03T12:35:22', NULL);
INSERT INTO `magazine_editor` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (2, 'Farnsworth Wright', 'Farnsworth Wright (July 29, 1888 – June 12, 1940) was the editor of the pulp magazine Weird Tales during the magazine\'s heyday, editing 179 issues from November 1924 to March 1940. Jack Williamson called Wright \"the first great fantasy editor\".', '2023-03-03T12:35:22', NULL);
INSERT INTO `magazine_editor` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (3, 'Dorothy McIlwraith', 'Dorothy Stevens McIlwraith (October 14, 1891 – August 23, 1976)[2] was the third editor of Weird Tales, the pioneering pulp magazine that specialized in horror fiction and fantasy fiction. She also edited Short Stories magazine.', '2023-03-03T12:35:22', NULL);
INSERT INTO `magazine_editor` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (4, 'Lamont Buchanan', 'Associate editor Lamont Buchanan had primary editing responsibilities from about summer 1945 through his resignation in 1949. The last issue to list him on the masthead is September 1949. The issue marking the precise start of his editorship is currently unknown.', '2023-03-03T12:35:22', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `magazine`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (1, 1, 1, 'Weird Tales, March 1923', '2023-03-03T12:35:22', 'https://ia800908.us.archive.org/33/items/WeirdTalesV01n01192303/__ia_thumb.jpg', 'https://ia800908.us.archive.org/BookReader/BookReaderImages.php?zip=/33/items/WeirdTalesV01n01192303/Weird%20Tales%20v01n01%20%281923-03%29_jp2.zip&file=Weird%20Tales%20v01n01%20%281923-03%29_jp2/Weird%20Tales%20v01n01%20%281923-03%29_0000.jp2&id=WeirdTalesV01n01192303&scale=2&rotate=0', 1, 1, 1, 1, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><div> <b><i>Weird Tales</i></b> [v1 #1, March 1923] (25¢, 192pp+, pulp, cover by R. R. Epperly)</div>7 · The Dead Man’s Tale · Willard E. Hawkins · ss<br>19 · Ooze · Anthony M. Rud · nv<br>32 · The Thing Of A Thousand Shapes [Part 1 of 2] · Otis Adelbert Kline · nv<br>41 · The Mystery Of Black Jean · Julian Kilman · ss<br>47 · The Grave · Orville R. Emerson · ss<br>53 · Hark! The Rattle! · Joel Townsley Rogers · ss<br>59 · The Ghost Guard · Bryan Irvine · ss<br>65 · The Ghoul And The Corpse · G. A. Wells · ss<br>73 · Fear · David R. Solomon · ss<br>77 · The Chain · Hamilton Craigie · ss<br>89 · The Place Of Madness · Merlin Moore Taylor · ss<br>98 · The Closing Hand · Farnsworth Wright · vi<br>100 · The Unknown Beast · Howard Ellis Davis · ss<br>106 · The Basket · Herbert J. Mangham · ss<br>110 · The Accusing Voice · Meredith Davis · nv<br>119 · The Sequel [Fortunato] · Walter Scott Story · vi<br>122 · The Weaving Shadows · W. H. Holmes · ss<br>131 · Nimba, The Cave Girl · R. T. M. Scott · ss<br>135 · The Young Man Who Wanted To Die · Anon. · ss<br>140 · The Scarlet Night · William Sanford · ss<br>143 · The Extraordinary Experiment Of Dr. Calgroni · Joseph Faus &amp; James Bennett Wooding · ss<br>150 · The Return Of Paul Slavsky · George Warburton Lewis · ss<br>156 · The House Of Death · F. Georgia Stroup · ss<br>161 · The Gallows · I. W. D. Peters · ss<br>164 · The Skull · Harold Ward · ss<br>169 · The Ape-Man · James B. M. Clark, Jr. · ss<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Willard E. Hawkins · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Anthony M. Rud · lt\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (2, 2, 1, 'Weird Tales, April 1923', '2023-03-03T12:35:22', 'https://ia803003.us.archive.org/35/items/WeirdTalesV01n02192304/__ia_thumb.jpg', 'https://ia803003.us.archive.org/BookReader/BookReaderImages.php?zip=/35/items/WeirdTalesV01n02192304/Weird%20Tales%20v01n02%20%281923-04%29_jp2.zip&file=Weird%20Tales%20v01n02%20%281923-04%29_jp2/Weird%20Tales%20v01n02%20%281923-04%29_0000.jp2&id=WeirdTalesV01n02192304&scale=2&rotate=0', 2, 1, 2, 1, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><div><b><i>Weird Tales</i></b> [v1 #2, April 1923] (25¢, 192pp+, pulp, cover by R. M. Mally)<br></div>7 · The Scar · Carl Rasmus · nv<br>23 · Beyond The Door · J. Paul Suter · ss<br>34 · The Tortoise Shell Comb · Roylston Markham · ss<br>37 · A Photographic Phantasm · Paul Crumpler, M.D. · ar<br>38 · The Living Nightmare · Anton M. Oliver · ss<br>42 · The Incubus · Hamilton Craigie · ss<br>49 · The Bodymaster · Harold Ward · nv<br>70 · Jungle Death · Artemus Calloway · ss<br>75 · The Snake Fiend · Farnsworth Wright · ss<br>81 · A Square Of Canvas · Anthony M. Rud · ss<br>91 · The Affair Of The Man In Scarlet · Julian Kilman · ss<br>99 · The Hideous Face · Victor Johns · ss<br>105 · The Forty Jars · Ray McGillivray · ss<br>114 · The Wish · Myrtle Levy Gaylord · vi<br>116 · The Whispering Thing [Part 1 of 2] · Laurie McClintock &amp; Culpeper Chunn · na<br>139 · The Thing Of A Thousand Shapes [Part 2 of 2] · Otis Adelbert Kline · nv<br>152 · The Conquering Will · Ted Olson · ss<br>157 · Six Feet Of Willow—Green · Carroll K. Michener · ss<br>163 · The Hall Of The Dead · Francis D. Grierson · ss<br>169 · The Parlor Cemetery · C. E. Howard · ss<br>173 · Golden Glow · Harry Irving Shumway · ss<br>&nbsp;&nbsp;&nbsp; [letter] · C. L. Austin · lt<br>&nbsp;&nbsp;&nbsp; [letter] · S. O. B. · lt<br>&nbsp;&nbsp;&nbsp; [letter] · D. L. C. · lt<br>&nbsp;&nbsp;&nbsp; [letter] · H. C. · lt<br>&nbsp;&nbsp;&nbsp; [letter] · Vance J. Hoyt, Dr. · lt<br>&nbsp;&nbsp;&nbsp; [letter] · E. E. L. · lt<br>&nbsp;&nbsp;&nbsp; [letter] · C. P. O. · lt<br>&nbsp;&nbsp;&nbsp; [letter] · J. H. O. · lt<br>&nbsp;&nbsp;&nbsp; [letter] · Anthony M. Rud · lt<br>&nbsp;&nbsp;&nbsp; [letter] · H. W. · lt<br>&nbsp;&nbsp;&nbsp; [letter] · William S. Waudby · lt<br>&nbsp;&nbsp;&nbsp; [letter] · Victor Wilson · lt\n');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (3, 3, 1, 'Weird Tales, May 1923', '2023-03-03T12:35:22', 'https://ia800909.us.archive.org/34/items/WeirdTalesV01n03192305/__ia_thumb.jpg', 'https://ia800909.us.archive.org/BookReader/BookReaderImages.php?zip=/34/items/WeirdTalesV01n03192305/Weird%20Tales%20v01n03%20%281923-05%29_jp2.zip&file=Weird%20Tales%20v01n03%20%281923-05%29_jp2/Weird%20Tales%20v01n03%20%281923-05%29_0000.jp2&id=WeirdTalesV01n03192305&scale=4&rotate=0', 3, 1, 3, 1, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><div><b><i>Weird Tales</i></b> [v1 #3, May 1923] ed. Edwin Baird (25¢, 120pp+, large, cover by William F. Heitman)</div>5 · The Moon Terror [Part 1 of 2] · A. G. Birch · na<br>22 · The Secret Fear · Kenneth Duane Whipple · ss<br>23 · Jungle Beasts · William P. Barron · ss<br>30 · The Golden Caverns · Julian Kilman · nv<br>39 · Vials Of Insects · Paul Ellsworth Triem · ss<br>49 · An Eye For An Eye · G. W. Crane · ss<br>52 · The Floor Above · M. Humphreys · ss<br>57 · Penelope · Vincent Starrett · nv<br>61 · The Purple Heart · Herman Sisk · ss<br>62 · Feline · Bruce Grant · vi<br>64 · Two Hours Of Death · E. Thayles Emmons · ss<br>67 · Midnight Black · Hamilton Craigie · ss<br>70 · The Haunted And The Haunters; Or, The House And The Brain · Edward Bulwer-Lytton · nv <b>A Strange Story And The Haunted And The Haunters</b>, J.B. Lippincott &amp; Co. 1865; revised from Blackwood’s Edinburgh Magazine, August 1859 (anonymously) to remove material reused in A Strange Story.<br>78 · The Whispering Thing [Part 2 of 2] · Laurie McClintock &amp; Culpeper Chunn · na<br>85 · The Death Cell · F. K. Moss · ss<br>89 · The Devil Plant · Lyle Wilson Holden · ss<br>91 · Hootch · William Sanford · vi<br>92 · The Thunder Voice · F. Walter Wilson · ss<br>96 · Case No. 27 · Mollie Frank Ellis · ss<br>99 · The Finale · William Merrit · ss<br>101 · The Closed Cabinet · Anon. · na Blackwood’s Edinburgh Magazine January 1895<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Earl L. Bell · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Charles M. Boone · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · R. S. Bray, Pvt. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Professor George W. Crane · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Mrs. Glenn Thompson Cummings · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Richard P. Israel · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Violet Olive Johnson · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · F. L. K. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · R. M. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · James P. Marshall · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · George F. Morgan · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · S. A. N. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · J. O. O’C. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · L. William Pitzner · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · A. L. Richard · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Edward Schultz · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Dean Smith · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Victor Wilson · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Harry M. Worth · lt\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (4, 4, 1, 'Weird Tales, June 1923', '2023-03-03T12:35:22', 'https://ia800904.us.archive.org/22/items/Weird_Tales_v01n04_1923-06/__ia_thumb.jpg', 'https://ia600904.us.archive.org/BookReader/BookReaderImages.php?zip=/22/items/Weird_Tales_v01n04_1923-06/weird_tales_1923-06_jp2.zip&file=weird_tales_1923-06_jp2/weird_tales_1923-06_0000.jp2&id=Weird_Tales_v01n04_1923-06&scale=4&rotate=0', 4, 1, 4, 1, '<div id=\"descript\" itemprop=\"description\"><div>Weird Tales magazine, June 1923</div><div>1923-06 v01n04 (Volume 1, Number 4)</div><div><br></div><div>Table of Contents<br></div><div>5 • The Evening Wolves (Part 1 of 2) • serial by Paul Ellsworth Triem<br>18 • Snatched from the Grave, Woman Tells of Death • essay by uncredited<br>19 • Desert Madness • novelette by Harold Freeman Miners<br>31 • Chicago Man Attacked by Fighting Owl • essay by uncredited<br>32 • The Jailer of Souls • novelette by Hamilton Craigie<br>48 • Editor Baffled by Weird Seance • essay by uncredited<br>49 • Jack O\' Mystery • short story by Edwin MacLaren<br>55 • Osiris • short story by Adam Hull Shirk<br>56 • Failure to Keep Tab on Quitting Time Kills Two • essay by uncredited<br>57 • The Well • short story by Julian Kilman<br>60 • The Phantom Wolfhound • [Dr. Dorp • 1] • short story by Otis Adelbert Kline<br>64 • The Murders in the Rue Morgue • [Chevalier Dupin] • (1841) • novelette by Edgar Allan Poe<br>71 • Kilted Wraith and Bagpipe Spook Communicate with Spiritualists • essay by uncredited<br>72 • The Moon Terror (Part 2 of 2) • serial by A. G. Birch<br>81 • The Man the Law Forgot • short story by Walter Noble Burns<br>86 • The Blade of Vengeance • short story by George Warburton Lewis<br>90 • Air Transportation Between Chicago and New York to Be Established • essay by uncredited<br>91 • The Gray Death • short story by Loual B. Sugarman<br>94 • Savants No Longer Know All Things • essay by uncredited<br>94 • Ancient Legend Recalled When Misfortune Attends Tut\'s Discoverers • essay by uncredited<br>95 • The Voice in the Fog • short story by Henry Leverage<br>100 • The Invisible Terror • short story by Hugh Thomason<br>103 • The Escape • short story by Helen Rowe Henze<br>105 • The Siren • short story by Tarleton Collier<br>106 • Men, Lost at Sea, Live Through Week of Horror • essay by uncredited<br>107 • The Madman • short story by Herbert Hipwell<br>108 • Arrest Woman Accused of Witchcraft • essay by uncredited<br>109 • The Chair • short story by Dr. Harry E. Mereness<br>110 • Rare Music Disappears Mysteriously • essay by uncredited<br>111 • The Cauldron • [The Cauldron] • essay by Preston Langley Hickey<br>111 • &ensp;Letters<br>116 • Seek Solution to Sahara Desert Mystery • essay by uncredited<br>118 • Men Sing Hymn as They Go to Death • essay by uncredited <br></div>\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (5, 5, 1, 'Weird Tales, July, August 1923', '2023-03-03T12:35:22', 'https://ia800907.us.archive.org/8/items/WeirdTalesV02N0119230708/__ia_thumb.jpg', 'https://ia803006.us.archive.org/BookReader/BookReaderImages.php?zip=/6/items/WeirdTales_v02n01_1923-07-08/weird_tales_1923-07-08_jp2.zip&file=weird_tales_1923-07-08_jp2/weird_tales_1923-07-08_0000.jp2&id=WeirdTales_v02n01_1923-07-08&scale=4&rotate=0', NULL, 2, 1, 1, '<div id=\"descript\" itemprop=\"description\"><div>Weird Tales, July-August 1923</div><div>volume 2 number 1</div><div><br></div><div>Table of Contents</div><div>2 • Sunfire (Part 1 of 2) • serial by Francis Stevens<br>14 • The Outcasts • short story by George Warburton Lewis<br>18 • The Room of the Black Velvet Drapes • short story by B. W. Sliney<br>21 • Doctor X • short story by Culpeper Chunn<br>22 • British-American Exploring Party Discovers Ancient Temple of Moon God • essay by uncredited<br>23 • The Two Men Who Murdered Each Other • novelette by Valma Clark<br>32 • A Weird Prophetic Dream and Its Gruesome Fulfillment • essay by uncredited<br>32 • Savages Burn Man Alive to Appease \"Goddess\" • essay by uncredited<br>33 • The Strange Case of Jacob Arum • novelette by Harris Burland [as by John Harris Burland]<br>46 • Black Cunjer • short story by Isabel Walker<br>48 • American Has 1,500,000 Dope Fiends • essay by uncredited<br>48 • Monte Carlo Casino Yields Huge Annual Profit • essay by uncredited<br>48 • Girl Afflicted with Strange Malady • essay by uncredited<br>48 • The Red Moon • poem by Clark Ashton Smith<br>48 • Woman Weds Twins; Can\'t Tell Them Apart • essay by uncredited<br>48 • Caterpillar Army Halts Train • essay by uncredited<br>48 • Man Is Tried for Thirty-Three Murders • essay by uncredited<br>48 • Author Sues \"Egyptian Spook\" • essay by uncredited<br>49 • Shades • short story by Bryan Irvine<br>54 • Lecturer Derides Material Theories of Evolution • essay by uncredited<br>55 • Voodooism • essay by Will W. Nelson<br>57 • Senorita Serpente • short story by Earl Wayland Bowman<br>61 • The Room in the Tower • short story by D. L. Radway<br>63 • Riders in the Dark • short story by Vincent Starrett<br>65 • Will Tombs of Old Mexico Outrival King Tut\'s? • essay by uncredited<br>66 • Mandrake • short story by Adam Hull Shirk<br>68 • The Garden of Evil • poem by Clark Ashton Smith<br>68 • Deed 2,230 Years Old Unearthed • essay by uncredited<br>69 • People vs. Bland • short story by Theodore Snow Wood<br>73 • The Evening Wolves (Part 2 of 2) • serial by Paul Ellsworth Triem<br>76 • The Corpse on the Third Slab • short story by Otis Adelbert Kline<br>79 • The Guard of Honor • short story by J. Paul Suter [as by Paul Suter]<br>85 • The Cauldron • [The Cauldron] • essay by Preston Langley Hickey<br>85 • The Lesson in Anatomy • essay by John R. Palmer<br>85 • The Black Nun • essay by H. F. K.<br>86 • The Phantom Train • essay by Charles White<br>86 • A Strange Manifestation • essay by Matt. Byrne Ap\'rhys, C.E.<br>87 • The Eyrie • [The Eyrie] • essay by The Editor<br>87-91 •&ensp;Letters<br>91 • Woman and Girl Fight Bloody Duel • essay by uncredited<br>91 • Spirit Objects to Holding Hands • essay by uncredited<br>96 • Death Held No Terror fro Bernhardt • essay by uncredited<br></div>\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (6, 6, 1, 'Weird Tales, September 1923', '2023-03-03T12:35:22', 'https://ia600903.us.archive.org/12/items/Weird_Tales_v02n02_1923-09/__ia_thumb.jpg', 'https://ia600903.us.archive.org/BookReader/BookReaderImages.php?zip=/12/items/Weird_Tales_v02n02_1923-09/weird_tales_1923-09_jp2.zip&file=weird_tales_1923-09_jp2/weird_tales_1923-09_0000.jp2&id=Weird_Tales_v02n02_1923-09&scale=4&rotate=0', NULL, 2, 2, 1, '<div id=\"descript\" itemprop=\"description\"><div>Weird Tales, September 1923</div><div>volume 2, number 2 v02n03 1923-09</div><div><br></div><div>Table of Contents<br></div><div>3 • The People of the Comet (Part 1 of 2) • serial by Austin Hall<br>17 • The Black Patch • short story by Julian Kilman<br>19 • The Soul of Peter Andrus • short story by Hubert La Due<br>23 • The Case of Dr. Johnstone • short story by Burton Peter Thom<br>26 • The Dead-Naming of Lukapehu • short fiction by P. D. Gog<br>27 • The Cup of Blood • short story by Otis Adelbert Kline<br>33 • Black Magic • essay by Eliphas Levi (trans. of Black Magic 1860) [as by Alphonse Louis Constant]<br>35 • The Devil\'s Cabin • short story by Vance Hoyt<br>35 • After Reading \"The Devil\'s Cabin\" • essay by Rupert Hughes<br>39 • The Old Burying Ground • novelette by Edgar Lloyd Hampton<br>47 • Sisters Prefer Death to Charity • essay by uncredited<br>47 • Female Buddha Slain • essay by uncredited<br>48 • Sunfire (Part 2 of 2) • serial by Francis Stevens<br>59 • The Gorilla • short story by Horatio Vernon Ellis<br>62 • The Talisman • short story by Nadia Lavrova<br>64 • The Autobiography of a Blue Ghost • short story by Don Mark Lemon<br>70 • The Damned Thing • (1893) • short story by Ambrose Bierce<br>72 • Rare Animals Discovered on Dipsomania Isle • essay by uncredited<br>73 • The Teak-Wood Shrine • short story by Farnsworth Wright<br>75 • The Money Lender • short story by Vincent Starrett<br>77 • The Bloodstained Parasol • short story by James Ravenscroft<br>79 • The Eyrie (Weird Tales, September 1923) • [The Eyrie] • essay by The Editor<br>79 • &ensp;Letter (Weird Tales, September 1923) • essay by Zahrah E. Preble<br>79 • &ensp;Letter (Weird Tales, September 1923) • essay by F. A. Ells-Over<br>80 • &ensp;Letter (Weird Tales, September 1923) • essay by Curtis F. Day<br>80 • &ensp;Letter (Weird Tales, September 1923) • essay by Catherine H. Griggs<br>80 • &ensp;Letter (Weird Tales, September 1923) • essay by Paul Ellsworth Triem<br>80 • &ensp;Letter (Weird Tales, September 1923) • essay by H. P. Lovecraft<br>82 • &ensp;Letter (Weird Tales, September 1923) • essay by Just Another Weird One<br>82 • &ensp;Letter (Weird Tales, September 1923) • essay by Charles White<br>82 • &ensp;Letter (Weird Tales, September 1923) • essay by Maxine Worthington<br>82 • &ensp;Letter (Weird Tales, September 1923) • essay by Paul Bratton<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by Richard Tooker [as by Dick P. Tooker]<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by Mrs. E. L. Depew<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by John James Arthur, Jr.<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by William Moesel<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by V. Van Blascom Parke<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by C. D. Bradley<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by R. Linwood Lancaster<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by H. Cusick<br>84 • &ensp;Letter (Weird Tales, September 1923) • essay by V. H. Bethell<br>86 • The Cauldron (Weird Tales, September 1923) • [The Cauldron (Weird Tales)] • essay by Preston Langley Hickey<br>86 • &ensp;Letter (Weird Tales, September 1923): Pat McClosky\'s Ghost • essay by J. P. Cronister<br>86 • &ensp;Letter (Weird Tales, September 1923): The Velvet Death • essay by Henry Trefon<br>87 • Arthur Armstrong\'s Predicament • essay by D. G. Prescott, Jr.<br></div>\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (7, 7, 1, 'Weird Tales, October 1923', '2023-03-03T12:35:22', 'https://ia800909.us.archive.org/22/items/Weird_Tales_v02n03_1923-10/__ia_thumb.jpg', 'https://ia800909.us.archive.org/BookReader/BookReaderImages.php?zip=/22/items/Weird_Tales_v02n03_1923-10/weird_tales_1923-10_jp2.zip&file=weird_tales_1923-10_jp2/weird_tales_1923-10_0000.jp2&id=Weird_Tales_v02n03_1923-10&scale=4&rotate=0', NULL, 2, 3, 1, '<div id=\"descript\" itemprop=\"description\"><div>Weird Tales, October 1923</div><div>volume 2, number 3 v02n03 1923-10<br></div><div><br></div><div>Table of Contents<br></div><div>3 • The Amazing Adventure of Joe Scranton (Part 1 of 2) • serial by Effie W. Fifield<br>14 • Aged Man Kills Wife, Self and \"Other Woman\" • essay by uncredited<br>14 • World Ice to Wipe Out Continents • essay by uncredited<br>15 • The Phantom Farmhouse • novelette by Seabury Quinn<br>22 • Sight Without Eyes • essay by uncredited<br>22 • Genoese Riviera Damaged by Waterspout • essay by uncredited<br>23 • Dagon • (1919) • short story by H. P. Lovecraft<br>25 • The Man Who Owned the World • short story by Frank Owen<br>27 • Grey Sleep • short story by Charles Horn<br>32 • The People of the Comet (Part 2 of 2) • serial by Austin Hall<br>38 • The Sign from Heaven • short story by A. Havdal<br>39 • The Inn of Dread • short story by Arthur Edwards Chapman<br>42 • The Hairy Monster • short story by Neil C. Miller [as by Neil Miller]<br>47 • Devil Manor • novelette by E. B. Jordan<br>60 • The Case of the Golden Lilly • [Paul Pry] • short story by Francis D. Grierson<br>63 • Bluebeard • [Weird Crimes • 1] • essay by Seabury Quinn<br>68 • Weird Snake Dance of Hopis May Be Tabooed • essay by uncredited<br>69 • An Adventure in the Fourth Dimension • novelette by Farnsworth Wright<br>71 • The Pit and the Pendulum • (1842) • short story by Edgar Allan Poe<br>74 • After the Storm • short story by Sarah Harbine Weaver<br>78 • The Cauldron • [The Cauldron] • essay by Preston Langley Hickey<br>78 • &ensp;Letter (Weird Tales, October 1923): After I Was Dead • essay by John W. Walton<br>78 • &ensp;Letter (Weird Tales, October 1923): Mysterious Radio • essay by Maxwell Levey<br>80 • The Eyrie (Weird Tales, October 1923) • [The Eyrie] • essay by The Editor<br>80 • &ensp;Letter (Weird Tales, October 1923) • essay by An Old Fashioned Woman<br>80 • &ensp;Letter (Weird Tales, October 1923) • essay by J. L.<br>80 • &ensp;Letter (Weird Tales, October 1923) • essay by Richard Tooker [as by Dick P. Tooker]<br>81 • &ensp;Letter (Weird Tales, October 1923) • essay by Joel Shoemaker<br>81 • &ensp;Letter (Weird Tales, October 1923) • essay by Lee Torpie<br>81 • &ensp;Letter (Weird Tales, October 1923) • essay by Dr. Henry C. Murphy<br>82 • &ensp;Letter (Weird Tales, October 1923) • essay by H. P. Lovecraft <br></div>\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (8, 8, 1, 'Weird Tales, November 1923', '2023-03-03T12:35:22', 'https://ia600902.us.archive.org/26/items/Weird_Tales_v02n04_1923-11/__ia_thumb.jpg', 'https://ia600906.us.archive.org/BookReader/BookReaderImages.php?zip=/18/items/WeirdTalesV02N04192311/Weird%20Tales%20v02%20n04%20%281923-11%29_jp2.zip&file=Weird%20Tales%20v02%20n04%20%281923-11%29_jp2/Weird%20Tales%20v02%20n04%20%281923-11%29_0000.jp2&id=WeirdTalesV02N04192311&scale=4&rotate=0', NULL, 2, 4, 1, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><div><i><b>Weird Tales</b></i> [v2 #4, November 1923] (25¢, 96pp+, large)</div>3 · Draconda [Part 1 of 6] · John Martin Leahy · n.<br>18 · The Crawling Death · P. A. Connolly · nv; revised from “Crawling Hands”, <i>The Thrill Book</i> May 15 &amp; June 1 1919.<br>27 · The Closed Room · Maebelle McCalment · ss<br>32 · The Phantom Violinist · Walter F. McCanless · ss<br>36 · Lucifer · John D. Swain · ss<br>39 · The Spider · Arthur Edwards Chapman · ss<br>41 · The Amazing Adventure Of Joe Scranton [Part 2 of 2] · Effie W. Fifield · nv<br>46 · The Iron Room [Paul Pry] · Francis D. Grierson · ss<br>51 · Prisoners Of The Dead · J. Paul Suter · ss<br>57 · The Death Pit · Oscar Schisgall · nv<br>67 · The Wax Image · Burton Harcourt · ss<br>69 · Poisoned · Farnsworth Wright · ss<br>73 · The Magic Mirror · Mary S. Brown · ss<br>75 · The Invisible Monster · Sonia H. Greene (with H. P. Lovecraft) · ss<br>77 · The Pebble Prophecy · Valens Lapsley · ss<br>80 · The Tell-Tale Heart · Edgar Allan Poe · ss <i>The Pioneer</i> January 1843<br>81 · Weird Crimes #2. The Grave Robbers · Seabury Quinn · ar<br>94 · The Survivor · Edwin G. Wood · vi<br>[letter] · K. Lee Andrews · lt<br>[letter] · E. B. · lt<br>[letter] · Mrs. Thomas Earl Davison · lt<br>[letter] · Cecil John Eustace · lt<br>[letter] · Joseph Faus · lt<br>[letter] · Ralph Fingle · lt<br>[letter] · Austin Hall · lt<br>[letter] · Ralph S. Happel · lt<br>[letter] · Thomas J. Harris · lt<br>[letter] · Sidney E. Johnson · lt<br>[letter] · Charles G. Kidney · lt<br>[letter] · Godfrey Lampert · lt<br>[letter] · Mrs. D. M. Manzer · lt<br>[letter] · Walter F. McCanless · lt<br>[letter] · Homer O. Peterson · lt<br>[letter] · Mrs. Elizabeth Purington · lt<br>[letter] · Edith Lyle Ragsdale · lt<br>[letter] · Gertrude Strauss · lt<br>[letter] · Mrs. F. Wickman · lt\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (9, 9, 1, 'Weird Tales, January 1924', '2023-03-03T12:35:22', 'https://ia803005.us.archive.org/9/items/WeirdTalesV03N01192401/__ia_thumb.jpg', 'https://ia803005.us.archive.org/BookReader/BookReaderImages.php?zip=/9/items/WeirdTalesV03N01192401/Weird%20Tales%20v03%20n01%20%281924-01%29_jp2.zip&file=Weird%20Tales%20v03%20n01%20%281924-01%29_jp2/Weird%20Tales%20v03%20n01%20%281924-01%29_0000.jp2&id=WeirdTalesV03N01192401&scale=4&rotate=0', NULL, 3, 1, 1, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><div><b><i>Weird Tales</i></b> [v3 #1, December 1923/January 1924] (25¢, 96pp+, large, cover by Mally)</div>3 · The Abysmal Horror [Part 1 of 2] · B. Wallis · na<br>13 · Black Sorcery · Paul Annixter · nv<br>21 · The Hand Of Fatma · Harry Anable Kniffin · ss<br>25 · The Man Who Banished Himself · Ferdinand Berthoud · ss<br>28 · Hops · Preston Langley Hickey · pm<br>29 · A Game Of Chance · Henry Lieferant &amp; Sylvia B. Saltzberg · ss<br>32 · Solution · Clark Ashton Smith · pm <b>Ebony And Crystal</b>, Auburn Journal 1922<br>33 · The Open Window [John Steppling] · Frank Owen · ss<br>36 · The Cataleptic · Charles Layng · pm<br>37 · The Cat Called Carlos · Hal Field Leslie · ss<br>40 · The Picture In The House · H. P. Lovecraft · ss <i>The National Amateur</i>, July 1919<br>43 · Draconda [Part 2 of 6] · John Martin Leahy · n.<br>56 · The Hook Of Death · Mrs. Harry Pugh Smith · nv<br>64 · The Monstrosity · George W. Crane · ss<br>69 · The Cobra Lily · Ledyard M. Bailey · nv<br>78 · Weird Crimes #3. The Magic Mirror Murders · Seabury Quinn · ar<br>83 · The Black Cat · Edgar Allan Poe · ss <i>United States Saturday Post And Chronicle</i>, August 19, 1843<br>94 · Snake · Galen C. Colin · vi<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · P. J. Campbell · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · R. B. D. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Joseph Faus · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Effie W. Fifield · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Walter Thomas Lee, Jr. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · H. P. Lovecraft · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · James F. Morton, Jr. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · D. E. N. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Fred T. Norris · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · G. Peyton Wertenbaker · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Henry S. Whitehead, Rev. · lt<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [letter] · Clement Wood · lt\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (10, 10, 1, 'Weird Tales, February 1924', '2023-03-03T12:35:22', 'https://ia903008.us.archive.org/35/items/WeirdTalesV03N02192402/__ia_thumb.jpg', 'https://ia803008.us.archive.org/BookReader/BookReaderImages.php?zip=/35/items/WeirdTalesV03N02192402/Weird%20Tales%20v03%20n02%20%281924-02%29_jp2.zip&file=Weird%20Tales%20v03%20n02%20%281924-02%29_jp2/Weird%20Tales%20v03%20n02%20%281924-02%29_0000.jp2&id=WeirdTalesV03N02192402&scale=2&rotate=0', NULL, 3, 2, 1, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><div><b><i>Weird Tales</i></b> [v3 #2, February 1924] (25¢, 96pp+, large, cover by Mally)</div>3 · Planet Paradise · Dick Presley Tooker · nv<br>14 · The Tap · Arthur Edwards Chapman · ss<br>17 · The Thing That Should Not Be · Burton Peter Thom · ss<br>20 · The Ghost · Mary Sharon · pm<br>21 · The Guilty Man · Marion Carrere · ss<br>23 · The Transparent Ghost [Part 1 of 3] · Isa-Belle Manzer · ss<br>25 · Coils Of Darkness [Part 1 of 3] · Sybla Ramus · na<br>33 · Carved In The Flesh · Tom Rawson Hilbourn · ss<br>35 · The Hall Bedroom · W. Elwyn Backus · ss<br>41 · The Door Of Doom · Mary Sharon · ss<br>43 · The Abysmal Horror [Part 2 of 2] · B. Wallis · na<br>50 · The Hound [Cthulhu] · H. P. Lovecraft · ss<br>53 · Draconda [Part 3 of 6] · John Martin Leahy · n.<br>66 · The Ghost Of Silent Smith · C. Franklin Miller · ss<br>71 · Doctor DeBruce · Earl Leaston Bell · ss<br>75 · The Hater · B. W. Wilson · ss<br>76 · Weird Crimes #4. Swiatek, The Beggar · Seabury Quinn · ar<br><div>91 · The Killer · Harold Ward · vi</div><div>[letter] · M. Gladden Abernathy · lt</div>[letter from Medford, Oregon] · Anon. · lt<br>[letter] · Charles M. Boone · lt<br>[letter] · Whitmore Anderson Gaydon · lt<br>[letter] · Jeremiah Joykiller · lt<br>[letter] · Herbert J. Lalonde · lt<br>[letter] · Walter Thomas Lee, Jr. · lt<br>[letter] · Walter F. McCanless · lt<br>[letter] · F. C. McKnight · lt<br>[letter] · Richard Presley Tooker · lt\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (11, 11, 1, 'Weird Tales, March 1924', '2023-03-03T12:35:22', 'https://ia903006.us.archive.org/0/items/WeirdTalesV03n03192403/__ia_thumb.jpg', 'https://ia803006.us.archive.org/BookReader/BookReaderImages.php?zip=/0/items/WeirdTalesV03n03192403/Weird%20Tales%20v03n03%20%281924-03%29_jp2.zip&file=Weird%20Tales%20v03n03%20%281924-03%29_jp2/Weird%20Tales%20v03n03%20%281924-03%29_0000.jp2&id=WeirdTalesV03n03192403&scale=8&rotate=0', NULL, 3, 3, 1, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><div><b><i>Weird Tales</i></b> [v3 #3, March 1924] (25¢, 96pp+, large, cover by Mally)</div>3 · The Spirit Fakers Of Hermannstadt [Part 1 of 2] · Houdini · nv<br>7 · The Hermit Of Ghost Mountain · C. Franklin Miller · ss<br>11 · Justice In The Foothills · Clement White · ss<br>13 · Zillah · Valma Clark · ss<br><div>18 · Hunger · Leonard Fohn · pm</div><div>19 · The Fine Art Of Suicide · Howard Rockey · ss</div>21 · The Melancholy Pool · Clark Ashton Smith · pm <b>Ebony And Crystal</b>, Auburn Journal 1922<br>21 · The Crystal Globe · Preston Langley Hickey · pm<br>22 · Ashes · C. M. Eddy, Jr. (with H. P. Lovecraft) · ss<br>25 · The Rats In The Walls · H. P. Lovecraft · ss<br>32 · The Voice Of Euphemia · Eudora Ramsay Richardson · ss<br>36 · Yellow And White · George Fuller · ss<br>40 · The Visit Of The Skulls · Leonard Fohn · pm<br>41 · Coils Of Darkness [Part 2 of 3] · Sybla Ramus · na<br>51 · The Toad · Donovan G. Fitzpatrick · ss<br>54 · The Statement of Archibald Swayne · Burton Peter Thom · ss<br>57 · The Transparent Ghost [Part 2 of 3] · Isa-Belle Manzer · ss<br>59 · Draconda [Part 4 of 6] · John Martin Leahy · n.<br>73 · Creatures Of The Night · A. P. McMahon · ss<br>75 · The House In The Forest · Harold Ward · ss<br>78 · Never Bet The Devil Your Head · Edgar Allan Poe · ss <i>Graham’s Lady’s And Gentleman’s Magazine</i> September 1841, as “Never Bet Your Head”<br>[letter] · Mrs. Claud Amoe · lt<br>[letter] · Richard James Credicott · lt<br>[letter] · Gordon Dewey · lt<br>[letter] · H. P. Lovecraft · lt<br>[letter] · Walter F. McCanless · lt<br>[letter] · James F. Morton, Jr. · lt<br>[letter] · Henry C. Murphy, Dr. · lt<br>[letter] · Robert C. Old · lt<br>[letter] · Edna Bell Seward · lt\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (12, 12, 1, 'Weird Tales, April 1924', '2023-03-03T12:35:22', 'https://ia903009.us.archive.org/26/items/WeirdTalesV03n04192404/__ia_thumb.jpg', 'https://ia903009.us.archive.org/BookReader/BookReaderImages.php?zip=/26/items/WeirdTalesV03n04192404/Weird%20Tales%20v03n04%20%281924-04%29_jp2.zip&file=Weird%20Tales%20v03n04%20%281924-04%29_jp2/Weird%20Tales%20v03n04%20%281924-04%29_0000.jp2&id=WeirdTalesV03n04192404&scale=2&rotate=0', NULL, 3, 4, 1, '<div id=\"descript\" itemprop=\"description\"><div>CONTENTS:</div><div><b><i>Weird Tales</i></b> [v3 #4, April 1924] (25¢, 96pp+, large, cover by Mally)<br></div><div>3 · The Hoax Of The Spirit Lover · Houdini · ar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></div><div>6 · Ebenezer’s Casket [Part 1 of 2] · J. U. Giesy &amp; Junius B. Smith · nv</div>15 · White Ape · H. P. Lovecraft · ss <i>The Wolverine</i> March 1921 (+1), as “Facts Concerning The Late Arthur Jermyn And His Family”<br>19 · Down Through The Ages · Rex Hall · ss<br>23 · The Great Adventure · Bryan Irvine · ss<br>30 · Tragedy Island · J. M. Alvey · ss<br>33 · The Brown Mouse · Edward Parrish Ware · ss<br>35 · Exhibit “A” · Anne Harris Hadley · ss<br>38 · The Transparent Ghost [Part 3 of 3] · Isa-Belle Manzer · ss<br>39 · The Devil Bird · Hal Halbert · ss<br>43 · Coils Of Darkness [Part 3 of 3] · Sybla Ramus · na<br>52 · The Spirit Fakers Of Hermannstadt [Part 2 of 2] · Houdini · nv<br>57 · Draconda [Part 5 of 6] · John Martin Leahy · n.<br>68 · Sport For Ladies · Stanley G. Thompson · ss<br>70 · The Man Who Dared To Know · Junius B. Smith · ss<br>72 · The Ghost-Eater · C. M. Eddy, Jr. (with H. P. Lovecraft) · ss<br>76 · The Thing · Frank Marion Palmer · ss<br>78 · Nemesis · H. P. Lovecraft · pm <i>The Vagrant</i> June 1918<br>79 · Shadows · Frank Owen · vi<br>80 · Weird Crimes #5. Mary Blandy · Seabury Quinn · ar <br>\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (13, 13, 1, 'Weird Tales, May, June, July 1924', '2023-03-03T12:35:22', 'https://ia600907.us.archive.org/3/items/WeirdTales1924050607ATLPM/__ia_thumb.jpg', 'https://ia800907.us.archive.org/BookReader/BookReaderImages.php?zip=/3/items/WeirdTales1924050607ATLPM/Weird%20Tales%20-%201924-05-06-07%20%5BAT-LPM%5D_jp2.zip&file=Weird%20Tales%20-%201924-05-06-07%20%5BAT-LPM%5D_jp2/Weird%20Tales%20-%201924-05-06-07%20%5BAT-LPM%5D_0000.jp2&id=WeirdTales1924050607ATLPM&scale=4&rotate=0', NULL, 4, 2, 1, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><b><i>Weird Tales</i></b> [v04n02, (May-June-July) 1924] (50¢, 192pp+, large, cover by Mally) Anniversary Issue.<br>1 · Why Weird Tales? · Anon. (by Otis Adelbert Kline) · ed<br>3 · Imprisoned With The Pharaohs · Houdini (ghost written by H. P. Lovecraft) · nv<br>13 · “Whoso Diggeth A Pit—” · Vida Tyler Adams · ss; given as by Vida Taylor Adams in the Table of Contents.<br>16 · Deep Calleth · Gordon Burns · ss<br>19 · The Malignant Entity · Otis Adelbert Kline · ss<br>27 · The Sixth Tree · Edith Lichty Stewart · ss<br>29 · The Haunted Mansion In The Pines · Leonard F. Schumann · ss<br>32 · Spirits · J. M. Alvey · vi<br>33 · Hypnos · H. P. Lovecraft · ss The National Amateur May/July 1923<br>36 · Ebenezer’s Casket [Part 2 of 2] · J. U. Giesy &amp; Junius B. Smith · nv<br>41 · Draconda [Part 6 of 6] · John Martin Leahy · n.<br>50 · The Hand · H. Francis Caskey · ss<br>54 · The Loved Dead · C. M. Eddy, Jr. (with H. P. Lovecraft) · ss<br>58 · The Vow On Halloween · Lyllian Huntley Harris · vi<br>59 · Eyes · Galen C. Colin · vi<br>61 · The Man Who Thought He Was Dead · Granville S. Hoss · ss<br>65 · Called Back · Dan W. Totheron · ss<br>69 · The Sunken Land · George W. Bayly · ss<br>74 · The Dancing Partner · Guy L. Helms · ss<br>76 · The Last Entry · Meredith Beyers · vi<br>77 · The Purple Death · Edith Lyle Ragsdale · ss<br>82 · The Imposter · Norman Springer · ss<br>87 · Weird Crimes #6. The Werewolf Of St. Bonnot · Seabury Quinn · ar<br>91 · Just Bones · Samuel Stewart Mims · ss<br>96 · First Degree · Robert Cosmo Harding · ss<br>101 · The Latvian · Herman Fetzer · ss<br>106 · The Machine From Outside · Don Howard · ss<br>111 · Doctor Grant’s Experiment · H. A. Noureddin Addis · ss<br>116 · Tea Leaves · Henry S. Whitehead · ss<br>121 · An Egyptian Lotus · Mrs. Chetwood Smith · ss<br><div>127 · Deep Sea Game · Arthur J. Messier · ss</div><div>131 · The Soul Mark · H. C. Wire · ss</div>135 · It! · E. M. Samson · ss<br>139 · The Man Who Lived Next Door To Himself · Frank Owen · ss<br>143 · Mystery River · Elwin J. Owens · ss<br>145 · The God Yuano · Marjorie Darter · vi<br>147 · The Cellar · Paul L. Anderson · ss<br>152 · In The Weird Light · Edward Everett &amp; Ralph Howard Wright · nv<br>164 · A Glimpse Beyond · H. M. Hamilton · ss\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (14, 14, 1, 'Weird Tales, November 1924', '2023-03-03T12:35:22', 'https://ia903009.us.archive.org/34/items/WeirdTalesV04N03192411/__ia_thumb.jpg', 'https://ia803009.us.archive.org/BookReader/BookReaderImages.php?zip=/34/items/WeirdTalesV04N03192411/Weird%20Tales%20v04%20n03%20%281924-11%29_jp2.zip&file=Weird%20Tales%20v04%20n03%20%281924-11%29_jp2/Weird%20Tales%20v04%20n03%20%281924-11%29_0000.jp2&id=WeirdTalesV04N03192411&scale=2&rotate=0', NULL, 4, 3, 2, '<div id=\"descript\" itemprop=\"description\"><div><b>CONTENTS:</b></div><i><b>Weird Tales</b></i> [v4 #3, November 1924] (25¢, 192pp+, pulp, cover by Andrew Brosnatch)<br>5 · Teoquitla The Golden · Ramòn de las Cuevas · nv<br>31 · The Brain In The Jar · Norman Elwood Hammerstrom &amp; R. F. Searight · ss<br>36 · Adventure Of Souls · Robert Lee Heiser · ss<br>46 · Well, I’ll Tell You, Ma · W. McKeown · ss<br>49 · The Desert Lich · Frank Belknap Long, Jr. · ss<br>54 · To A Dreamer · H. P. Lovecraft · pm <i>The Coyote</i> January 1921<br>55 · The Great Panjandrum · Francis Hard · ss<br>65 · The House Of Dust [Part 1 of 2] · L. A. Borah · na<br>88 · Six Bearded Men · Elwin J. Owens · ss<br>93 · The Green And Gold Bug · J. M. Alvey · ss<br>96 · The Tortoise-Shell Cat · Greye La Spina · ss<br>105 · The Phantom Rider · Otis Adelbert Kline · ss<br>111 · A Soulless Resurrection · Anon. · ss<br>116 · A Suicide Complex · Robert Allways · ss<br>121 · The Purple Light · Ralph Parker Anderson · ss<br>128 · Weird Crimes #7. The Human Hyena · Seabury Quinn · ar<br>134 · The Ghost Of Liscard Manor · Walter Burns · ss<br>140 · The Pelican · Charles L. Frederick · ss<br>151 · The Door · Henry S. Whitehead · ss<br>154 · Thus Spake The Prophetess · Estil Critchie · ss<br>158 · The Tower Of Silence · Don Willis · ss<br>163 · John Carroll, Legionary Of Rome · B. Wallis · nv\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (15, 15, 1, 'Weird Tales, December 1924', '2023-03-03T12:35:22', 'https://ia803005.us.archive.org/35/items/WeirdTalesV04N04192412/__ia_thumb.jpg', 'https://ia903005.us.archive.org/BookReader/BookReaderImages.php?zip=/35/items/WeirdTalesV04N04192412/Weird%20Tales%20v04%20n04%20%281924-12%29_jp2.zip&file=Weird%20Tales%20v04%20n04%20%281924-12%29_jp2/Weird%20Tales%20v04%20n04%20%281924-12%29_0000.jp2&id=WeirdTalesV04N04192412&scale=2&rotate=0', NULL, 4, 4, 2, '<div id=\"descript\" itemprop=\"description\"><div><b>NOTE: The scan is missing the inside front cover and inside back cover.</b></div><div><b><br></b></div><div><b>CONTENTS:</b></div><div><b><i>Weird Tales</i></b> [v4 #4, December 1924] (25¢, 192pp+, pulp, cover by Andrew Brosnatch)</div>9 · Death-Waters · Frank Belknap Long, Jr. · ss<br>16 · The Earth Girl · Carroll K. Michener · ss<br>28 · With Weapons Of Stone · C. M. Eddy, Jr. · ss<br>34 · The Death Clinic · Otto E. A. Schmidt · ss<br>47 · Cave Of Murdered Men · W. Benson Dooling · vi<br>49 · Kaivalya · Mrs. Edgar Saltus · ss<br>58 · A Tryst With Death · Edgar White · ss<br>61 · The Valley Of Teeheemen [Part 1 of 2; Teeheemen (Holton)] · Arthur Thatcher · na<br>87 · Black Temple Band · Elwin J. Owens · ss<br>93 · His Family · C. Franklin Miller · ss<br>98 · A Hand From The Deep · Romeo Poole · ss<br>106 · After · Dennis Francis Hannigan · vi<br>108 · Creeping Mist · Thomas B. Sherman · ss<br>116 · The Silent Five · Anthony D. Keogh · ss<br>123 · The Case Of The Russian Stevedore · Henry W. Whitehill · ss<br>128 · Voodoo · Estil Critchie · ss<br>132 · The House Of Dust [Part 2 of 2] · L. A. Borah · na<br>156 · Youth · Howard R. Marsh · ss<br>159 · Fairy Gossamer · Harry Harrison Kroll · ss<br>163 · The Song Eternal · Galen C. Colin · ss<br>170 · The Crimson Crucifix · H. Thompson Rich · ss<br>[letter] · Charles Godfrey Osgood · lt\n</div>');
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (16, NULL, 1, 'Weird Tales, January 1925', '2023-03-03T12:35:22', 'https://ia600800.us.archive.org/26/items/WeirdTalesV05N01192501/__ia_thumb.jpg', NULL, NULL, 5, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (17, NULL, 1, 'Weird Tales, February 1925', '2023-03-03T12:35:22', 'https://ia800902.us.archive.org/21/items/WeirdTalesV05N02192502/__ia_thumb.jpg', NULL, NULL, 5, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (18, NULL, 1, 'Weird Tales, March 1925', '2023-03-03T12:35:22', 'https://ia800901.us.archive.org/21/items/WeirdTalesV05N03192503/__ia_thumb.jpg', NULL, NULL, 5, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (19, NULL, 1, 'Weird Tales, April 1925', '2023-03-03T12:35:22', 'https://ia800901.us.archive.org/15/items/WeirdTalesV05N04192504/__ia_thumb.jpg', NULL, NULL, 5, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (20, NULL, 1, 'Weird Tales, May 1925', '2023-03-03T12:35:22', 'https://ia600903.us.archive.org/8/items/WeirdTalesV05N05192505/__ia_thumb.jpg', NULL, NULL, 5, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (21, NULL, 1, 'Weird Tales, June 1925', '2023-03-03T12:35:22', 'https://ia903002.us.archive.org/12/items/WeirdTalesV05N06192506/__ia_thumb.jpg', NULL, NULL, 5, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (22, NULL, 1, 'Weird Tales, July 1925', '2023-03-03T12:35:22', 'https://ia903008.us.archive.org/34/items/WeirdTalesV06N01192507/__ia_thumb.jpg', NULL, NULL, 6, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (23, NULL, 1, 'Weird Tales, August 1925', '2023-03-03T12:35:22', 'https://ia903004.us.archive.org/19/items/WeirdTalesV06N02192508/__ia_thumb.jpg', NULL, NULL, 6, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (24, NULL, 1, 'Weird Tales, September 1925', '2023-03-03T12:35:22', 'https://ia903001.us.archive.org/2/items/WeirdTalesV06N03192509/__ia_thumb.jpg', NULL, NULL, 6, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (25, NULL, 1, 'Weird Tales, October 1925', '2023-03-03T12:35:22', 'https://ia600907.us.archive.org/16/items/WeirdTalesV06N04192510/__ia_thumb.jpg', NULL, NULL, 6, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (26, NULL, 1, 'Weird Tales, November 1925', '2023-03-03T12:35:22', 'https://ia803106.us.archive.org/21/items/WeirdTalesV06N05192511/__ia_thumb.jpg', NULL, NULL, 6, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (27, NULL, 1, 'Weird Tales, December 1925', '2023-03-03T12:35:22', 'https://ia800904.us.archive.org/13/items/WeirdTalesV06N06192512/__ia_thumb.jpg', NULL, NULL, 6, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (28, NULL, 1, 'Weird Tales, January 1926', '2023-03-03T12:35:22', 'https://ia802800.us.archive.org/31/items/WeirdTalesV07N01192601/__ia_thumb.jpg', NULL, NULL, 7, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (29, NULL, 1, 'Weird Tales, February 1926', '2023-03-03T12:35:22', 'https://ia802901.us.archive.org/5/items/WeirdTalesV07N02192602/__ia_thumb.jpg', NULL, NULL, 7, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (30, NULL, 1, 'Weird Tales, March 1926', '2023-03-03T12:35:22', 'https://ia800909.us.archive.org/12/items/WeirdTalesV07N03192603/__ia_thumb.jpg', NULL, NULL, 7, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (31, NULL, 1, 'Weird Tales, April 1926', '2023-03-03T12:35:22', 'https://ia800909.us.archive.org/9/items/WeirdTalesV07N04192604/__ia_thumb.jpg', NULL, NULL, 7, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (32, NULL, 1, 'Weird Tales, May 1926', '2023-03-03T12:35:22', 'https://ia803100.us.archive.org/4/items/WeirdTalesV07N05192605/__ia_thumb.jpg', NULL, NULL, 7, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (33, NULL, 1, 'Weird Tales, June 1926', '2023-03-03T12:35:22', 'https://ia801006.us.archive.org/5/items/WeirdTalesV07N06192606/__ia_thumb.jpg', NULL, NULL, 7, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (34, NULL, 1, 'Weird Tales, July 1926', '2023-03-03T12:35:22', 'https://ia800904.us.archive.org/4/items/WeirdTalesV08N01192607/__ia_thumb.jpg', NULL, NULL, 8, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (35, NULL, 1, 'Weird Tales, August 1926', '2023-03-03T12:35:22', 'https://ia903102.us.archive.org/5/items/WeirdTalesV08N02192608/__ia_thumb.jpg', NULL, NULL, 8, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (36, NULL, 1, 'Weird Tales, September 1926', '2023-03-03T12:35:22', 'https://ia800904.us.archive.org/23/items/WeirdTalesV08N03192609/__ia_thumb.jpg', NULL, NULL, 8, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (37, NULL, 1, 'Weird Tales, October 1926', '2023-03-03T12:35:22', 'https://ia903006.us.archive.org/5/items/WeirdTalesV08N04192610/__ia_thumb.jpg', NULL, NULL, 8, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (38, NULL, 1, 'Weird Tales, November 1926', '2023-03-03T12:35:22', 'https://ia800902.us.archive.org/21/items/WeirdTalesV08N05192611/__ia_thumb.jpg', NULL, NULL, 8, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (39, NULL, 1, 'Weird Tales, December 1926', '2023-03-03T12:35:22', 'https://ia600902.us.archive.org/20/items/WeirdTalesV08N06192612/__ia_thumb.jpg', NULL, NULL, 8, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (40, NULL, 1, 'Weird Tales, January 1927', '2023-03-03T12:35:22', 'https://ia903102.us.archive.org/20/items/WeirdTalesV09N01192701/__ia_thumb.jpg', NULL, NULL, 9, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (41, NULL, 1, 'Weird Tales, February 1927', '2023-03-03T12:35:22', 'https://ia801301.us.archive.org/21/items/Weird_Tales_v09n02_1927-02/__ia_thumb.jpg', NULL, NULL, 9, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (42, NULL, 1, 'Weird Tales, March 1927', '2023-03-03T12:35:22', 'https://ia802805.us.archive.org/32/items/WeirdTalesV09N03192703/__ia_thumb.jpg', NULL, NULL, 9, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (43, NULL, 1, 'Weird Tales, April 1927', '2023-03-03T12:35:22', 'https://ia802804.us.archive.org/16/items/WeirdTalesV09N04192704/__ia_thumb.jpg', NULL, NULL, 9, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (44, NULL, 1, 'Weird Tales, May 1927', '2023-03-03T12:35:22', 'https://ia803105.us.archive.org/12/items/WeirdTalesV09N05192705/__ia_thumb.jpg', NULL, NULL, 9, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (45, NULL, 1, 'Weird Tales, June 1927', '2023-03-03T12:35:22', 'https://ia902808.us.archive.org/19/items/WeirdTalesV09N06192706/__ia_thumb.jpg', NULL, NULL, 9, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (46, NULL, 1, 'Weird Tales, July 1927', '2023-03-03T12:35:22', 'https://ia801500.us.archive.org/2/items/Weird_Tales_v10n01_1927-07_sas/__ia_thumb.jpg', NULL, NULL, 10, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (47, NULL, 1, 'Weird Tales, August 1927', '2023-03-03T12:35:22', 'https://ia903108.us.archive.org/23/items/WeirdTalesV10N02192708/__ia_thumb.jpg', NULL, NULL, 10, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (48, NULL, 1, 'Weird Tales, September 1927', '2023-03-03T12:35:22', 'https://ia600103.us.archive.org/31/items/WeirdTalesV10N03192709/__ia_thumb.jpg', NULL, NULL, 10, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (49, NULL, 1, 'Weird Tales, October 1927', '2023-03-03T12:35:22', 'https://ia600104.us.archive.org/3/items/WeirdTalesV10N04192710/__ia_thumb.jpg', NULL, NULL, 10, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (50, NULL, 1, 'Weird Tales, November 1927', '2023-03-03T12:35:22', 'https://ia802808.us.archive.org/35/items/WeirdTalesV10N05192711/__ia_thumb.jpg', NULL, NULL, 10, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (51, NULL, 1, 'Weird Tales, December 1927', '2023-03-03T12:35:22', 'https://ia802804.us.archive.org/0/items/WeirdTalesV10N06192712/__ia_thumb.jpg', NULL, NULL, 10, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (52, NULL, 1, 'Weird Tales, January 1928', '2023-03-03T12:35:22', 'https://ia903008.us.archive.org/10/items/WeirdTalesV11N01192801sasIfcIbc/__ia_thumb.jpg', NULL, NULL, 11, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (53, NULL, 1, 'Weird Tales, February 1928', '2023-03-03T12:35:22', 'https://ia903005.us.archive.org/24/items/WeirdTalesV11N02192802/__ia_thumb.jpg', NULL, NULL, 11, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (54, NULL, 1, 'Weird Tales, March 1928', '2023-03-03T12:35:22', 'https://ia600108.us.archive.org/11/items/WeirdTalesV11N03192803/__ia_thumb.jpg', NULL, NULL, 11, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (55, NULL, 1, 'Weird Tales, April 1928', '2023-03-03T12:35:22', 'https://ia800908.us.archive.org/27/items/WeirdTalesV11N04192804sasIfcIbc/__ia_thumb.jpg', NULL, NULL, 11, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (56, NULL, 1, 'Weird Tales, May 1928', '2023-03-03T12:35:22', 'https://ia600109.us.archive.org/28/items/WeirdTalesV11N05192805/__ia_thumb.jpg', NULL, NULL, 11, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (57, NULL, 1, 'Weird Tales, June 1928', '2023-03-03T12:35:22', 'https://ia803209.us.archive.org/23/items/WeirdTalesV11N06192806/__ia_thumb.jpg', NULL, NULL, 11, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (58, NULL, 1, 'Weird Tales, July 1928', '2023-03-03T12:35:22', 'https://ia800106.us.archive.org/6/items/WeirdTalesV12N01192807/__ia_thumb.jpg', NULL, NULL, 12, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (59, NULL, 1, 'Weird Tales, August 1928', '2023-03-03T12:35:22', 'https://ia903002.us.archive.org/22/items/WeirdTalesV12N02192808sasIfcIbc/__ia_thumb.jpg', NULL, NULL, 12, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (60, NULL, 1, 'Weird Tales, September 1928', '2023-03-03T12:35:22', 'https://ia800203.us.archive.org/25/items/Weird_Tales_v12n03_1928-09/__ia_thumb.jpg', NULL, NULL, 12, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (61, NULL, 1, 'Weird Tales, October 1928', '2023-03-03T12:35:22', 'https://ia803105.us.archive.org/26/items/WeirdTalesV12N04192810/__ia_thumb.jpg', NULL, NULL, 12, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (62, NULL, 1, 'Weird Tales, November 1928', '2023-03-03T12:35:22', 'https://ia800109.us.archive.org/28/items/WeirdTalesV11N05192805/__ia_thumb.jpg', NULL, NULL, 12, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (63, NULL, 1, 'Weird Tales, December 1928', '2023-03-03T12:35:22', 'https://ia801304.us.archive.org/31/items/Weird_Tales_v12n06_1928-12/__ia_thumb.jpg', NULL, NULL, 12, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (64, NULL, 1, 'Weird Tales, January 1929', '2023-03-03T12:35:22', 'https://ia903006.us.archive.org/1/items/WeirdTalesV13N01192901sasIbc/__ia_thumb.jpg', NULL, NULL, 13, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (65, NULL, 1, 'Weird Tales, February 1929', '2023-03-03T12:35:22', 'https://ia801401.us.archive.org/23/items/Weird_Tales_v13n02_1929-02_AT-sas/__ia_thumb.jpg', NULL, NULL, 13, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (66, NULL, 1, 'Weird Tales, March 1929', '2023-03-03T12:35:22', 'https://ia601508.us.archive.org/32/items/Weird_Tales_v13n03_1929-03_sas/__ia_thumb.jpg', NULL, NULL, 13, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (67, NULL, 1, 'Weird Tales, April 1929', '2023-03-03T12:35:22', 'https://ia800203.us.archive.org/24/items/Weird_Tales_v13n04_1929-04/__ia_thumb.jpg', NULL, NULL, 13, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (68, NULL, 1, 'Weird Tales, May 1929', '2023-03-03T12:35:22', 'https://ia800109.us.archive.org/25/items/WeirdTalesV13N05192905/__ia_thumb.jpg', NULL, NULL, 13, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (69, NULL, 1, 'Weird Tales, June 1929', '2023-03-03T12:35:22', 'https://ia801504.us.archive.org/25/items/Weird_Tales_v13n06_1929-06_AT-sas/__ia_thumb.jpg', NULL, NULL, 13, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (70, NULL, 1, 'Weird Tales, July 1929', '2023-03-03T12:35:22', 'https://ia601501.us.archive.org/29/items/Weird_Tales_v14n01_1929-07_sas/__ia_thumb.jpg', NULL, NULL, 14, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (71, NULL, 1, 'Weird Tales, August 1929', '2023-03-03T12:35:22', 'https://ia801504.us.archive.org/5/items/Weird_Tales_v14n02_1929-08_sas/__ia_thumb.jpg', NULL, NULL, 14, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (72, NULL, 1, 'Weird Tales, September 1929', '2023-03-03T12:35:22', 'https://ia601509.us.archive.org/32/items/Weird_Tales_v14n03_1929-09_sas/__ia_thumb.jpg', NULL, NULL, 14, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (73, NULL, 1, 'Weird Tales, October 1929', '2023-03-03T12:35:22', 'https://ia600109.us.archive.org/0/items/WeirdTalesV14N04192910/__ia_thumb.jpg', NULL, NULL, 14, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (74, NULL, 1, 'Weird Tales, November 1929', '2023-03-03T12:35:22', 'https://ia800905.us.archive.org/31/items/WeirdTalesV14N05192911Ifcsas/__ia_thumb.jpg', NULL, NULL, 14, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (75, NULL, 1, 'Weird Tales, December 1929', '2023-03-03T12:35:22', 'https://ia601509.us.archive.org/15/items/Weird_Tales_v14n06_1929-12_sas/__ia_thumb.jpg', NULL, NULL, 14, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (76, NULL, 1, 'Weird Tales, January 1930', '2023-03-03T12:35:22', 'https://ia801500.us.archive.org/13/items/Weird_Tales_v15n01_1930-01_-ibc_LPM-URF-AT-SAS/__ia_thumb.jpg', NULL, NULL, 15, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (77, NULL, 1, 'Weird Tales, February 1930', '2023-03-03T12:35:22', 'https://ia600206.us.archive.org/11/items/Weird_Tales_v15n02_1930-02/__ia_thumb.jpg', NULL, NULL, 15, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (78, NULL, 1, 'Weird Tales, March 1930', '2023-03-03T12:35:22', 'https://ia801400.us.archive.org/21/items/Weird_Tales_v15n03_1930-03_sas/__ia_thumb.jpg', NULL, NULL, 15, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (79, NULL, 1, 'Weird Tales, April 1930', '2023-03-03T12:35:22', 'https://ia803001.us.archive.org/34/items/WeirdTalesV15N04193004jvhSas/__ia_thumb.jpg', NULL, NULL, 15, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (80, NULL, 1, 'Weird Tales, May 1930', '2023-03-03T12:35:22', 'https://ia600609.us.archive.org/24/items/Weird_Tales_v15n05_1930-05_sas/__ia_thumb.jpg', NULL, NULL, 15, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (81, NULL, 1, 'Weird Tales, June 1930', '2023-03-03T12:35:22', 'https://ia800804.us.archive.org/24/items/WeirdTalesV15N06193006/__ia_thumb.jpg', NULL, NULL, 15, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (82, NULL, 1, 'Weird Tales, July 1930', '2023-03-03T12:35:22', 'https://ia601309.us.archive.org/18/items/Weird_Tales_v16n01_1930-07/__ia_thumb.jpg', NULL, NULL, 16, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (83, NULL, 1, 'Weird Tales, August 1930', '2023-03-03T12:35:22', 'https://ia800606.us.archive.org/33/items/Weird_Tales_v16n02_1930-08_sas/__ia_thumb.jpg', NULL, NULL, 16, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (84, NULL, 1, 'Weird Tales, September 1930', '2023-03-03T12:35:22', 'https://ia801401.us.archive.org/35/items/Weird_Tales_v16n03_1930-09_sas/__ia_thumb.jpg', NULL, NULL, 16, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (85, NULL, 1, 'Weird Tales, October 1930', '2023-03-03T12:35:22', 'https://ia904705.us.archive.org/8/items/Weird_Tales_v16n04_1930-10_sas/__ia_thumb.jpg', NULL, NULL, 16, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (86, NULL, 1, 'Weird Tales, November 1930', '2023-03-03T12:35:22', 'https://ia801408.us.archive.org/34/items/Weird_Tales_v16n05_1930-11_sas/__ia_thumb.jpg', NULL, NULL, 16, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (87, NULL, 1, 'Weird Tales, December 1930', '2023-03-03T12:35:22', 'https://ia601409.us.archive.org/19/items/Weird_Tales_v16n06_1930-12_AT-sas/__ia_thumb.jpg', NULL, NULL, 16, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (88, NULL, 1, 'Weird Tales, January 1931', '2023-03-03T12:35:22', 'https://ia801505.us.archive.org/29/items/Weird_Tales_v17n01_1931-01_AT-sas/__ia_thumb.jpg', NULL, NULL, 17, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (89, NULL, 1, 'Weird Tales, February, March 1931', '2023-03-03T12:35:22', 'https://ia800102.us.archive.org/26/items/WeirdTalesV17N0219310203/__ia_thumb.jpg', NULL, NULL, 17, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (90, NULL, 1, 'Weird Tales, April, May 1931', '2023-03-03T12:35:22', 'https://ia600905.us.archive.org/12/items/WeirdTales19310405ATLPM/__ia_thumb.jpg', NULL, NULL, 17, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (91, NULL, 1, 'Weird Tales, June, July 1931', '2023-03-03T12:35:22', 'https://ia600207.us.archive.org/10/items/Weird_Tales_v17n04_1931-07/__ia_thumb.jpg', NULL, NULL, 17, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (92, NULL, 1, 'Weird Tales, August 1931', '2023-03-03T12:35:22', 'https://ia601506.us.archive.org/33/items/Weird_Tales_v18n01_1931-08.Popular_Fiction_ATLPM-Sas/__ia_thumb.jpg', NULL, NULL, 18, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (93, NULL, 1, 'Weird Tales, September 1931', '2023-03-03T12:35:22', 'https://ia600103.us.archive.org/4/items/WeirdTalesV18N02193109/__ia_thumb.jpg', NULL, NULL, 18, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (94, NULL, 1, 'Weird Tales, October 1931', '2023-03-03T12:35:22', 'https://ia800106.us.archive.org/28/items/WeirdTalesV18N03193110/__ia_thumb.jpg', NULL, NULL, 18, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (95, NULL, 1, 'Weird Tales, November 1931', '2023-03-03T12:35:22', 'https://ia800902.us.archive.org/2/items/WeirdTalesV18N04193111/__ia_thumb.jpg', NULL, NULL, 18, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (96, NULL, 1, 'Weird Tales, December 1931', '2023-03-03T12:35:22', 'https://ia801509.us.archive.org/4/items/Weird_Tales_v18n05_1931-12_sas/__ia_thumb.jpg', NULL, NULL, 18, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (97, NULL, 1, 'Weird Tales, January 1932', '2023-03-03T12:35:22', 'https://ia903004.us.archive.org/35/items/WeirdTalesV19N01193201143Ibc/__ia_thumb.jpg', NULL, NULL, 19, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (98, NULL, 1, 'Weird Tales, February 1932', '2023-03-03T12:35:22', 'https://ia800608.us.archive.org/6/items/Weird_Tales_v19n02_1932-02_sas/__ia_thumb.jpg', NULL, NULL, 19, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (99, NULL, 1, 'Weird Tales, March 1932', '2023-03-03T12:35:22', 'https://ia600109.us.archive.org/3/items/WeirdTalesV19N03193203/__ia_thumb.jpg', NULL, NULL, 19, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (100, NULL, 1, 'Weird Tales, April 1932', '2023-03-03T12:35:22', 'https://ia800904.us.archive.org/10/items/WeirdTalesV19N04193204Ibc/__ia_thumb.jpg', NULL, NULL, 19, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (101, NULL, 1, 'Weird Tales, May 1932', '2023-03-03T12:35:22', 'https://ia601508.us.archive.org/19/items/Weird_Tales_v19n05_1932-05_LPM-URF-AT-SAS/__ia_thumb.jpg', NULL, NULL, 19, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (102, NULL, 1, 'Weird Tales, June 1932', '2023-03-03T12:35:22', 'https://ia600909.us.archive.org/8/items/WeirdTalesV19N06193206Ibc/__ia_thumb.jpg', NULL, NULL, 19, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (103, NULL, 1, 'Weird Tales, July 1932', '2023-03-03T12:35:22', 'https://ia903005.us.archive.org/8/items/WeirdTalesV20N01193207IfcIbc/__ia_thumb.jpg', NULL, NULL, 20, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (104, NULL, 1, 'Weird Tales, August 1932', '2023-03-03T12:35:22', 'https://ia800607.us.archive.org/26/items/Weird_Tales_v20n02_1932-08_sas/__ia_thumb.jpg', NULL, NULL, 20, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (105, NULL, 1, 'Weird Tales, September 1932', '2023-03-03T12:35:22', 'https://ia601506.us.archive.org/10/items/Weird_Tales_v20n03_1932-09_sas/__ia_thumb.jpg', NULL, NULL, 20, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (106, NULL, 1, 'Weird Tales, October 1932', '2023-03-03T12:35:22', 'https://ia800902.us.archive.org/16/items/WeirdTalesV20N04193210/__ia_thumb.jpg', NULL, NULL, 20, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (107, NULL, 1, 'Weird Tales, November 1932', '2023-03-03T12:35:22', 'https://ia800607.us.archive.org/5/items/Weird_Tales_v20n05_1932-11_sas/__ia_thumb.jpg', NULL, NULL, 20, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (108, NULL, 1, 'Weird Tales, December 1932', '2023-03-03T12:35:22', 'https://ia601408.us.archive.org/12/items/Weird_Tales_v20n06_1932-12_AT-sas/__ia_thumb.jpg', NULL, NULL, 20, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (109, NULL, 1, 'Weird Tales, January 1933', '2023-03-03T12:35:22', 'https://ia800604.us.archive.org/33/items/Weird_Tales_v21n01_1933-01_LPM-URF-AT-SAS/__ia_thumb.jpg', NULL, NULL, 21, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (110, NULL, 1, 'Weird Tales, February 1933', '2023-03-03T12:35:22', 'https://ia800206.us.archive.org/3/items/Weird_Tales_v21n02_1933-02/__ia_thumb.jpg', NULL, NULL, 21, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (111, NULL, 1, 'Weird Tales, March 1933', '2023-03-03T12:35:22', 'https://ia801406.us.archive.org/10/items/Weird_Tales_v21n03_1933-03_sas/__ia_thumb.jpg', NULL, NULL, 21, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (112, NULL, 1, 'Weird Tales, April 1933', '2023-03-03T12:35:22', 'https://ia800208.us.archive.org/32/items/Weird_Tales_v21n04_1933-04/__ia_thumb.jpg', NULL, NULL, 21, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (113, NULL, 1, 'Weird Tales, May 1933', '2023-03-03T12:35:22', 'https://ia801307.us.archive.org/17/items/Weird_Tales_v21n05_1933-05/__ia_thumb.jpg', NULL, NULL, 21, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (114, NULL, 1, 'Weird Tales, June 1933', '2023-03-03T12:35:22', 'https://ia600909.us.archive.org/26/items/WeirdTalesV21N06193306/__ia_thumb.jpg', NULL, NULL, 21, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (115, NULL, 1, 'Weird Tales, July 1933', '2023-03-03T12:35:22', 'https://ia801401.us.archive.org/25/items/Weird_Tales_v22n01_1933-07_sas/__ia_thumb.jpg', NULL, NULL, 22, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (116, NULL, 1, 'Weird Tales, August 1933', '2023-03-03T12:35:22', 'https://ia800901.us.archive.org/11/items/WeirdTalesV22N02193308/__ia_thumb.jpg', NULL, NULL, 22, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (117, NULL, 1, 'Weird Tales, September 1933', '2023-03-03T12:35:22', 'https://ia803002.us.archive.org/24/items/WeirdTalesV22n03193309IfcIbc/__ia_thumb.jpg', NULL, NULL, 22, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (118, NULL, 1, 'Weird Tales, October 1933', '2023-03-03T12:35:22', 'https://ia800202.us.archive.org/28/items/Weird_Tales_v22n04_1933-10/__ia_thumb.jpg', NULL, NULL, 22, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (119, NULL, 1, 'Weird Tales, November 1933', '2023-03-03T12:35:22', 'https://ia801409.us.archive.org/35/items/Weird_Tales_v22n05_1933-11_ELPM-SliV/__ia_thumb.jpg', NULL, NULL, 22, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (120, NULL, 1, 'Weird Tales, December 1933', '2023-03-03T12:35:22', 'https://ia801504.us.archive.org/27/items/Weird_Tales_v22n06_1933-12_LPM-URF-AT-SAS/__ia_thumb.jpg', NULL, NULL, 22, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (121, NULL, 1, 'Weird Tales, January 1934', '2023-03-03T12:35:22', 'https://ia800706.us.archive.org/30/items/WeirdTales193401ATLPM/__ia_thumb.jpg', NULL, NULL, 23, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (122, NULL, 1, 'Weird Tales, February 1934', '2023-03-03T12:35:22', 'https://ia801400.us.archive.org/32/items/Weird_Tales_v23n02_1934-02.Popular_Fiction_ATLPM-Sas/__ia_thumb.jpg', NULL, NULL, 23, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (123, NULL, 1, 'Weird Tales, March 1934', '2023-03-03T12:35:22', 'https://ia801400.us.archive.org/5/items/Weird_Tales_v23n03_1934-03_sas/__ia_thumb.jpg', NULL, NULL, 23, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (124, NULL, 1, 'Weird Tales, April 1934', '2023-03-03T12:35:22', 'https://ia800900.us.archive.org/17/items/WeirdTales193404damagedIBCATLPM/__ia_thumb.jpg', NULL, NULL, 23, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (125, NULL, 1, 'Weird Tales, May 1934', '2023-03-03T12:35:22', 'https://ia601405.us.archive.org/10/items/Weird_Tales_v23n05_1934-05_sas/__ia_thumb.jpg', NULL, NULL, 23, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (126, NULL, 1, 'Weird Tales, June 1934', '2023-03-03T12:35:22', 'https://ia601400.us.archive.org/1/items/Weird_Tales_v23n06_1934-06_sas/__ia_thumb.jpg', NULL, NULL, 23, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (127, NULL, 1, 'Weird Tales, July 1934', '2023-03-03T12:35:22', 'https://ia800903.us.archive.org/6/items/WeirdTalesV24N01193407/__ia_thumb.jpg', NULL, NULL, 24, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (128, NULL, 1, 'Weird Tales, August 1934', '2023-03-03T12:35:22', 'https://ia904700.us.archive.org/20/items/Weird_Tales_v24n02_1934-08_LPM-URF-AT/__ia_thumb.jpg', NULL, NULL, 24, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (129, NULL, 1, 'Weird Tales, September 1934', '2023-03-03T12:35:22', 'https://ia903006.us.archive.org/21/items/weirdtalesv24n03193409/__ia_thumb.jpg', NULL, NULL, 24, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (130, NULL, 1, 'Weird Tales, October 1934', '2023-03-03T12:35:22', 'https://ia800905.us.archive.org/3/items/WeirdTalesV24N04193410saspages4856Damaged/__ia_thumb.jpg', NULL, NULL, 24, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (131, NULL, 1, 'Weird Tales, November 1934', '2023-03-03T12:35:22', 'https://ia600905.us.archive.org/29/items/WeirdTalesV24n05193411ATLPM/__ia_thumb.jpg', NULL, NULL, 24, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (132, NULL, 1, 'Weird Tales, December 1934', '2023-03-03T12:35:22', 'https://ia800609.us.archive.org/32/items/Weird_Tales_v24n06_1934-12_sas/__ia_thumb.jpg', NULL, NULL, 24, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (133, NULL, 1, 'Weird Tales, January 1935', '2023-03-03T12:35:22', 'https://ia801301.us.archive.org/33/items/Weird_Tales_v25n01_1935-01/__ia_thumb.jpg', NULL, NULL, 25, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (134, NULL, 1, 'Weird Tales, February 1935', '2023-03-03T12:35:22', 'https://ia800908.us.archive.org/34/items/WeirdTalesV25N02193502/__ia_thumb.jpg', NULL, NULL, 25, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (135, NULL, 1, 'Weird Tales, March 1935', '2023-03-03T12:35:22', 'https://ia801501.us.archive.org/34/items/Weird_Tales_v25n03_1935-03_AT-sas/__ia_thumb.jpg', NULL, NULL, 25, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (136, NULL, 1, 'Weird Tales, April 1935', '2023-03-03T12:35:22', 'https://ia601407.us.archive.org/17/items/Weird_Tales_v25n04_1935-04_jvh-sas/__ia_thumb.jpg', NULL, NULL, 25, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (137, NULL, 1, 'Weird Tales, May 1935', '2023-03-03T12:35:22', 'https://ia804709.us.archive.org/10/items/Weird_Tales_v25n05_1935-05_sas/__ia_thumb.jpg', NULL, NULL, 25, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (138, NULL, 1, 'Weird Tales, June 1935', '2023-03-03T12:35:22', 'https://ia600607.us.archive.org/34/items/Weird_Tales_v25n06_1935-06_sas/__ia_thumb.jpg', NULL, NULL, 25, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (139, NULL, 1, 'Weird Tales, July 1935', '2023-03-03T12:35:22', 'https://ia804706.us.archive.org/0/items/Weird_Tales_v26n01_1935-07_ATLPM-Sas/__ia_thumb.jpg', NULL, NULL, 26, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (140, NULL, 1, 'Weird Tales, August 1935', '2023-03-03T12:35:22', 'https://ia600906.us.archive.org/35/items/WeirdTalesV26N02193508/__ia_thumb.jpg', NULL, NULL, 26, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (141, NULL, 1, 'Weird Tales, September 1935', '2023-03-03T12:35:22', 'https://ia903009.us.archive.org/24/items/WeirdTalesV26N03193509/__ia_thumb.jpg', NULL, NULL, 26, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (142, NULL, 1, 'Weird Tales, October 1935', '2023-03-03T12:35:22', 'https://ia601302.us.archive.org/10/items/Weird_Tales_v26n04_1935-10/__ia_thumb.jpg', NULL, NULL, 26, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (143, NULL, 1, 'Weird Tales, November 1935', '2023-03-03T12:35:22', 'https://ia800707.us.archive.org/32/items/WeirdTales193511ATLPM/__ia_thumb.jpg', NULL, NULL, 26, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (144, NULL, 1, 'Weird Tales, December 1935', '2023-03-03T12:35:22', 'https://ia600604.us.archive.org/30/items/Weird_Tales_v26n06_1935-12_sas_-783-784_ifcibc/__ia_thumb.jpg', NULL, NULL, 26, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (145, NULL, 1, 'Weird Tales, January 1936', '2023-03-03T12:35:22', 'https://ia803007.us.archive.org/12/items/WeirdTalesV27N01193601/__ia_thumb.jpg', NULL, NULL, 27, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (146, NULL, 1, 'Weird Tales, February 1936', '2023-03-03T12:35:22', 'https://ia600602.us.archive.org/28/items/Weird_Tales_v27n02_1936-02_jvh-sas_-ifc/__ia_thumb.jpg', NULL, NULL, 27, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (147, NULL, 1, 'Weird Tales, March 1936', '2023-03-03T12:35:22', 'https://ia800708.us.archive.org/4/items/WeirdTales193603ATLPM/__ia_thumb.jpg', NULL, NULL, 27, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (148, NULL, 1, 'Weird Tales, April 1936', '2023-03-03T12:35:22', 'https://ia600908.us.archive.org/20/items/WeirdTalesV27N04193604/__ia_thumb.jpg', NULL, NULL, 27, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (149, NULL, 1, 'Weird Tales, May 1936', '2023-03-03T12:35:22', 'https://ia800605.us.archive.org/9/items/Weird_Tales_v27n05_1936-05_sas/__ia_thumb.jpg', NULL, NULL, 27, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (150, NULL, 1, 'Weird Tales, June 1936', '2023-03-03T12:35:22', 'https://ia800900.us.archive.org/30/items/WeirdTalesV27N06193606/__ia_thumb.jpg', NULL, NULL, 27, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (151, NULL, 1, 'Weird Tales, July 1936', '2023-03-03T12:35:22', 'https://ia800906.us.archive.org/27/items/WeirdTalesV28N01193607/__ia_thumb.jpg', NULL, NULL, 28, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (152, NULL, 1, 'Weird Tales, August, September 1936', '2023-03-03T12:35:22', 'https://ia600208.us.archive.org/13/items/Weird_Tales_v28n02_1936-08-09/__ia_thumb.jpg', NULL, NULL, 28, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (153, NULL, 1, 'Weird Tales, October 1936', '2023-03-03T12:35:22', 'https://ia601302.us.archive.org/10/items/Weird_Tales_v28n03_1936-10/__ia_thumb.jpg', NULL, NULL, 28, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (154, NULL, 1, 'Weird Tales, November 1936', '2023-03-03T12:35:22', 'https://ia803000.us.archive.org/27/items/WeirdTalesV28N04193611/__ia_thumb.jpg', NULL, NULL, 28, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (155, NULL, 1, 'Weird Tales, December 1936', '2023-03-03T12:35:22', 'https://ia601008.us.archive.org/6/items/WeirdTalesV28N05193612/__ia_thumb.jpg', NULL, NULL, 28, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (156, NULL, 1, 'Weird Tales, January 1937', '2023-03-03T12:35:22', 'https://ia601406.us.archive.org/12/items/Weird_Tales_v29n01_1937-01_sas/__ia_thumb.jpg', NULL, NULL, 29, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (157, NULL, 1, 'Weird Tales, February 1937', '2023-03-03T12:35:22', 'https://ia800900.us.archive.org/25/items/WeirdTalesV29N02193702/__ia_thumb.jpg', NULL, NULL, 29, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (158, NULL, 1, 'Weird Tales, March 1937', '2023-03-03T12:35:22', 'https://ia800905.us.archive.org/19/items/WeirdTalesV29N03193703/__ia_thumb.jpg', NULL, NULL, 29, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (159, NULL, 1, 'Weird Tales, April 1937', '2023-03-03T12:35:22', 'https://ia801405.us.archive.org/9/items/Weird_Tales_v29n04_1937-04_sas/__ia_thumb.jpg', NULL, NULL, 29, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (160, NULL, 1, 'Weird Tales, May 1937', '2023-03-03T12:35:22', 'https://ia800609.us.archive.org/32/items/Weird_Tales_v29n05_1937-05_sas/__ia_thumb.jpg', NULL, NULL, 29, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (161, NULL, 1, 'Weird Tales, June 1937', '2023-03-03T12:35:22', 'https://ia601601.us.archive.org/17/items/WeirdTalesV29N06193706/__ia_thumb.jpg', NULL, NULL, 29, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (162, NULL, 1, 'Weird Tales, July 1937', '2023-03-03T12:35:22', 'https://ia800201.us.archive.org/12/items/Weird_Tales_v30n01_1937-07/__ia_thumb.jpg', NULL, NULL, 30, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (163, NULL, 1, 'Weird Tales, August 1937', '2023-03-03T12:35:22', 'https://ia800603.us.archive.org/18/items/Weird_Tales_v30n02_1937-08_sas/__ia_thumb.jpg', NULL, NULL, 30, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (164, NULL, 1, 'Weird Tales, September 1937', '2023-03-03T12:35:22', 'https://ia800204.us.archive.org/35/items/Weird_Tales_v30n03_1937-09/__ia_thumb.jpg', NULL, NULL, 30, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (165, NULL, 1, 'Weird Tales, October 1937', '2023-03-03T12:35:22', 'https://ia801405.us.archive.org/3/items/Weird_Tales_v30n04_1937-10_Gorgon776/__ia_thumb.jpg', NULL, NULL, 30, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (166, NULL, 1, 'Weird Tales, November 1937', '2023-03-03T12:35:22', 'https://ia800609.us.archive.org/7/items/Weird_Tales_v30n05_1937-11_ATLPM-Urf/__ia_thumb.jpg', NULL, NULL, 30, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (167, NULL, 1, 'Weird Tales, December 1937', '2023-03-03T12:35:22', 'https://ia600206.us.archive.org/34/items/Weird_Tales_v30n06_1937-12/__ia_thumb.jpg', NULL, NULL, 30, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (168, NULL, 1, 'Weird Tales, January 1938', '2023-03-03T12:35:22', 'https://ia804705.us.archive.org/30/items/Weird_Tales_v31n01_1938-01_sas/__ia_thumb.jpg', NULL, NULL, 31, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (169, NULL, 1, 'Weird Tales, February 1938', '2023-03-03T12:35:22', 'https://ia800204.us.archive.org/18/items/Weird_Tales_v31n02_1938-02/__ia_thumb.jpg', NULL, NULL, 31, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (170, NULL, 1, 'Weird Tales, March 1938', '2023-03-03T12:35:22', 'https://ia801309.us.archive.org/28/items/Weird_Tales_v31n03_1938-03/__ia_thumb.jpg', NULL, NULL, 31, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (171, NULL, 1, 'Weird Tales, April 1938', '2023-03-03T12:35:22', 'https://ia600609.us.archive.org/18/items/Weird_Tales_v31n04_1938-04_ATLPM-Urf/__ia_thumb.jpg', NULL, NULL, 31, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (172, NULL, 1, 'Weird Tales, May 1938', '2023-03-03T12:35:22', 'https://ia804706.us.archive.org/1/items/Weird_Tales_v31n05_1938-05_sas/__ia_thumb.jpg', NULL, NULL, 31, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (173, NULL, 1, 'Weird Tales, June 1938', '2023-03-03T12:35:22', 'https://ia800606.us.archive.org/31/items/Weird_Tales_v31n06_1938-06_sas/__ia_thumb.jpg', NULL, NULL, 31, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (174, NULL, 1, 'Weird Tales, July 1938', '2023-03-03T12:35:22', 'https://ia800606.us.archive.org/34/items/Weird_Tales_v32n01_1938-07_Gorgon776/__ia_thumb.jpg', NULL, NULL, 32, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (175, NULL, 1, 'Weird Tales, August 1938', '2023-03-03T12:35:22', 'https://ia904703.us.archive.org/29/items/Weird_Tales_v32n02_1938-08_sas/__ia_thumb.jpg', NULL, NULL, 32, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (176, NULL, 1, 'Weird Tales, September 1938', '2023-03-03T12:35:22', 'https://ia804703.us.archive.org/15/items/Weird_Tales_v32n03_1938-09_ATLPM-Urf/__ia_thumb.jpg', NULL, NULL, 32, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (177, NULL, 1, 'Weird Tales, October 1938', '2023-03-03T12:35:22', 'https://ia800204.us.archive.org/3/items/Weird_Tales_v32n04_1938-10/__ia_thumb.jpg', NULL, NULL, 32, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (178, NULL, 1, 'Weird Tales, November 1938', '2023-03-03T12:35:22', 'https://ia600207.us.archive.org/15/items/Weird_Tales_v32n05_1938-11/__ia_thumb.jpg', NULL, NULL, 32, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (179, NULL, 1, 'Weird Tales, December 1938', '2023-03-03T12:35:22', 'https://ia801501.us.archive.org/32/items/Weird_Tales_v32n06_1938-12_sas/__ia_thumb.jpg', NULL, NULL, 32, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (180, NULL, 1, 'Weird Tales, January 1939', '2023-03-03T12:35:22', 'https://ia800902.us.archive.org/18/items/WeirdTalesV33N01193901/__ia_thumb.jpg', NULL, NULL, 33, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (181, NULL, 1, 'Weird Tales, February 1939', '2023-03-03T12:35:22', 'https://ia801304.us.archive.org/35/items/Weird_Tales_v33n02_1939-02/__ia_thumb.jpg', NULL, NULL, 33, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (182, NULL, 1, 'Weird Tales, March 1939', '2023-03-03T12:35:22', 'https://ia804508.us.archive.org/4/items/Weird_Tales_v33n03_1939-03/__ia_thumb.jpg', NULL, NULL, 33, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (183, NULL, 1, 'Weird Tales, April 1939', '2023-03-03T12:35:22', 'https://ia601303.us.archive.org/12/items/Weird_Tales_v33n04_1939-04/__ia_thumb.jpg', NULL, NULL, 33, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (184, NULL, 1, 'Weird Tales, May 1939', '2023-03-03T12:35:22', 'https://ia600609.us.archive.org/31/items/Weird_Tales_v33n05_1939-05_AT-sas/__ia_thumb.jpg', NULL, NULL, 33, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (185, NULL, 1, 'Weird Tales, June, July 1939', '2023-03-03T12:35:22', 'https://ia803004.us.archive.org/0/items/WeirdTalesV34N0119390607/__ia_thumb.jpg', NULL, NULL, 34, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (186, NULL, 1, 'Weird Tales, August 1939', '2023-03-03T12:35:22', 'https://ia801504.us.archive.org/25/items/Weird_Tales_v34n02_1939-08_AT-sas/__ia_thumb.jpg', NULL, NULL, 34, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (187, NULL, 1, 'Weird Tales, September 1939', '2023-03-03T12:35:22', 'https://ia600204.us.archive.org/11/items/Weird_Tales_v34n03_1939-09/__ia_thumb.jpg', NULL, NULL, 34, 3, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (188, NULL, 1, 'Weird Tales, October 1939', '2023-03-03T12:35:22', 'https://ia801304.us.archive.org/24/items/Weird_Tales_v34n04_1939-10/__ia_thumb.jpg', NULL, NULL, 34, 4, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (189, NULL, 1, 'Weird Tales, November 1939', '2023-03-03T12:35:22', 'https://ia800207.us.archive.org/7/items/Weird_Tales_v34n05_1939-11/__ia_thumb.jpg', NULL, NULL, 34, 5, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (190, NULL, 1, 'Weird Tales, December 1939', '2023-03-03T12:35:22', 'https://ia600202.us.archive.org/12/items/Weird_Tales_v34n06_1939-12/__ia_thumb.jpg', NULL, NULL, 34, 6, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (191, NULL, 1, 'Weird Tales, January 1940', '2023-03-03T12:35:22', 'https://ia800204.us.archive.org/33/items/Weird_Tales_v35n01_1940-01/__ia_thumb.jpg', NULL, NULL, 35, 1, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (192, NULL, 1, 'Weird Tales, March 1940', '2023-03-03T12:35:22', 'https://ia801503.us.archive.org/10/items/Weird_Tales_v35n02_1940-03_jvh-sliv-slpn-sas/__ia_thumb.jpg', NULL, NULL, 35, 2, 2, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (193, NULL, 1, 'Weird Tales, May 1940', '2023-03-03T12:35:22', 'https://ia600207.us.archive.org/16/items/Weird_Tales_v35n03_1940-05/__ia_thumb.jpg', NULL, NULL, 35, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (194, NULL, 1, 'Weird Tales, July 1940', '2023-03-03T12:35:22', 'https://ia601507.us.archive.org/19/items/Weird_Tales_v35n04_1940-07/__ia_thumb.jpg', NULL, NULL, 35, 4, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (195, NULL, 1, 'Weird Tales, September 1940', '2023-03-03T12:35:22', 'https://ia600206.us.archive.org/6/items/Weird_Tales_v35n05_1940-09/__ia_thumb.jpg', NULL, NULL, 35, 5, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (196, NULL, 1, 'Weird Tales, November 1940', '2023-03-03T12:35:22', 'https://ia601309.us.archive.org/21/items/Weird_Tales_v35n06_1940-11/__ia_thumb.jpg', NULL, NULL, 35, 6, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (197, NULL, 1, 'Weird Tales, January 1941', '2023-03-03T12:35:22', 'https://ia600207.us.archive.org/26/items/Weird_Tales_v35n07_1941-01/__ia_thumb.jpg', NULL, NULL, 35, 7, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (198, NULL, 1, 'Weird Tales, March 1941', '2023-03-03T12:35:22', 'https://ia800208.us.archive.org/29/items/Weird_Tales_v35n08_1941-03/__ia_thumb.jpg', NULL, NULL, 35, 8, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (199, NULL, 1, 'Weird Tales, May 1941', '2023-03-03T12:35:22', 'https://ia601404.us.archive.org/5/items/Weird_Tales_v35n09_1941-05_-ifc_slpn/__ia_thumb.jpg', NULL, NULL, 35, 9, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (200, NULL, 1, 'Weird Tales, July 1941', '2023-03-03T12:35:22', 'https://ia801404.us.archive.org/28/items/Weird_Tales_v35n10_1941-07_sas/__ia_thumb.jpg', NULL, NULL, 35, 10, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (201, NULL, 1, 'Weird Tales, September 1941', '2023-03-03T12:35:22', 'https://ia601308.us.archive.org/2/items/Weird_Tales_v36n01_1941-09/__ia_thumb.jpg', NULL, NULL, 36, 1, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (202, NULL, 1, 'Weird Tales, November 1941', '2023-03-03T12:35:22', 'https://ia800908.us.archive.org/33/items/WeirdTalesV36N02194111Gorgon776/__ia_thumb.jpg', NULL, NULL, 36, 2, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (203, NULL, 1, 'Weird Tales, January 1942', '2023-03-03T12:35:22', 'https://ia804704.us.archive.org/2/items/Weird_Tales_v36n03_1942-01_AT-sas/__ia_thumb.jpg', NULL, NULL, 36, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (204, NULL, 1, 'Weird Tales, March 1942', '2023-03-03T12:35:22', 'https://ia601500.us.archive.org/13/items/Weird_Tales_v36n04_1942-03_sas/__ia_thumb.jpg', NULL, NULL, 36, 4, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (205, NULL, 1, 'Weird Tales, May 1942', '2023-03-03T12:35:22', 'https://ia800200.us.archive.org/7/items/Weird_Tales_v36n05_1942-05/__ia_thumb.jpg', NULL, NULL, 36, 5, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (206, NULL, 1, 'Weird Tales, July 1942', '2023-03-03T12:35:22', 'https://ia600608.us.archive.org/22/items/Weird_Tales_v36n06_1942-07_LPM-AT-SAS/__ia_thumb.jpg', NULL, NULL, 36, 6, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (207, NULL, 1, 'Weird Tales, September 1942', '2023-03-03T12:35:22', 'https://ia801309.us.archive.org/16/items/Weird_Tales_v36n07_1942-09/__ia_thumb.jpg', NULL, NULL, 36, 7, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (208, NULL, 1, 'Weird Tales, November 1942', '2023-03-03T12:35:22', 'https://ia800602.us.archive.org/10/items/Weird_Tales_v36n08_1942-11_sas/__ia_thumb.jpg', NULL, NULL, 36, 8, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (209, NULL, 1, 'Weird Tales, January 1943', '2023-03-03T12:35:22', 'https://ia600206.us.archive.org/20/items/Weird_Tales_v36n09_1943-01/__ia_thumb.jpg', NULL, NULL, 36, 9, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (210, NULL, 1, 'Weird Tales, March 1943', '2023-03-03T12:35:22', 'https://ia800606.us.archive.org/11/items/Weird_Tales_v36n10_1943-03_ATLPM-Sas/__ia_thumb.jpg', NULL, NULL, 36, 10, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (211, NULL, 1, 'Weird Tales, May 1943', '2023-03-03T12:35:22', 'https://ia601302.us.archive.org/19/items/Weird_Tales_v36n11_1943-05/__ia_thumb.jpg', NULL, NULL, 36, 11, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (212, NULL, 1, 'Weird Tales, July 1943', '2023-03-03T12:35:22', 'https://ia800209.us.archive.org/16/items/Weird_Tales_v36n12_1943-07/__ia_thumb.jpg', NULL, NULL, 36, 12, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (213, NULL, 1, 'Weird Tales, September 1943', '2023-03-03T12:35:22', 'https://upload.wikimedia.org/wikipedia/commons/6/60/Weird_Tales_September_1943.jpg?20091215222254', NULL, NULL, 37, 1, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (214, NULL, 1, 'Weird Tales, November 1943', '2023-03-03T12:35:22', 'https://ia600606.us.archive.org/4/items/Weird_Tales_v37n02_1943-11_sas/__ia_thumb.jpg', NULL, NULL, 37, 2, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (215, NULL, 1, 'Weird Tales, January 1944', '2023-03-03T12:35:22', 'https://ia800207.us.archive.org/13/items/Weird_Tales_v37n03_1944-01/__ia_thumb.jpg', NULL, NULL, 37, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (216, NULL, 1, 'Weird Tales, March 1944', '2023-03-03T12:35:22', 'https://ia800901.us.archive.org/12/items/WeirdTalesV37n04194403Ifcslpn/__ia_thumb.jpg', NULL, NULL, 37, 4, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (217, NULL, 1, 'Weird Tales, May 1944', '2023-03-03T12:35:22', 'https://ia601403.us.archive.org/11/items/Weird_Tales_v37n05_1944-05_LPM-AT/__ia_thumb.jpg', NULL, NULL, 37, 5, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (218, NULL, 1, 'Weird Tales, July 1944', '2023-03-03T12:35:22', 'https://ia800903.us.archive.org/14/items/WeirdTalesV37N06194407JTRA/__ia_thumb.jpg', NULL, NULL, 37, 6, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (219, NULL, 1, 'Weird Tales, September 1944', '2023-03-03T12:35:22', 'https://ia801302.us.archive.org/9/items/Weird_Tales_v38n01_1944-09/__ia_thumb.jpg', NULL, NULL, 38, 1, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (220, NULL, 1, 'Weird Tales, November 1944', '2023-03-03T12:35:22', 'https://ia800208.us.archive.org/8/items/Weird_Tales_v38n02_1944-11/__ia_thumb.jpg', NULL, NULL, 38, 2, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (221, NULL, 1, 'Weird Tales, January 1945', '2023-03-03T12:35:22', 'https://ia600200.us.archive.org/27/items/Weird_Tales_v38n03_1945-01/__ia_thumb.jpg', NULL, NULL, 38, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (222, NULL, 1, 'Weird Tales, March 1945', '2023-03-03T12:35:22', 'https://ia801302.us.archive.org/12/items/Weird_Tales_v38n04_1945-03/__ia_thumb.jpg', NULL, NULL, 38, 4, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (223, NULL, 1, 'Weird Tales, May 1945', '2023-03-03T12:35:22', 'https://ia601306.us.archive.org/15/items/Weird_Tales_v38n05_1945-05/__ia_thumb.jpg', NULL, NULL, 38, 5, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (224, NULL, 1, 'Weird Tales, July 1945', '2023-03-03T12:35:22', 'https://ia804706.us.archive.org/29/items/Weird_Tales_v38n06_1945-07_sas/__ia_thumb.jpg', NULL, NULL, 38, 6, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (225, NULL, 1, 'Weird Tales, September 1945', '2023-03-03T12:35:22', 'https://ia800203.us.archive.org/5/items/Weird_Tales_v39n01_1945-09/__ia_thumb.jpg', NULL, NULL, 39, 1, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (226, NULL, 1, 'Weird Tales, November 1945', '2023-03-03T12:35:22', 'https://ia600603.us.archive.org/21/items/Weird_Tales_v39n02_1945-11_jvh-sas/__ia_thumb.jpg', NULL, NULL, 39, 2, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (227, NULL, 1, 'Weird Tales, January 1946', '2023-03-03T12:35:22', 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Weird_Tales_January_1946.jpg', NULL, NULL, 39, 3, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (228, NULL, 1, 'Weird Tales, March 1946', '2023-03-03T12:35:22', 'https://ia600202.us.archive.org/7/items/Weird_Tales_v39n04_1946-03/__ia_thumb.jpg', NULL, NULL, 39, 4, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (229, NULL, 1, 'Weird Tales, May 1946', '2023-03-03T12:35:22', 'https://ia801304.us.archive.org/4/items/Weird_Tales_v39n05_1946-05/__ia_thumb.jpg', NULL, NULL, 39, 5, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (230, NULL, 1, 'Weird Tales, July 1946', '2023-03-03T12:35:22', 'https://ia904706.us.archive.org/34/items/Weird_Tales_v39n06_1946-07_AT-sas/__ia_thumb.jpg', NULL, NULL, 39, 6, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (231, NULL, 1, 'Weird Tales, September 1946', '2023-03-03T12:35:22', 'https://ia801305.us.archive.org/8/items/Weird_Tales_v39n07_1946-09/__ia_thumb.jpg', NULL, NULL, 39, 7, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (232, NULL, 1, 'Weird Tales, November 1946', '2023-03-03T12:35:22', 'https://ia801303.us.archive.org/12/items/Weird_Tales_v39n08_1946-11/__ia_thumb.jpg', NULL, NULL, 39, 8, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (233, NULL, 1, 'Weird Tales, January 1947', '2023-03-03T12:35:22', 'https://ia801305.us.archive.org/31/items/Weird_Tales_v39n09_1947-01/__ia_thumb.jpg', NULL, NULL, 39, 9, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (234, NULL, 1, 'Weird Tales, March 1947', '2023-03-03T12:35:22', 'https://ia800607.us.archive.org/3/items/Weird_Tales_v39n10_1947-03_jvh-sas/__ia_thumb.jpg', NULL, NULL, 39, 10, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (235, NULL, 1, 'Weird Tales, May 1947', '2023-03-03T12:35:22', 'https://ia800605.us.archive.org/22/items/Weird_Tales_v39n11_1947-05_LPM-AT-SAS/__ia_thumb.jpg', NULL, NULL, 39, 11, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (236, NULL, 1, 'Weird Tales, July 1947', '2023-03-03T12:35:22', 'https://ia600605.us.archive.org/16/items/Weird_Tales_v39n11_1947-07_LPM-AT-SAS/__ia_thumb.jpg', NULL, NULL, 39, 11, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (237, NULL, 1, 'Weird Tales, September 1947', '2023-03-03T12:35:22', 'https://ia800200.us.archive.org/33/items/Weird_Tales_v39n12_1947-09/__ia_thumb.jpg', NULL, NULL, 39, 12, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (238, NULL, 1, 'Weird Tales, November 1947', '2023-03-03T12:35:22', 'https://ia600205.us.archive.org/3/items/Weird_Tales_v40n01_1947-11/__ia_thumb.jpg', NULL, NULL, 40, 1, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (239, NULL, 1, 'Weird Tales, January 1948', '2023-03-03T12:35:22', 'https://ia800605.us.archive.org/31/items/Weird_Tales_v40n02_1948-01_LPM-AT-SAS/__ia_thumb.jpg', NULL, NULL, 40, 2, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (240, NULL, 1, 'Weird Tales, March 1948', '2023-03-03T12:35:22', 'https://ia800207.us.archive.org/13/items/Weird_Tales_v40n03_1948-03/__ia_thumb.jpg', NULL, NULL, 40, 3, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (241, NULL, 1, 'Weird Tales, May 1948', '2023-03-03T12:35:22', 'https://ia601305.us.archive.org/9/items/Weird_Tales_v40n04_1948-05/__ia_thumb.jpg', NULL, NULL, 40, 4, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (242, NULL, 1, 'Weird Tales, July 1948', '2023-03-03T12:35:22', 'https://ia800207.us.archive.org/28/items/Weird_Tales_v40n05_1948-07/__ia_thumb.jpg', NULL, NULL, 40, 5, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (243, NULL, 1, 'Weird Tales, September 1948', '2023-03-03T12:35:22', 'https://ia801300.us.archive.org/27/items/Weird_Tales_v40n06_1948-09/__ia_thumb.jpg', NULL, NULL, 40, 6, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (244, NULL, 1, 'Weird Tales, November 1948', '2023-03-03T12:35:22', 'https://ia601308.us.archive.org/29/items/Weird_Tales_v41n01_1948-11/__ia_thumb.jpg', NULL, NULL, 41, 1, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (245, NULL, 1, 'Weird Tales, January 1949', '2023-03-03T12:35:22', 'https://ia600609.us.archive.org/35/items/Weird_Tales_v41n02_1949-01_unz.org/__ia_thumb.jpg', NULL, NULL, 41, 2, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (246, NULL, 1, 'Weird Tales, March 1949', '2023-03-03T12:35:22', 'https://ia804707.us.archive.org/3/items/Weird_Tales_v41n03_1949-03_-ifc_slpn/__ia_thumb.jpg', NULL, NULL, 41, 3, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (247, NULL, 1, 'Weird Tales, May 1949', '2023-03-03T12:35:22', 'https://ia601306.us.archive.org/34/items/Weird_Tales_v41n04_1949-05/__ia_thumb.jpg', NULL, NULL, 41, 4, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (248, NULL, 1, 'Weird Tales, July 1949', '2023-03-03T12:35:22', 'https://ia800607.us.archive.org/9/items/Weird_Tales_v41n05_1949-07_LPM-AT-SAS/__ia_thumb.jpg', NULL, NULL, 41, 5, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (249, NULL, 1, 'Weird Tales, September 1949', '2023-03-03T12:35:22', 'https://ia800202.us.archive.org/19/items/Weird_Tales_v41n06_1949-09/__ia_thumb.jpg', NULL, NULL, 41, 6, 4, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (250, NULL, 1, 'Weird Tales, November 1949', '2023-03-03T12:35:22', 'https://ia800201.us.archive.org/6/items/Weird_Tales_v42n01_1949-11/__ia_thumb.jpg', NULL, NULL, 42, 1, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (251, NULL, 1, 'Weird Tales, January 1950', '2023-03-03T12:35:22', 'https://ia800202.us.archive.org/25/items/Weird_Tales_v42n02_1950-01/__ia_thumb.jpg', NULL, NULL, 42, 2, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (252, NULL, 1, 'Weird Tales, March 1950', '2023-03-03T12:35:22', 'https://ia801504.us.archive.org/14/items/Weird_Tales_v42n03_1950-03_unz.org/__ia_thumb.jpg', NULL, NULL, 42, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (253, NULL, 1, 'Weird Tales, May 1950', '2023-03-03T12:35:22', 'https://ia801307.us.archive.org/9/items/Weird_Tales_v42n04_1950-05/__ia_thumb.jpg', NULL, NULL, 42, 4, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (254, NULL, 1, 'Weird Tales, July 1950', '2023-03-03T12:35:22', 'https://ia801509.us.archive.org/7/items/Weird_Tales_v42n05_1950-07_LPM-AT/__ia_thumb.jpg', NULL, NULL, 42, 5, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (255, NULL, 1, 'Weird Tales, September 1950', '2023-03-03T12:35:22', 'https://ia600202.us.archive.org/20/items/Weird_Tales_v42n06_1950-09/__ia_thumb.jpg', NULL, NULL, 42, 6, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (256, NULL, 1, 'Weird Tales, November 1950', '2023-03-03T12:35:22', 'https://ia601306.us.archive.org/28/items/Weird_Tales_v43n01_1950-11/__ia_thumb.jpg', NULL, NULL, 43, 1, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (257, NULL, 1, 'Weird Tales, January 1951', '2023-03-03T12:35:22', 'https://ia801308.us.archive.org/25/items/Weird_Tales_v43n02_1951-01/__ia_thumb.jpg', NULL, NULL, 43, 2, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (258, NULL, 1, 'Weird Tales, March 1951', '2023-03-03T12:35:22', 'https://ia801305.us.archive.org/33/items/Weird_Tales_v43n03_1951-03/__ia_thumb.jpg', NULL, NULL, 43, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (259, NULL, 1, 'Weird Tales, May 1951', '2023-03-03T12:35:22', 'https://ia801400.us.archive.org/32/items/Weird_Tales_v43n04_1951-05_ATLPM-Sas/__ia_thumb.jpg', NULL, NULL, 43, 4, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (260, NULL, 1, 'Weird Tales, July 1951', '2023-03-03T12:35:22', 'https://ia801309.us.archive.org/14/items/Weird_Tales_v43n05_1951-07/__ia_thumb.jpg', NULL, NULL, 43, 5, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (261, NULL, 1, 'Weird Tales, September 1951', '2023-03-03T12:35:22', 'https://ia601304.us.archive.org/15/items/Weird_Tales_v43n06_1951-09/__ia_thumb.jpg', NULL, NULL, 43, 6, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (262, NULL, 1, 'Weird Tales, November 1951', '2023-03-03T12:35:22', 'https://ia601305.us.archive.org/3/items/Weird_Tales_v44n01_1951-11/__ia_thumb.jpg', NULL, NULL, 44, 1, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (263, NULL, 1, 'Weird Tales, January 1952', '2023-03-03T12:35:22', 'https://ia801303.us.archive.org/12/items/Weird_Tales_v44n02_1952-01/__ia_thumb.jpg', NULL, NULL, 44, 2, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (264, NULL, 1, 'Weird Tales, March 1952', '2023-03-03T12:35:22', 'https://ia801304.us.archive.org/7/items/Weird_Tales_v44n03_1952-03/__ia_thumb.jpg', NULL, NULL, 44, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (265, NULL, 1, 'Weird Tales, May 1952', '2023-03-03T12:35:22', 'https://ia801301.us.archive.org/5/items/Weird_Tales_v44n04_1952-05/__ia_thumb.jpg', NULL, NULL, 44, 4, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (266, NULL, 1, 'Weird Tales, July 1952', '2023-03-03T12:35:22', 'https://ia801404.us.archive.org/13/items/Weird_Tales_v44n05_1952-07_sas/__ia_thumb.jpg', NULL, NULL, 44, 5, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (267, NULL, 1, 'Weird Tales, September 1952', '2023-03-03T12:35:22', 'https://ia801308.us.archive.org/20/items/Weird_Tales_v44n06_1952-09/__ia_thumb.jpg', NULL, NULL, 44, 6, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (268, NULL, 1, 'Weird Tales, November 1952', '2023-03-03T12:35:22', 'https://ia601302.us.archive.org/21/items/Weird_Tales_v44n07_1952-11/__ia_thumb.jpg', NULL, NULL, 44, 7, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (269, NULL, 1, 'Weird Tales, January 1953', '2023-03-03T12:35:22', 'https://ia800605.us.archive.org/0/items/Weird_Tales_v44n08_1953-01_SLiV/__ia_thumb.jpg', NULL, NULL, 44, 8, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (270, NULL, 1, 'Weird Tales, March 1953', '2023-03-03T12:35:22', 'https://ia800604.us.archive.org/26/items/Weird_Tales_v45n01_1953-03_ATLPM-Urf/__ia_thumb.jpg', NULL, NULL, 45, 1, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (271, NULL, 1, 'Weird Tales, May 1953', '2023-03-03T12:35:22', 'https://ia801306.us.archive.org/14/items/Weird_Tales_v45n02_1953-05/__ia_thumb.jpg', NULL, NULL, 45, 2, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (272, NULL, 1, 'Weird Tales, July 1953', '2023-03-03T12:35:22', 'https://ia601306.us.archive.org/16/items/Weird_Tales_v45n03_1953-07/__ia_thumb.jpg', NULL, NULL, 45, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (273, NULL, 1, 'Weird Tales, September 1953', '2023-03-03T12:35:22', 'https://ia801506.us.archive.org/12/items/Weird_Tales_v45n04_1953-09_sas/__ia_thumb.jpg', NULL, NULL, 45, 4, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (274, NULL, 1, 'Weird Tales, November 1953', '2023-03-03T12:35:22', 'https://ia801407.us.archive.org/14/items/Weird_Tales_v45n05_1953-11_sas/__ia_thumb.jpg', NULL, NULL, 45, 5, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (275, NULL, 1, 'Weird Tales, January 1954', '2023-03-03T12:35:22', 'https://ia800207.us.archive.org/28/items/Weird_Tales_v45n06_1954-01/__ia_thumb.jpg', NULL, NULL, 45, 6, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (276, NULL, 1, 'Weird Tales, March 1954', '2023-03-03T12:35:22', 'https://ia800209.us.archive.org/0/items/Weird_Tales_v46n01_1954-03/__ia_thumb.jpg', NULL, NULL, 46, 1, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (277, NULL, 1, 'Weird Tales, May 1954', '2023-03-03T12:35:22', 'https://ia600606.us.archive.org/35/items/Weird_Tales_v46n02_1954-05_LPM-AT-SAS/__ia_thumb.jpg', NULL, NULL, 46, 2, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (278, NULL, 1, 'Weird Tales, July 1954', '2023-03-03T12:35:22', 'https://ia800201.us.archive.org/22/items/Weird_Tales_v46n03_1954-07/__ia_thumb.jpg', NULL, NULL, 46, 3, 3, NULL);
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`, `magazine_editor_id`, `table_of_contents`) VALUES (279, NULL, 1, 'Weird Tales, September 1954', '2023-03-03T12:35:22', 'https://ia800605.us.archive.org/19/items/Weird_Tales_v46n04_1954-09_sas/__ia_thumb.jpg', NULL, NULL, 46, 4, 3, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `author_profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (8, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (11, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (12, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (13, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (14, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (15, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (16, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (17, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (18, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (19, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (20, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (21, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (22, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (23, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (24, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (25, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (26, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (27, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (28, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (29, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (30, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (31, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (32, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (33, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (34, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (35, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (36, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (37, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (38, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (39, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (40, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (41, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (42, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');
INSERT INTO `author_profile` (`id`, `image_url`, `bio`) VALUES (43, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Robert_E_Howard_suit.jpg/440px-Robert_E_Howard_suit.jpg', 'Howard was one of the most prolific short story writers in American history, and has created such beloved characters as Conan the Barbarian, Kull of Atlantis, Soloman Kane, Bran Mak Morn, El Borak, and Dark Agnès de Chastillon. He tragically passed away in 1936.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `author`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (1, 'Julian Kilman', 1, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (2, 'Orville R. Emerson', 2, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (3, 'Joel Townsley Rogers', 3, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (4, 'Bryan Irvine', 4, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (5, 'G. A. Wells', 5, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (6, 'David R. Solomon', 6, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (7, 'Merlin Moore Taylor', 7, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (8, 'Farnsworth Wright', 8, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (9, 'Howard Ellis Davis', 9, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (10, 'Herbert J. Mangham', 10, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (11, 'Meredith Davis', 11, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (12, 'Walter Scott Story', 12, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (13, 'W. H. Holmes', 13, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (14, 'R. T. M. Scott', 14, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (15, '? ? ?', 15, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (16, 'William Sanford', 16, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (17, 'Joseph Faus', 17, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (18, 'James Bennett Wooding', 18, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (19, 'Capt. George Warburton Lewis', 19, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (20, 'F. Georgia Stroup', 20, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (21, 'I. W. D. Peters', 21, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (22, 'Harold Ward', 22, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (23, 'James B. M. Clark, Jr.', 23, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (24, 'Willard E. Hawkins', 24, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (25, 'Anthony M. Rud', 25, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (26, 'Hamilton Craigie', 26, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (27, 'Otis Adelbert Kline', 27, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (28, 'Edwin Baird', 28, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (29, 'Carl Rasmus', 29, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (30, 'Paul Suter', 30, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (31, 'Roylston Markham', 31, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (32, 'Paul Crumpler', 32, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (33, 'Anton M. Oliver', 33, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (34, 'Artemus Calloway', 34, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (35, 'Victor Johns', 35, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (36, 'Ray McGillivray', 36, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (37, 'Laurie McClintock', 37, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (38, 'Culpeper Chunn', 38, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (39, 'Ted Olson', 39, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (40, 'Carrol F. Michener', 40, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (41, 'Francis D. Grierson', 41, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (42, 'C. E. Howard', 42, NULL, NULL);
INSERT INTO `author` (`id`, `full_name`, `author_profile_id`, `thumbnail_url`, `image_url`) VALUES (43, 'Harry Irving Shumway', 43, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `magazine_story`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (1, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (2, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (3, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (4, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (5, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (6, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (7, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (8, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (9, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (10, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (11, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (12, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (13, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (14, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (15, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (16, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (17, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (18, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (19, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (20, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (21, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (22, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (23, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (24, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (25, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (26, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (27, 1);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (28, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (29, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (30, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (31, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (33, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (34, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (35, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (36, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (37, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (38, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (39, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (40, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (41, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (42, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (43, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (44, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (45, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (46, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (47, 2);
INSERT INTO `magazine_story` (`story_id`, `magazine_id`) VALUES (48, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story_author`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (1, 1);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (2, 2);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (3, 3);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (4, 4);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (5, 5);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (6, 6);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (7, 7);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (8, 8);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (9, 9);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (10, 10);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (11, 11);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (12, 12);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (13, 13);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (14, 14);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (15, 15);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (16, 16);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (17, 17);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (18, 19);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (19, 20);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (20, 21);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (21, 22);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (22, 23);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (23, 24);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (24, 25);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (25, 26);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (26, 27);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (27, 28);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (17, 18);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (28, 29);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (29, 30);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (30, 31);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (31, 32);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (32, 33);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (33, 26);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (34, 22);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (35, 34);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (36, 8);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (37, 25);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (38, 1);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (39, 35);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (40, 36);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (41, 37);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (42, 27);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (43, 39);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (44, 40);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (45, 41);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (46, 42);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (47, 43);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (48, 28);
INSERT INTO `story_author` (`story_id`, `author_id`) VALUES (41, 38);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `story_comment` (`id`, `user_id`, `story_id`, `content`, `created_at`, `updated_at`, `parent_comment_id`, `is_deleted`) VALUES (1, 1, 1, 'Slowly he rose, mechanically wiping his hands upon his cloak. A dark scowl had settled on his somber brow. Yet he made no wild, reckless vow, swore no oath by saints or devils.', '2023-03-03T12:35:22', NULL, NULL, 0);
INSERT INTO `story_comment` (`id`, `user_id`, `story_id`, `content`, `created_at`, `updated_at`, `parent_comment_id`, `is_deleted`) VALUES (2, 2, 1, '\"Men shall die for this,\" he said coldly.', '2023-03-03T12:35:23', NULL, 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `tag` (`id`, `genre`) VALUES (1, 'DETECTIVE_CRIME');
INSERT INTO `tag` (`id`, `genre`) VALUES (2, 'HORROR');
INSERT INTO `tag` (`id`, `genre`) VALUES (3, 'WESTERN');
INSERT INTO `tag` (`id`, `genre`) VALUES (4, 'ADVENTURE');
INSERT INTO `tag` (`id`, `genre`) VALUES (5, 'ROMANCE');
INSERT INTO `tag` (`id`, `genre`) VALUES (6, 'SCIENCE_FICTION');
INSERT INTO `tag` (`id`, `genre`) VALUES (7, 'FANTASY');
INSERT INTO `tag` (`id`, `genre`) VALUES (8, 'WAR_AND_AIR_COMBAT');
INSERT INTO `tag` (`id`, `genre`) VALUES (9, 'SPORTS');
INSERT INTO `tag` (`id`, `genre`) VALUES (10, 'NOT_SPECIFIED');

COMMIT;


-- -----------------------------------------------------
-- Data for table `publication_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `publication_tag` (`publication_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `publication_tag` (`publication_id`, `tag_id`) VALUES (1, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `magazine_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `magazine_tag` (`magazine_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `magazine_tag` (`magazine_id`, `tag_id`) VALUES (1, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `story_tag` (`story_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `story_tag` (`story_id`, `tag_id`) VALUES (1, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `author_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `author_tag` (`author_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `author_tag` (`author_id`, `tag_id`) VALUES (1, 3);
INSERT INTO `author_tag` (`author_id`, `tag_id`) VALUES (1, 4);
INSERT INTO `author_tag` (`author_id`, `tag_id`) VALUES (1, 6);
INSERT INTO `author_tag` (`author_id`, `tag_id`) VALUES (1, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story_pdf`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `story_pdf` (`id`, `story_id`, `story_url`) VALUES (1, 1, 'https://nyc3.digitaloceanspaces.com/sffaudio-usa/mp3s/RedShadowsByRobertE.HowardWT.pdf');

COMMIT;


-- -----------------------------------------------------
-- Data for table `member`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `member` (`id`, `name`, `description`, `image_url`, `thumbnail_url`) VALUES (1, 'Solomon Kane', 'A late-16th-to-early-17th century Puritan, Solomon Kane is a somber-looking man who wanders the world with no apparent goal other than to vanquish evil in all its forms.', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story_member`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `story_member` (`story_id`, `member_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_follower`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `user_has_follower` (`follower_id`, `followed_id`, `created_at`) VALUES (2, 3, '2023-05-19T11:35:22');

COMMIT;


-- -----------------------------------------------------
-- Data for table `group_conversation`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `group_conversation` (`id`, `created_at`, `updated_at`) VALUES (1, '2023-06-19T11:35:22', '2023-06-19T11:35:22');

COMMIT;


-- -----------------------------------------------------
-- Data for table `member_group`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `member_group` (`id`, `name`, `description`, `user_id`, `created_at`, `group_conversation_id`) VALUES (1, 'Robert E. Howard Club', 'We are a passionate group of people who enjoy discussing everything Robert E. Howard', 2, '2023-06-19T11:35:22', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `group_member`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `group_member` (`id`, `user_id`, `created_at`, `member_group_id`) VALUES (1, 2, '2023-06-19T11:35:22', 1);
INSERT INTO `group_member` (`id`, `user_id`, `created_at`, `member_group_id`) VALUES (2, 3, '2023-06-20T11:35:22', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_conversation`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `user_conversation` (`id`, `user_id`, `created_at`, `updated_at`) VALUES (1, 2, '2023-06-19T11:35:22', '2023-06-20T11:35:22');

COMMIT;


-- -----------------------------------------------------
-- Data for table `private_message`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `private_message` (`id`, `user_conversation_id`, `content`, `created_at`, `sender_id`, `recipient_id`) VALUES (1, 1, 'We were both written by the same author.', '2023-06-19T11:35:22', 2, 3);
INSERT INTO `private_message` (`id`, `user_conversation_id`, `content`, `created_at`, `sender_id`, `recipient_id`) VALUES (2, 1, 'Too bad I am stuck in the Hyborean Age.', '2023-06-20T11:35:22', 3, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `group_message`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `group_message` (`id`, `group_conversation_id`, `group_member_id`, `message`, `created_at`, `parent_message_id`) VALUES (1, 1, 1, 'Hello REH enthusiasts!', '2023-06-19T11:35:22', NULL);
INSERT INTO `group_message` (`id`, `group_conversation_id`, `group_member_id`, `message`, `created_at`, `parent_message_id`) VALUES (2, 1, 2, 'Thanks for the warm welcome!', NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `magazine_pdf`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (1, 'https://archive.org/details/WeirdTalesV01n01192303', 1);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (2, 'https://archive.org/details/WeirdTalesV01n02192304', 2);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (3, 'https://archive.org/details/WeirdTalesV01n03192305', 3);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (4, 'https://archive.org/details/Weird_Tales_v01n04_1923-06', 4);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (5, 'https://archive.org/details/WeirdTales_v02n01_1923-07-08', 5);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (6, 'https://archive.org/details/Weird_Tales_v02n02_1923-09', 6);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (7, 'https://archive.org/details/Weird_Tales_v02n03_1923-10', 7);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (8, 'https://archive.org/details/Weird_Tales_v02n04_1923-11', 8);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (9, 'https://archive.org/details/WeirdTalesV03N01192401', 9);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (10, 'https://archive.org/details/WeirdTalesV03N02192402', 10);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (11, 'https://archive.org/details/WeirdTalesV03n03192403', 11);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (12, 'https://archive.org/details/WeirdTalesV03n04192404', 12);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (13, 'https://archive.org/details/WeirdTales1924050607ATLPM', 13);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (14, 'https://archive.org/details/WeirdTalesV04N03192411', 14);
INSERT INTO `magazine_pdf` (`id`, `magazine_url`, `magazine_id`) VALUES (15, 'https://archive.org/details/WeirdTalesV04N04192412', 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story_anchor`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (1, 'BLACK_JEAN', 1, 1);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (2, 'THE_GRAVE', 1, 2);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (3, 'HARK_THE_RATTLE', 1, 3);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (4, 'THE_GHOST_GUARD', 1, 4);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (5, 'THE_GHOUL', 1, 5);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (6, 'FEAR', 1, 6);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (7, 'PLACE_OF_MADNESS', 1, 7);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (8, 'The_Closing_Hand', 1, 8);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (9, 'THE_UNKNOWN_BEAST', 1, 9);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (10, 'The_Basket', 1, 10);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (11, 'THE_ACCUSING_VOICE', 1, 11);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (12, 'The_Sequel', 1, 12);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (13, 'The_Weaving', 1, 13);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (14, 'Nimba_the', 1, 14);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (15, 'YOUNG_MAN_WHO_WANTED', 1, 15);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (16, 'THE_SCARLET_NIGHT', 1, 16);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (17, 'DR_CALGRONI', 1, 17);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (18, 'RETURN_PAUL_SLAVSKY', 1, 18);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (19, 'HOUSE_OF_DEATH', 1, 19);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (20, 'GALLOWS', 1, 20);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (21, 'SKULL', 1, 21);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (22, 'APE-MAN', 1, 22);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (23, 'DEAD_MANS_TALE', 1, 23);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (24, 'OOZE', 1, 24);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (25, 'THE_CHAIN', 1, 25);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (26, 'THING_OF_THOUSAND_SHAPES', 1, 26);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (27, 'The_Eyrie', 1, 27);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (28, 'THE_SCAR', 2, 28);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (29, 'Beyond_the_Door', 2, 29);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (30, 'The_Tortoise_Shell_Comb', 2, 30);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (31, 'A_Photographic_Phantasm', 2, 31);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (32, 'The_Living_Nightmare', 2, 32);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (33, 'The_Incubus', 2, 33);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (34, 'The_Bodymaster', 2, 34);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (35, 'Jungle_Death', 2, 35);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (36, 'The_Snake_Fiend', 2, 36);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (37, 'A_Square_of_Canvas', 2, 37);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (38, 'The_Affair_of_the_Man_in_Scarlet', 2, 38);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (39, 'The_Hideous_Face', 2, 39);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (40, 'The_Forty_Jars', 2, 40);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (41, 'The_Whispering_Thing', 2, 41);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (42, 'The_Thing_of_a_Thousand_Shapes', 2, 42);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (43, 'The_Conquering_Will', 2, 43);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (44, 'Six_Feet_of_Willow', 2, 44);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (45, 'The_Hall_of_the_Dead', 2, 45);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (46, 'The_Parlor_Cemetery', 2, 46);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (47, 'Golden_Glow', 2, 47);
INSERT INTO `story_anchor` (`id`, `anchor_tag`, `magazine_html_id`, `story_id`) VALUES (48, 'The_Eyrie', 2, 48);

COMMIT;


-- -----------------------------------------------------
-- Data for table `artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (1, 'Richard R. Epperly', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (2, 'William F. Heitman', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (3, 'R.M. Mally', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (4, 'Washburn', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (5, 'Andrew Benson', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (6, 'Andrew Brosnatch', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (7, 'Joseph Doolin', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (8, 'C. Barker Petrie, Jr.', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (9, 'E.M. Stevenson', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (10, 'T. Wyatt Nelson', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (11, 'Hugh Rankin', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (12, 'J. Allen St. John', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (13, 'Curtis C. Senf', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (14, 'Margaret Brundage', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (15, 'Virgil Finlay', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (16, 'Richard Bennett', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (17, 'Hannes Bok', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (18, 'Harold S. De Lay', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (19, 'Matt Fox', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (20, 'John Giunta', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (21, 'Gretta (Joseph C. Gretter)', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (22, 'Ray Quigley', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (23, 'A.R. Tilburne', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (24, 'Edgar Franklin Wittmack', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (25, 'Lee Brown Coye', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (26, 'Ronald Clyne', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (27, 'Boris Dolgov', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (28, 'Peter Kuhlhoff', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (29, 'Michael Labonski', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (30, 'A.R. Tilburne', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (31, 'Jon Arfstrom', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (32, 'Lee Brown Coye', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (33, 'Anthony Di Giannurio', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (34, 'Joseph R. Eberle', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (35, 'Frank Kelly Freas', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (36, 'Charles A. Kennedy', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (37, 'W.H. Silvey', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (38, 'Evan Singer', NULL, NULL);
INSERT INTO `artist` (`id`, `name`, `image_url`, `description`) VALUES (39, 'Bill Wayne', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cover_artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (1, 1);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (2, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (3, 2);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (4, 2);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (5, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (6, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (7, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (8, 4);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (9, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (10, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (11, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (12, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (13, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (14, 3);
INSERT INTO `cover_artist` (`cover_artwork_id`, `artist_id`) VALUES (15, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `post` (`id`, `title`, `content`, `created_at`, `updated_at`, `user_id`) VALUES (1, 'Growing Up Reading Robert E. Howard', 'I fell in love with reading through Robert E. Howard\'s stories.', '2023-03-03T12:35:22', '2023-03-03T12:35:22', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `comment` (`id`, `content`, `created_at`, `updated_at`, `post_id`, `user_id`, `parent_comment_id`) VALUES (1, 'I had the same experience.', '2023-03-03T12:35:23', '2023-03-03T12:35:23', 1, 2, NULL);
INSERT INTO `comment` (`id`, `content`, `created_at`, `updated_at`, `post_id`, `user_id`, `parent_comment_id`) VALUES (2, 'As did I.', '2023-03-03T12:40:23', '2023-03-03T12:40:23', 1, 3, 1);

COMMIT;

