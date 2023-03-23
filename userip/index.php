<!DOCTYPE html>
<html>
<head>
    <title>Geo City Locator by geolocation-db.com</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<hr/>
<div id="ip"></div>
<div id="address"></div>
<hr/>Full response: <pre id="details"></pre>
</body>
<script>
    jQuery(document).ready(function($) {
        $.get("https://ipinfo.io/json", function (response) {
            $("#ip").html("IP: " + response.ip);
            $("#address").html("Location: " + response.city + ", " + response.region);
            $("#details").html(JSON.stringify(response, null, 4));
        }, "jsonp");
    });
</script>
</html>