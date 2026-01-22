<?php
// config.php - Configuration and DB connection (MySQL version)

$host = '127.0.0.1';
$db   = 'timetable_db';
$user = 'timetable_user';
$pass = 'password123';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

session_start();

// Basic helper functions
function redirect($url) {
    header("Location: $url");
    exit();
}

function isLoggedIn() {
    return isset($_SESSION['user_id']);
}

function hasRole($role) {
    return isset($_SESSION['role']) && $_SESSION['role'] === $role;
}

function requireLogin() {
    if (!isLoggedIn()) {
        redirect('/timetable_app/modules/accounts/login.php');
    }
}

function requireRole($role) {
    requireLogin();
    if (!hasRole($role)) {
        die("Access denied.");
    }
}

function logHistory($user_id, $action, $table, $record_id, $old_val = null, $new_val = null) {
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO history (user_id, action, table_name, record_id, old_value, new_value) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->execute([$user_id, $action, $table, $record_id, $old_val, $new_val]);
}

function isTimetableComplete($class_id, $semester_id) {
    global $pdo;
    // Get count of courses that should be scheduled for this class
    // For demo, we check if at least 5 entries exist or match teacher_courses count
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM teacher_courses WHERE class_id = ?");
    $stmt->execute([$class_id]);
    $assigned = $stmt->fetchColumn();

    $stmt = $pdo->prepare("SELECT COUNT(DISTINCT course_id) FROM timetable WHERE class_id = ? AND semester_id = ?");
    $stmt->execute([$class_id, $semester_id]);
    $scheduled = $stmt->fetchColumn();

    return ($assigned > 0 && $scheduled >= $assigned);
}
?>
