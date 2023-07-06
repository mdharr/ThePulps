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
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `collection` ;

CREATE TABLE IF NOT EXISTS `collection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
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
  `title` VARCHAR(100) NULL,
  `story_url` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL,
  `released_at` DATETIME NULL,
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
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cover_artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cover_artwork` ;

CREATE TABLE IF NOT EXISTS `cover_artwork` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `magazine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `magazine` ;

CREATE TABLE IF NOT EXISTS `magazine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cover_artwork_id` INT NOT NULL,
  `publication_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_magazine_cover_artwork1_idx` (`cover_artwork_id` ASC),
  INDEX `fk_magazine_publication1_idx` (`publication_id` ASC),
  CONSTRAINT `fk_magazine_cover_artwork1`
    FOREIGN KEY (`cover_artwork_id`)
    REFERENCES `cover_artwork` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_magazine_publication1`
    FOREIGN KEY (`publication_id`)
    REFERENCES `publication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `author` ;

CREATE TABLE IF NOT EXISTS `author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `full_name` VARCHAR(45) NULL,
  `birth_date` DATETIME NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
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
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_comment` ;

CREATE TABLE IF NOT EXISTS `story_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ticket` ;

CREATE TABLE IF NOT EXISTS `ticket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_ticket` ;

CREATE TABLE IF NOT EXISTS `user_ticket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `ticket_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_ticket_user1_idx` (`user_id` ASC),
  INDEX `fk_user_ticket_ticket1_idx` (`ticket_id` ASC),
  CONSTRAINT `fk_user_ticket_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_ticket_ticket1`
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
  `user_id` INT NOT NULL,
  `publication_id` INT NOT NULL,
  `magazine_id` INT NOT NULL,
  `story_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  `rating_value` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rating_user1_idx` (`user_id` ASC),
  INDEX `fk_rating_publication1_idx` (`publication_id` ASC),
  INDEX `fk_rating_magazine1_idx` (`magazine_id` ASC),
  INDEX `fk_rating_story1_idx` (`story_id` ASC),
  INDEX `fk_rating_author1_idx` (`author_id` ASC),
  CONSTRAINT `fk_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_publication1`
    FOREIGN KEY (`publication_id`)
    REFERENCES `publication` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_magazine1`
    FOREIGN KEY (`magazine_id`)
    REFERENCES `magazine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_author1`
    FOREIGN KEY (`author_id`)
    REFERENCES `author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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

SET SQL_MODE = '';
DROP USER IF EXISTS thepulps@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'thepulps'@'localhost' IDENTIFIED BY 'thepulps';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'thepulps'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `thepulpsdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`) VALUES (1, 'admin', '$2a$10$4SMKDcs9jT18dbFxqtIqDeLEynC7MUrCEUbv1a/bhO.x9an9WGPvm', 1, 'ADMIN');

COMMIT;

