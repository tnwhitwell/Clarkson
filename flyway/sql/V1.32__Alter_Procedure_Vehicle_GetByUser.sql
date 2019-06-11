DROP PROCEDURE `Vehicle_GetByUser`;

DELIMITER $$

CREATE PROCEDURE `Vehicle_GetByUser`
(
    in_user VARCHAR(36)
)
BEGIN

    SELECT
        *
    FROM
        `UserVehicles` UV
            INNER JOIN `Vehicles` V ON UV.vehicle = V.id
    WHERE
        UV.`user` = in_user;

END$$
