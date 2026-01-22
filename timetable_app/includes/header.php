<?php
require_once __DIR__ . '/config.php';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion Emploi du Temps</title>
    <link rel="stylesheet" href="/timetable_app/assets/css/style.css">
</head>
<body>
<nav>
    <div class="container">
        <a href="/timetable_app/index.php" class="brand">Timetable Manager</a>
        <ul>
            <?php if (isLoggedIn()): ?>
                <li><a href="/timetable_app/modules/views/view.php">Emploi du Temps</a></li>
                <?php if (hasRole('admin')): ?>
                    <li><a href="/timetable_app/modules/academics/manage.php">Académique</a></li>
                    <li><a href="/timetable_app/modules/teachers/manage.php">Enseignants</a></li>
                    <li><a href="/timetable_app/modules/rooms/manage.php">Salles</a></li>
                    <li><a href="/timetable_app/modules/views/room_view.php">Salles View</a></li>
                    <li><a href="/timetable_app/modules/arbitration/manage.php">Arbitrage</a></li>
                    <li><a href="/timetable_app/modules/scheduling/manage.php">Planification</a></li>
                    <li><a href="/timetable_app/modules/history/view.php">Historique</a></li>
                <?php elseif (hasRole('teacher')): ?>
                    <li><a href="/timetable_app/modules/preferences/submit.php">Mes Désidératas</a></li>
                    <li><a href="/timetable_app/modules/views/teacher_view.php">Mon Emploi du Temps</a></li>
                <?php endif; ?>
                <li><a href="/timetable_app/modules/accounts/logout.php">Déconnexion (<?php echo $_SESSION['username']; ?>)</a></li>
            <?php else: ?>
                <li><a href="/timetable_app/modules/accounts/login.php">Connexion</a></li>
            <?php endif; ?>
        </ul>
    </div>
</nav>
<div class="container content">
