CREATE TABLE `UserVehicles` (
    `id`                    int             NOT NULL AUTO_INCREMENT,
    `user`                  VARCHAR(36)     NOT NULL,
    `vehicle`               VARCHAR(36)     NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id` ASC),
    INDEX `FK_UserVehicle_user_idx` (`user`),
    INDEX `FK_UserVehicle_vehicle_idx` (`vehicle`),
    CONSTRAINT `FK_UserVehicle_user_id`            FOREIGN KEY (`vehicle`)    REFERENCES `Vehicles` (`id`)   ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_UserVehicle_vehicle_id`         FOREIGN KEY (`user`)       REFERENCES `Users` (`id`)       ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `UQ_UserVehicle_user_id_vehicle_id` UNIQUE (`user`, `vehicle`)
);

INSERT INTO UserVehicles (user, vehicle)
SELECT user, id FROM Vehicles;

ALTER TABLE `Vehicles`
CHANGE COLUMN `user` `owner` VARCHAR(36);
