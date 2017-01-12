<?php

require '../OlxStartUpConfigs.php';

function getCities($regionId) {
    return json_encode(OlxStartConfigs::getRegionCyties($regionId));
}

if (isset($_POST['region_id'])) {
    echo getCities($_POST['region_id']);
}
