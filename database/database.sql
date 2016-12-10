CREATE TABLE `loot_boxes` (
	`box_id` INT NOT NULL,
	`name` varchar(64) NOT NULL,
	`price` INT NOT NULL DEFAULT '1',
	`content_id` INT NOT NULL,
	PRIMARY KEY (`box_id`)
);

CREATE TABLE `loot_contents` (
	`id` INT NOT NULL,
	`items` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `loot_rarities` (
	`id` INT NOT NULL,
	`name` varchar(32) NOT NULL UNIQUE,
	`chance` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `loot_Items` (
	`item_id` VARCHAR(255) NOT NULL,
	`name` varchar(32) NOT NULL UNIQUE,
	`rarity_id` INT NOT NULL UNIQUE,
	PRIMARY KEY (`item_id`)
);

CREATE TABLE `loot_administrators` (
	`id` INT NOT NULL,
	`username` varchar(32) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`last_login` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `loot_boxes` ADD CONSTRAINT `loot_boxes_fk0` FOREIGN KEY (`content_id`) REFERENCES `loot_contents`(`id`);

ALTER TABLE `loot_Items` ADD CONSTRAINT `loot_Items_fk0` FOREIGN KEY (`rarity_id`) REFERENCES `loot_rarities`(`id`);

/* add user - username: "lootadmin" - password: "password" */
INSERT INTO  `u245699475_loot`.`loot_administrators` (
	`id` ,
	`username` ,
	`password` ,
	`last_login`
	)
	VALUES (
		'1',  'lootadmin',  '$2y$10$4eoacJodtahsthUGDv4mTuP1qYb/Q77X9nDoOvklVJsy1cYd.IZbe', CURRENT_TIMESTAMP
);
