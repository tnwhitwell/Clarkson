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
        `UserVehicles` t1
            INNER JOIN `Vehicles` t2 ON t1.vehicle = t2.id
    WHERE
        `user` = in_user;

END$$
