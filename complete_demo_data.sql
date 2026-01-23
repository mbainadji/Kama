
-- Complete Demo Data for ICT-L2 S1 2025/2026

-- Clean existing demo data to avoid duplicates
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE timetable;
TRUNCATE TABLE teacher_courses;
TRUNCATE TABLE courses;
TRUNCATE TABLE teachers;
TRUNCATE TABLE users;
TRUNCATE TABLE classes;
TRUNCATE TABLE programs;
TRUNCATE TABLE departments;
SET FOREIGN_KEY_CHECKS = 1;

-- Users & Roles
INSERT INTO users (id, username, password, role, full_name) VALUES (1, 'admin', '$2y$10$f/9S5z6f/y0u6yFf3x.ooe7yU2p8X0u5y7Z5y5y5y5y5y5y5y5y5y', 'admin', 'Chef de Département'); -- pass: admin123

-- Teachers
INSERT INTO users (id, username, password, role, full_name) VALUES
(2, 'monthe', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'MONTHE'),
(3, 'eone', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'EONE'),
(4, 'kwette', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'KWETTE'),
(5, 'musima', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'MUSIMA'),
(6, 'nkondock', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'NKONDOCK'),
(7, 'mossebo', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'MOSSEBO'),
(8, 'mbous', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'MBOUS'),
(9, 'sevany', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'SEVANY'),
(10, 'nkouandou', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'NKOUANDOU'),
(11, 'biyong', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'BIYONG'),
(12, 'videme', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'VIDEME'),
(13, 'ekono', '$2y$10$7Z5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y5y', 'teacher', 'EKONO');

INSERT INTO departments (id, name) VALUES (1, 'Informatique');
INSERT INTO programs (id, department_id, name) VALUES (1, 1, 'ICT4D');
INSERT INTO classes (id, program_id, name, size, semester_id) VALUES (1, 1, 'ICT-L2', 150, 1);

INSERT INTO teachers (id, user_id, name, department_id) VALUES
(1, 2, 'MONTHE', 1), (2, 3, 'EONE', 1), (3, 4, 'KWETTE', 1), (4, 5, 'MUSIMA', 1),
(5, 6, 'NKONDOCK', 1), (6, 7, 'MOSSEBO', 1), (7, 8, 'MBOUS', 1), (8, 9, 'SEVANY', 1),
(9, 10, 'NKOUANDOU', 1), (10, 11, 'BIYONG', 1), (11, 12, 'VIDEME', 1), (12, 13, 'EKONO', 1);

-- Courses
INSERT INTO courses (id, code, title, program_id) VALUES
(1, 'ICT207', 'Maintenance Informatique', 1),
(2, 'ICT203', 'Réseaux Informatiques', 1),
(3, 'ICT205', 'Systèmes d\'Exploitation', 1),
(4, 'ENG203', 'English II', 1),
(5, 'ICT201', 'Algorithmique II', 1),
(6, 'ICT213', 'Bases de Données', 1),
(7, 'ICT215', 'Probabilités et Statistiques', 1),
(8, 'ICT217', 'Architecture des Ordinateurs', 1),
(9, 'FRA203', 'Français II', 1);

-- Slots
-- (Assume slots 1-18 are already created as per previous schema initialization: Lundi 8-11, 11:30-14:30, 15-18, etc.)

-- Timetable Entries
-- Lundi
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 1, 1, 1, 2, 1, 'G1'); -- ICT207-G1 (MONTHE) 11h30-14h30
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 8, 9, 1, 3, 1, 'G1'); -- ICT217-G1 (NKOUANDOU) 15h00-18h00

-- Mardi
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 1, 1, 1, 4, 1, 'G2'); -- ICT207-G2 (MONTHE) 08h00-11h00
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 5, 5, 1, 5, 1, 'G1'); -- ICT201-G1 (NKONDOCK) 11h30-14h30
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 4, 4, 1, 6, 1, 'G2'); -- ENG203-G2 (MUSIMA) 15h00-18h00
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 9, 10, 1, 6, 1, 'G1'); -- FRA203-G1 (BIYONG) 15h00-18h00

-- Mercredi
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 2, 2, 1, 7, 1, 'G2'); -- ICT203-G2 (EONE) 08h00-11h00
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 6, 6, 1, 8, 1, 'G1'); -- ICT213-G1 (MOSSEBO) 11h30-14h30
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 7, 11, 1, 9, 1, 'G1'); -- ICT215-G1 (VIDEME) 15h00-18h00

-- Jeudi
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 3, 3, 1, 10, 1, 'G2'); -- ICT205-G2 (KWETTE) 08h00-11h00
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 7, 7, 1, 11, 1, 'G2'); -- ICT215-G2 (MBOUS) 11h30-14h30
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 8, 9, 1, 12, 1, 'G2'); -- ICT217-G2 (NKOUANDOU) 15h00-18h00

-- Vendredi
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 3, 3, 1, 13, 1, 'G1'); -- ICT205-G1 (KWETTE) 08h00-11h00
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 5, 5, 1, 14, 1, 'G2'); -- ICT201-G2 (NKONDOCK) 11h30-14h30
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 6, 12, 1, 15, 1, 'G2'); -- ICT213-G2 (EKONO) 15h00-18h00
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 9, 10, 1, 15, 1, 'G2'); -- FRA203-G2 (BIYONG) 15h00-18h00

-- Samedi
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 4, 4, 1, 16, 1, 'G1'); -- ENG203-G1 (MUSIMA) 08h00-11h00
INSERT INTO timetable (class_id, course_id, teacher_id, room_id, slot_id, semester_id, group_name) VALUES (1, 2, 8, 1, 17, 1, 'G1'); -- ICT203-G1 (SEVANY) 11h30-14h30

-- Setup some assignments so completeness check works
INSERT INTO teacher_courses (teacher_id, course_id, class_id) VALUES (1,1,1), (2,2,1), (3,3,1), (4,4,1), (5,5,1), (6,6,1), (7,7,1), (8,2,1), (9,8,1), (10,9,1), (11,7,1), (12,6,1);
