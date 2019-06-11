DELIMITER $$

CREATE PROCEDURE `Vehicle_ShareWithUser`
(
    calling_user VARCHAR(36),
    vehicle VARCHAR(36),
    sharing_user VARCHAR(36)
)
BEGIN
    INSERT INTO `UserVehicles` (`user`, `vehicle`, `permission`)
    SELECT
        sharing_user, Vehicles.id, 2
    FROM
        `Vehicles`;

END$$
DELIMITER ;
