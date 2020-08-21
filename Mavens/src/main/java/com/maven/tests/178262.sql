USE `epat`;
DROP procedure IF EXISTS `get_relocation_report_data`;

DELIMITER $$
USE `epat`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_relocation_report_data`(IN locationName VARCHAR(100),IN fxName VARCHAR(100), IN fieldEngineer VARCHAR(100), IN relocationType VARCHAR(100),IN layerlevelName VARCHAR(100), IN fromDate VARCHAR(100), IN toDate VARCHAR(100), IN pageNum INT, IN limitValue INT)
BEGIN

DECLARE totalCount INT;

set totalCount = (select count(r.deviceMac) from relocatedDevice r WHERE r.newLocationName = if (locationName = 'ALL', r.newLocationName, locationName) and r.deviceName = if (fxName = 'ALL', r.deviceName, fxName) and r.fieldEngineer=if(fieldEngineer='ALL', r.fieldEngineer,fieldEngineer) and r.relocationType = if(relocationType = 'ALL',r.relocationType,relocationType) and r.deviceType = if(layerlevelName='ALL',r.deviceType,layerlevelName) and r.relocatedDate between fromDate and toDate);

IF(limitValue > 0) THEN

select r.relocatedDate,r.deviceType,r.relocationType,r.deviceMac,r.ipAddress,r.deviceName,r.bbrRange,r.ipRange,r.parentDeviceMac,r.parentDeviceName,r.parentDeviceIp,r.parentPort,r.oldDeviceMac,r.oldIpAddress,r.oldBbrRange,r.oldIpRange,r.oldParentDeviceMac,r.oldParentDeviceName,r.oldParentDeviceIp,r.fieldEngineer,r.oldSmeVlan,r.newSmeVlan, totalCount, r.newLocationName,r.via, b.outerVlan FROM relocateddevice r JOIN device d ON r.deviceMac=d.macAddress JOIN bbrrange b ON d.deviceId=b.deviceId  WHERE r.newLocationName = if (locationName = 'ALL', r.newLocationName, locationName) and r.deviceName = if (fxName = 'ALL', r.deviceName, fxName) and r.fieldEngineer=if(fieldEngineer='ALL', r.fieldEngineer,fieldEngineer) and r.relocationType = if(relocationType = 'ALL',r.relocationType,relocationType) and r.deviceType = if(layerlevelName='ALL',r.deviceType,layerlevelName) and r.relocatedDate between fromDate and toDate limit pageNum,limitValue;

ELSE

select r.relocatedDate,r.deviceType,r.relocationType,r.deviceMac,r.ipAddress,r.deviceName,r.bbrRange,r.ipRange,r.parentDeviceMac,r.parentDeviceName,r.parentDeviceIp,r.parentPort,r.oldDeviceMac,r.oldIpAddress,r.oldBbrRange,r.oldIpRange,r.oldParentDeviceMac,r.oldParentDeviceName,r.oldParentDeviceIp,r.fieldEngineer,r.oldSmeVlan,r.newSmeVlan, totalCount, r.newLocationName,r.via,b.outerVlan FROM relocateddevice r JOIN device d ON r.deviceMac=d.macAddress JOIN bbrrange b ON d.deviceId=b.deviceId WHERE r.newLocationName = if (locationName = 'ALL', r.newLocationName, locationName) and r.deviceName = if (fxName = 'ALL', r.deviceName, fxName) and r.fieldEngineer=if(fieldEngineer='ALL', r.fieldEngineer,fieldEngineer) and r.relocationType = if(relocationType = 'ALL',r.relocationType,relocationType) and r.deviceType = if(layerlevelName='ALL',r.deviceType,layerlevelName) and r.relocatedDate between fromDate and toDate;

END IF;

end$$

DELIMITER ;

