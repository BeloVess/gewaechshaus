<?php 
$update = json_decode(file_get_contents("php://input"), TRUE);
#file_put_contents("request.log", print_r($update, TRUE));

# TODO: check password from gitlab

$config = parse_ini_file("bot.ini");
#error_log(print_r($config, TRUE));
$chatId = $config["chatid"];
$token = $config["token"];

if ($update && is_array($update) && array_key_exists("project", $update)) {
    $project = trim($update["project"]["name"]);
    $name = trim($update["commits"][0]["author"]["name"]);
    $message = trim($update["commits"][0]["message"]);
    $time = date_create(trim($update["commits"][0]["timestamp"]));
    $url = trim($update["repository"]["homepage"]);

    #error_log($project);
    #error_log($name);
    #error_log($message);
    #error_log($time);
    #error_log($url);

    $path = "https://api.telegram.org/bot";

    $params = [
        'chat_id' => $chatId,
        'text' => sprintf(
            "Камрады! Новый коммит!\nАвтор: %s\nПроект %s\nВремя %s\nСообщение: %s\nСтраница проекта: %s",
            $name,
            $project,
            date_format($time, 'Y-m-d H:i:s'),
            $message,
            $url
        )
    ];

    $ch = curl_init($path.$token."/sendMessage");
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, ($params));
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $result = curl_exec($ch);
    curl_close($ch);
    #error_log($result);
}
?>
