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
  `image_url` VARCHAR(255) NULL,
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
  `image_url` VARCHAR(255) NULL,
  `magazine_html_id` INT NULL,
  `volume` INT NULL,
  `issue` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_magazine_cover_artwork1_idx` (`cover_artwork_id` ASC),
  INDEX `fk_magazine_publication1_idx` (`publication_id` ASC),
  INDEX `fk_magazine_magazine_html1_idx` (`magazine_html_id` ASC),
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
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (1, 'The Mystery of Black Jean', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (2, 'The Grave', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (3, 'Hark! The Rattle!', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (4, 'The Ghost Guard', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (5, 'The Ghoul and the Corpse', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (6, 'Fear', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (7, 'The Place of Madness', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (8, 'The Closing Hand', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (9, 'The Unknown Beast', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (10, 'The Basket', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (11, 'The Accusing Voice', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (12, 'The Sequel', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (13, 'The Weaving Shadows', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (14, 'Nimba, the Cave Girl', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (15, 'The Young Man Who Wanted to Die', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (16, 'The Scarlet Night', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (17, 'The Extraordinary Experiment of Dr. Calgroni', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (18, 'The Return of Paul Slavsky', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (19, 'The House of Death', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (20, 'The Gallows', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (21, 'The Skull', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (22, 'The Ape-Man', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (23, 'The Dead Man’s Tale', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (24, 'Ooze', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (25, 'The Chain', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (26, 'The Thing of a Thousand Shapes', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story` (`id`, `title`, `created_at`, `thumbnail_url`, `background_url`) VALUES (27, 'The Eyrie', '2023-03-03T12:35:22', NULL, NULL);

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
INSERT INTO `publication` (`id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `description`) VALUES (1, 'Weird Tales', '2023-03-03T12:35:22', NULL, NULL, 'Weird Tales is an American fantasy and horror fiction pulp magazine founded by J. C. Henneberger and J. M. Lansinger in late 1922. The first issue, dated March 1923, appeared on newsstands February 18.The first editor, Edwin Baird, printed early work by H. P. Lovecraft, Seabury Quinn, and Clark Ashton Smith, all of whom would go on to be popular writers, but within a year the magazine was in financial trouble. Henneberger sold his interest in the publisher, Rural Publishing Corporation, to Lansinger and refinanced Weird Tales, with Farnsworth Wright as the new editor. The first issue under Wright’s control was dated November 1924. The magazine was more successful under Wright, and despite occasional financial setbacks it prospered over the next fifteen years. Under Wright’s control the magazine lived up to its subtitle, “The Unique Magazine”, and published a wide range of unusual fiction.\n\nLovecraft’s Cthulhu mythos stories first appeared in Weird Tales, starting with “The Call of Cthulhu” in 1928. These were well-received, and a group of writers associated with Lovecraft wrote other stories set in the same milieu. Robert E. Howard was a regular contributor, and published several of his Conan the Barbarian stories in the magazine, and Seabury Quinn’s series of stories about Jules de Grandin, a detective who specialized in cases involving the supernatural, was very popular with the readers. Other well-liked authors included Nictzin Dyalhis, E. Hoffmann Price, Robert Bloch, and H. Warner Munn. Wright published some science fiction, along with the fantasy and horror, partly because when Weird Tales was launched there were no magazines specializing in science fiction, but he continued this policy even after the launch of magazines such as Amazing Stories in 1926. Edmond Hamilton wrote a good deal of science fiction for Weird Tales, though after a few years he used the magazine for his more fantastic stories, and submitted his space operas elsewhere.\n\nIn 1938 the magazine was sold to William Delaney, the publisher of Short Stories, and within two years Wright, who was ill, was replaced by Dorothy McIlwraith as editor. Although some successful new authors and artists, such as Ray Bradbury and Hannes Bok, continued to appear, the magazine is considered by critics to have declined under McIlwraith from its heyday in the 1930s. Weird Tales ceased publication in 1954, but since then numerous attempts have been made to relaunch the magazine, starting in 1973. The longest-lasting version began in 1988 and ran with an occasional hiatus for over 20 years under an assortment of publishers. In the mid-1990s the title was changed to Worlds of Fantasy & Horror because of licensing issues, with the original title returning in 1998.\n\nThe magazine is regarded by historians of fantasy and science fiction as a legend in the field, with Robert Weinberg, author of a history of the magazine, considering it “the most important and influential of all fantasy magazines”. Weinberg’s fellow historian, Mike Ashley, is more cautious, describing it as “second only to Unknown in significance and influence”, adding that “somewhere in the imagination reservoir of all U.S. (and many non-U.S.) genre-fantasy and horror writers is part of the spirit of Weird Tales”.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cover_artwork`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `cover_artwork` (`id`, `image_url`) VALUES (1, 'https://www.gutenberg.org/files/68957/68957-h/images/cover.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `magazine_html`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `magazine_html` (`id`, `file_url`) VALUES (1, 'https://www.gutenberg.org/files/68957/68957-h/68957-h.htm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `magazine`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `magazine` (`id`, `cover_artwork_id`, `publication_id`, `name`, `created_at`, `thumbnail_url`, `image_url`, `magazine_html_id`, `volume`, `issue`) VALUES (1, 1, 1, 'Weird Tales, March 1923', '2023-03-03T12:35:22', NULL, NULL, 1, 1, 1);

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

COMMIT;


-- -----------------------------------------------------
-- Data for table `story_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `story_comment` (`id`, `user_id`, `story_id`, `content`, `created_at`, `updated_at`, `parent_comment_id`) VALUES (1, 1, 1, 'Slowly he rose, mechanically wiping his hands upon his cloak. A dark scowl had settled on his somber brow. Yet he made no wild, reckless vow, swore no oath by saints or devils.', '2023-03-03T12:35:22', NULL, NULL);
INSERT INTO `story_comment` (`id`, `user_id`, `story_id`, `content`, `created_at`, `updated_at`, `parent_comment_id`) VALUES (2, 2, 1, '\"Men shall die for this,\" he said coldly.', '2023-03-03T12:35:23', NULL, 1);

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

