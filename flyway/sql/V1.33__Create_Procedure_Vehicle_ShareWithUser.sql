DELIMITER $$

CREATE PROCEDURE `Vehicle_ShareWithUser`
(
    calling_user VARCHAR(36),
    vehicle VARCHAR(36),
    sharing_user VARCHAR(36)
)
BEGIN
    INSERT INTO `UserVehicles` (`user`, `vehicle`)
    SELECT
        sharing_user, Vehicles.id
    FROM
        `Vehicles`
    WHERE
        `owner` = calling_user
    AND
        `vehicle` = vehicle;

END$$
DELIMITER ;
