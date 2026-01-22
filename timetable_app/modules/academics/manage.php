<?php
require_once __DIR__ . '/../../includes/config.php';
requireRole('admin');

$action = $_GET['action'] ?? 'list';

if ($action === 'add_class' && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("INSERT INTO classes (name, program_id, size, semester_id) VALUES (?, ?, ?, ?)");
    $stmt->execute([$_POST['name'], $_POST['program_id'], $_POST['size'], $_POST['semester_id']]);
    redirect('/modules/academics/manage.php');
}

// Simple CRUD for Departments, Programs, Classes for the demo
$departments = $pdo->query("SELECT * FROM departments")->fetchAll();
$programs = $pdo->query("SELECT * FROM programs")->fetchAll();
$classes = $pdo->query("SELECT c.*, p.name as program_name, s.name as semester_name FROM classes c JOIN programs p ON c.program_id = p.id JOIN semesters s ON c.semester_id = s.id")->fetchAll();
$semesters = $pdo->query("SELECT s.*, ay.name as year_name FROM semesters s JOIN academic_years ay ON s.academic_year_id = ay.id")->fetchAll();

require_once __DIR__ . '/../../includes/header.php';
?>

<div class="card">
    <h2>Paramétrage Académique</h2>

    <h3>Classes</h3>
    <table>
        <thead>
            <tr>
                <th>Nom</th>
                <th>Filière</th>
                <th>Semestre</th>
                <th>Effectif</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($classes as $class): ?>
                <tr>
                    <td><?php echo $class['name']; ?></td>
                    <td><?php echo $class['program_name']; ?></td>
                    <td><?php echo $class['semester_name']; ?></td>
                    <td><?php echo $class['size']; ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <h3>Ajouter une Classe</h3>
    <form method="POST" action="?action=add_class">
        <div>
            <label>Nom de la classe (ex: ICT-L2)</label>
            <input type="text" name="name" required>
        </div>
        <div>
            <label>Filière</label>
            <select name="program_id">
                <?php foreach ($programs as $p): ?>
                    <option value="<?php echo $p['id']; ?>"><?php echo $p['name']; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div>
            <label>Semestre</label>
            <select name="semester_id">
                <?php foreach ($semesters as $s): ?>
                    <option value="<?php echo $s['id']; ?>"><?php echo $s['name']; ?> (<?php echo $s['year_name']; ?>)</option>
                <?php endforeach; ?>
            </select>
        </div>
        <div>
            <label>Effectif</label>
            <input type="number" name="size" required>
        </div>
        <button type="submit" class="btn btn-success">Ajouter</button>
    </form>
</div>

<div class="card">
    <h3>Départements & Filières</h3>
    <p>Gérez les départements et filières ici (simplifié pour la démo).</p>
    <!-- In a full app, more CRUD here -->
</div>

<?php
require_once __DIR__ . '/../../includes/footer.php';
?>
