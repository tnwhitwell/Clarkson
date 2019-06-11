CREATE TABLE `UserVehiclePermissions` (
    `id`                    int             NOT NULL AUTO_INCREMENT,
    `name`                  VARCHAR(36)     NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id` ASC)
);

INSERT INTO `UserVehiclePermissions` (id, name)
VALUES (1, "owner"),(2, "shared");

CREATE TABLE `UserVehicles` (
    `id`                    int             NOT NULL AUTO_INCREMENT,
    `user`                  VARCHAR(36)     NOT NULL,
    `vehicle`               VARCHAR(36)     NOT NULL,
    `permission`            int     NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id` ASC),
    INDEX `FK_UserVehicle_user_idx` (`user`),
    INDEX `FK_UserVehicle_vehicle_idx` (`vehicle`),
    INDEX `FK_UserVehicle_permission_idx` (`permission`),
    CONSTRAINT `FK_UserVehicle_user_id`            FOREIGN KEY (`vehicle`)    REFERENCES `Vehicles` (`id`)               ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_UserVehicle_vehicle_id`         FOREIGN KEY (`user`)       REFERENCES `Users` (`id`)                  ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_UserVehicle_permission_id`      FOREIGN KEY (`permission`) REFERENCES `UserVehiclePermissions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `UQ_UserVehicle_user_id_vehicle_id` UNIQUE (`user`, `vehicle`)
);

INSERT INTO `UserVehicles` (`user`, `vehicle`, `permission`)
SELECT user, id, 1 FROM Vehicles;
