<?php
require_once __DIR__ . '/includes/header.php';
?>

<div class="card">
    <h1>Bienvenue sur l'application de Gestion d'Emploi du Temps</h1>
    <p>Cette plateforme permet la gestion optimisée des emplois du temps de l'établissement.</p>

    <?php if (!isLoggedIn()): ?>
        <p>Veuillez vous <a href="/timetable_app/modules/accounts/login.php">connecter</a> pour accéder aux fonctionnalités.</p>
    <?php else: ?>
        <p>Bonjour, <strong><?php echo $_SESSION['full_name']; ?></strong>. Vous êtes connecté en tant que <strong><?php echo $_SESSION['role']; ?></strong>.</p>
        <div class="dashboard-links">
            <?php if (hasRole('admin')): ?>
                <a href="/timetable_app/modules/academics/manage.php" class="btn btn-primary">Gérer l'Académique</a>
                <a href="/timetable_app/modules/scheduling/manage.php" class="btn btn-success">Planifier</a>
            <?php elseif (hasRole('teacher')): ?>
                <a href="/timetable_app/modules/preferences/submit.php" class="btn btn-primary">Soumettre mes Désidératas</a>
                <a href="/timetable_app/modules/views/view.php" class="btn btn-success">Voir l'Emploi du Temps</a>
            <?php endif; ?>
        </div>
    <?php endif; ?>
</div>

<?php
require_once __DIR__ . '/includes/footer.php';
?>
