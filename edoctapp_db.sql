-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 18 sep. 2025 à 23:50
-- Version du serveur : 8.0.40
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `edoctapp_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_admin`
--

CREATE TABLE `api_admin` (
  `utilisateur_id` bigint NOT NULL,
  `role` tinyint(1) NOT NULL,
  `permissions` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_appelvocal`
--

CREATE TABLE `api_appelvocal` (
  `id` bigint NOT NULL,
  `appel_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rendezvous_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_assistantai`
--

CREATE TABLE `api_assistantai` (
  `id` bigint NOT NULL,
  `type_assistance` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_comptepatient`
--

CREATE TABLE `api_comptepatient` (
  `id` bigint NOT NULL,
  `dossier_patient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_consultationvideo`
--

CREATE TABLE `api_consultationvideo` (
  `id` bigint NOT NULL,
  `type_video` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rendezvous_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_docteur`
--

CREATE TABLE `api_docteur` (
  `utilisateur_id` bigint NOT NULL,
  `specialite` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planning` longblob,
  `nom_hopital_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_message`
--

CREATE TABLE `api_message` (
  `id` bigint NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_envoi` datetime(6) NOT NULL,
  `date_reception` datetime(6) DEFAULT NULL,
  `destinataire_id` bigint NOT NULL,
  `expediteur_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_ordonnance`
--

CREATE TABLE `api_ordonnance` (
  `id` bigint NOT NULL,
  `informations_types` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_validite` date NOT NULL,
  `docteur_id` bigint NOT NULL,
  `patient_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_paiement`
--

CREATE TABLE `api_paiement` (
  `id` bigint NOT NULL,
  `options_types` tinyint(1) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `date` datetime(6) NOT NULL,
  `statut` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_patient`
--

CREATE TABLE `api_patient` (
  `utilisateur_id` bigint NOT NULL,
  `profil` int DEFAULT NULL,
  `dossier_patient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `historique` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_rendezvous`
--

CREATE TABLE `api_rendezvous` (
  `id` bigint NOT NULL,
  `date` date NOT NULL,
  `heure` time(6) NOT NULL,
  `statut` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `docteur_id` bigint NOT NULL,
  `patient_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_utilisateur`
--

CREATE TABLE `api_utilisateur` (
  `id` bigint NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int DEFAULT NULL,
  `mail` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_utilisateur`
--

INSERT INTO `api_utilisateur` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `prenom`, `nom`, `age`, `mail`, `username`, `email`) VALUES
(1, 'pbkdf2_sha256$1000000$dfALvvhlDoIef4GqN5kTJH$PTyI0LU9X9/kMT2J9pwe+gLSqY6153KgGcL6fM/TBs8=', '2025-09-18 13:51:09.865849', 1, '', '', 1, 1, '2025-09-18 11:56:50.002125', 'Omar', 'Ngom', NULL, 'mr.omarngom@gmail.com', 'mr.omarngom@gmail.com', ''),
(2, 'pbkdf2_sha256$1000000$DPaMAoRAu0FVXAnhxW4UxX$C1y3+WaZjbGAL6xoqpmydp1FapQj4vZsELptxKdnQCA=', NULL, 0, '', '', 0, 1, '2025-09-18 14:12:06.685940', 'Mamadou', 'Ndiaye', 32, 'mamadou.ndiaye@gmail.com', 'mamadou.ndiaye@gmail.com', '');

-- --------------------------------------------------------

--
-- Structure de la table `api_utilisateur_groups`
--

CREATE TABLE `api_utilisateur_groups` (
  `id` bigint NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `api_utilisateur_user_permissions`
--

CREATE TABLE `api_utilisateur_user_permissions` (
  `id` bigint NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_utilisateur'),
(22, 'Can change user', 6, 'change_utilisateur'),
(23, 'Can delete user', 6, 'delete_utilisateur'),
(24, 'Can view user', 6, 'view_utilisateur'),
(25, 'Can add rendez vous', 7, 'add_rendezvous'),
(26, 'Can change rendez vous', 7, 'change_rendezvous'),
(27, 'Can delete rendez vous', 7, 'delete_rendezvous'),
(28, 'Can view rendez vous', 7, 'view_rendezvous'),
(29, 'Can add admin', 8, 'add_admin'),
(30, 'Can change admin', 8, 'change_admin'),
(31, 'Can delete admin', 8, 'delete_admin'),
(32, 'Can view admin', 8, 'view_admin'),
(33, 'Can add docteur', 9, 'add_docteur'),
(34, 'Can change docteur', 9, 'change_docteur'),
(35, 'Can delete docteur', 9, 'delete_docteur'),
(36, 'Can view docteur', 9, 'view_docteur'),
(37, 'Can add patient', 10, 'add_patient'),
(38, 'Can change patient', 10, 'change_patient'),
(39, 'Can delete patient', 10, 'delete_patient'),
(40, 'Can view patient', 10, 'view_patient'),
(41, 'Can add message', 11, 'add_message'),
(42, 'Can change message', 11, 'change_message'),
(43, 'Can delete message', 11, 'delete_message'),
(44, 'Can view message', 11, 'view_message'),
(45, 'Can add consultation video', 12, 'add_consultationvideo'),
(46, 'Can change consultation video', 12, 'change_consultationvideo'),
(47, 'Can delete consultation video', 12, 'delete_consultationvideo'),
(48, 'Can view consultation video', 12, 'view_consultationvideo'),
(49, 'Can add appel vocal', 13, 'add_appelvocal'),
(50, 'Can change appel vocal', 13, 'change_appelvocal'),
(51, 'Can delete appel vocal', 13, 'delete_appelvocal'),
(52, 'Can view appel vocal', 13, 'view_appelvocal'),
(53, 'Can add paiement', 14, 'add_paiement'),
(54, 'Can change paiement', 14, 'change_paiement'),
(55, 'Can delete paiement', 14, 'delete_paiement'),
(56, 'Can view paiement', 14, 'view_paiement'),
(57, 'Can add ordonnance', 15, 'add_ordonnance'),
(58, 'Can change ordonnance', 15, 'change_ordonnance'),
(59, 'Can delete ordonnance', 15, 'delete_ordonnance'),
(60, 'Can view ordonnance', 15, 'view_ordonnance'),
(61, 'Can add compte patient', 16, 'add_comptepatient'),
(62, 'Can change compte patient', 16, 'change_comptepatient'),
(63, 'Can delete compte patient', 16, 'delete_comptepatient'),
(64, 'Can view compte patient', 16, 'view_comptepatient'),
(65, 'Can add assistant ai', 17, 'add_assistantai'),
(66, 'Can change assistant ai', 17, 'change_assistantai'),
(67, 'Can delete assistant ai', 17, 'delete_assistantai'),
(68, 'Can view assistant ai', 17, 'view_assistantai');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL
) ;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'api', 'admin'),
(13, 'api', 'appelvocal'),
(17, 'api', 'assistantai'),
(16, 'api', 'comptepatient'),
(12, 'api', 'consultationvideo'),
(9, 'api', 'docteur'),
(11, 'api', 'message'),
(15, 'api', 'ordonnance'),
(14, 'api', 'paiement'),
(10, 'api', 'patient'),
(7, 'api', 'rendezvous'),
(6, 'api', 'utilisateur'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-09-18 11:54:06.205128'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-09-18 11:54:06.260018'),
(3, 'auth', '0001_initial', '2025-09-18 11:54:06.428397'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-09-18 11:54:06.467299'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-09-18 11:54:06.472562'),
(6, 'auth', '0004_alter_user_username_opts', '2025-09-18 11:54:06.478199'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-09-18 11:54:06.483125'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-09-18 11:54:06.484176'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-09-18 11:54:06.489499'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-09-18 11:54:06.494674'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-09-18 11:54:06.499573'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-09-18 11:54:06.517119'),
(13, 'auth', '0011_update_proxy_permissions', '2025-09-18 11:54:06.531801'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-09-18 11:54:06.537581'),
(15, 'api', '0001_initial', '2025-09-18 11:54:07.236396'),
(16, 'admin', '0001_initial', '2025-09-18 11:54:07.309178'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-09-18 11:54:07.320677'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-09-18 11:54:07.338406'),
(19, 'sessions', '0001_initial', '2025-09-18 11:54:07.361585');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bcf8ouczlkz9oegryg9didmbov9qxu1z', '.eJxVjEsOwiAUAO_C2hC-Ql267xnI4_GQqoGktCvj3ZWkC93OTObFAuxbCXunNSyJXZhkp18WAR9Uh0h3qLfGsdVtXSIfCT9s53NL9Lwe7d-gQC9jS155MQFad1Y5ejReuUQ6g7FekpAWo9RTEio7g8Y5UGQMuqyihi9n7w_UFTek:1uzF2T:o6M-tqyinz29pc3FW1SabxDPbDsI9DCoajtYS81Lu7c', '2025-10-02 13:51:09.873126'),
('eb61obpyk5md4ep7tjp30v4dime5cvm7', '.eJxVjEsOwiAUAO_C2hC-Ql267xnI4_GQqoGktCvj3ZWkC93OTObFAuxbCXunNSyJXZhkp18WAR9Uh0h3qLfGsdVtXSIfCT9s53NL9Lwe7d-gQC9jS155MQFad1Y5ejReuUQ6g7FekpAWo9RTEio7g8Y5UGQMuqyihi9n7w_UFTek:1uzDJE:2fyGDqb3dB5XsXFAziDqwlxgZKvS6IJA0yiCRrBGhQc', '2025-10-02 12:00:20.455163');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_admin`
--
ALTER TABLE `api_admin`
  ADD PRIMARY KEY (`utilisateur_id`);

--
-- Index pour la table `api_appelvocal`
--
ALTER TABLE `api_appelvocal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rendezvous_id` (`rendezvous_id`);

--
-- Index pour la table `api_assistantai`
--
ALTER TABLE `api_assistantai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_assistantai_patient_id_851f0ab3_fk_api_patie` (`patient_id`);

--
-- Index pour la table `api_comptepatient`
--
ALTER TABLE `api_comptepatient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_id` (`patient_id`);

--
-- Index pour la table `api_consultationvideo`
--
ALTER TABLE `api_consultationvideo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rendezvous_id` (`rendezvous_id`);

--
-- Index pour la table `api_docteur`
--
ALTER TABLE `api_docteur`
  ADD PRIMARY KEY (`utilisateur_id`);

--
-- Index pour la table `api_message`
--
ALTER TABLE `api_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_message_destinataire_id_8537de43_fk_api_utilisateur_id` (`destinataire_id`),
  ADD KEY `api_message_expediteur_id_4cd58fa6_fk_api_utilisateur_id` (`expediteur_id`);

--
-- Index pour la table `api_ordonnance`
--
ALTER TABLE `api_ordonnance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_ordonnance_docteur_id_4159e538_fk_api_docteur_utilisateur_id` (`docteur_id`),
  ADD KEY `api_ordonnance_patient_id_e0cc4c42_fk_api_patient_utilisateur_id` (`patient_id`);

--
-- Index pour la table `api_paiement`
--
ALTER TABLE `api_paiement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_paiement_patient_id_0e97e5c8_fk_api_patient_utilisateur_id` (`patient_id`);

--
-- Index pour la table `api_patient`
--
ALTER TABLE `api_patient`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD UNIQUE KEY `dossier_patient` (`dossier_patient`);

--
-- Index pour la table `api_rendezvous`
--
ALTER TABLE `api_rendezvous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_rendezvous_docteur_id_3c684b6c_fk_api_docteur_utilisateur_id` (`docteur_id`),
  ADD KEY `api_rendezvous_patient_id_801e0a6d_fk_api_patient_utilisateur_id` (`patient_id`);

--
-- Index pour la table `api_utilisateur`
--
ALTER TABLE `api_utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `api_utilisateur_groups`
--
ALTER TABLE `api_utilisateur_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_utilisateur_groups_utilisateur_id_group_id_1308bcb4_uniq` (`utilisateur_id`,`group_id`),
  ADD KEY `api_utilisateur_groups_group_id_fdf78c4b_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `api_utilisateur_user_permissions`
--
ALTER TABLE `api_utilisateur_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_utilisateur_user_per_utilisateur_id_permissio_61068701_uniq` (`utilisateur_id`,`permission_id`),
  ADD KEY `api_utilisateur_user_permission_id_69653c2f_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_api_utilisateur_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `api_appelvocal`
--
ALTER TABLE `api_appelvocal`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_assistantai`
--
ALTER TABLE `api_assistantai`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_comptepatient`
--
ALTER TABLE `api_comptepatient`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_consultationvideo`
--
ALTER TABLE `api_consultationvideo`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_message`
--
ALTER TABLE `api_message`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_ordonnance`
--
ALTER TABLE `api_ordonnance`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_paiement`
--
ALTER TABLE `api_paiement`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_rendezvous`
--
ALTER TABLE `api_rendezvous`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_utilisateur`
--
ALTER TABLE `api_utilisateur`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `api_utilisateur_groups`
--
ALTER TABLE `api_utilisateur_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `api_utilisateur_user_permissions`
--
ALTER TABLE `api_utilisateur_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_admin`
--
ALTER TABLE `api_admin`
  ADD CONSTRAINT `api_admin_utilisateur_id_48655818_fk_api_utilisateur_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `api_utilisateur` (`id`);

--
-- Contraintes pour la table `api_appelvocal`
--
ALTER TABLE `api_appelvocal`
  ADD CONSTRAINT `api_appelvocal_rendezvous_id_0536a78a_fk_api_rendezvous_id` FOREIGN KEY (`rendezvous_id`) REFERENCES `api_rendezvous` (`id`);

--
-- Contraintes pour la table `api_assistantai`
--
ALTER TABLE `api_assistantai`
  ADD CONSTRAINT `api_assistantai_patient_id_851f0ab3_fk_api_patie` FOREIGN KEY (`patient_id`) REFERENCES `api_patient` (`utilisateur_id`);

--
-- Contraintes pour la table `api_comptepatient`
--
ALTER TABLE `api_comptepatient`
  ADD CONSTRAINT `api_comptepatient_patient_id_7cb5e941_fk_api_patie` FOREIGN KEY (`patient_id`) REFERENCES `api_patient` (`utilisateur_id`);

--
-- Contraintes pour la table `api_consultationvideo`
--
ALTER TABLE `api_consultationvideo`
  ADD CONSTRAINT `api_consultationvide_rendezvous_id_96497562_fk_api_rende` FOREIGN KEY (`rendezvous_id`) REFERENCES `api_rendezvous` (`id`);

--
-- Contraintes pour la table `api_docteur`
--
ALTER TABLE `api_docteur`
  ADD CONSTRAINT `api_docteur_utilisateur_id_193c1da6_fk_api_utilisateur_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `api_utilisateur` (`id`);

--
-- Contraintes pour la table `api_message`
--
ALTER TABLE `api_message`
  ADD CONSTRAINT `api_message_destinataire_id_8537de43_fk_api_utilisateur_id` FOREIGN KEY (`destinataire_id`) REFERENCES `api_utilisateur` (`id`),
  ADD CONSTRAINT `api_message_expediteur_id_4cd58fa6_fk_api_utilisateur_id` FOREIGN KEY (`expediteur_id`) REFERENCES `api_utilisateur` (`id`);

--
-- Contraintes pour la table `api_ordonnance`
--
ALTER TABLE `api_ordonnance`
  ADD CONSTRAINT `api_ordonnance_docteur_id_4159e538_fk_api_docteur_utilisateur_id` FOREIGN KEY (`docteur_id`) REFERENCES `api_docteur` (`utilisateur_id`),
  ADD CONSTRAINT `api_ordonnance_patient_id_e0cc4c42_fk_api_patient_utilisateur_id` FOREIGN KEY (`patient_id`) REFERENCES `api_patient` (`utilisateur_id`);

--
-- Contraintes pour la table `api_paiement`
--
ALTER TABLE `api_paiement`
  ADD CONSTRAINT `api_paiement_patient_id_0e97e5c8_fk_api_patient_utilisateur_id` FOREIGN KEY (`patient_id`) REFERENCES `api_patient` (`utilisateur_id`);

--
-- Contraintes pour la table `api_patient`
--
ALTER TABLE `api_patient`
  ADD CONSTRAINT `api_patient_utilisateur_id_f7e57e38_fk_api_utilisateur_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `api_utilisateur` (`id`);

--
-- Contraintes pour la table `api_rendezvous`
--
ALTER TABLE `api_rendezvous`
  ADD CONSTRAINT `api_rendezvous_docteur_id_3c684b6c_fk_api_docteur_utilisateur_id` FOREIGN KEY (`docteur_id`) REFERENCES `api_docteur` (`utilisateur_id`),
  ADD CONSTRAINT `api_rendezvous_patient_id_801e0a6d_fk_api_patient_utilisateur_id` FOREIGN KEY (`patient_id`) REFERENCES `api_patient` (`utilisateur_id`);

--
-- Contraintes pour la table `api_utilisateur_groups`
--
ALTER TABLE `api_utilisateur_groups`
  ADD CONSTRAINT `api_utilisateur_grou_utilisateur_id_0caa6b93_fk_api_utili` FOREIGN KEY (`utilisateur_id`) REFERENCES `api_utilisateur` (`id`),
  ADD CONSTRAINT `api_utilisateur_groups_group_id_fdf78c4b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `api_utilisateur_user_permissions`
--
ALTER TABLE `api_utilisateur_user_permissions`
  ADD CONSTRAINT `api_utilisateur_user_permission_id_69653c2f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `api_utilisateur_user_utilisateur_id_60df7149_fk_api_utili` FOREIGN KEY (`utilisateur_id`) REFERENCES `api_utilisateur` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_api_utilisateur_id` FOREIGN KEY (`user_id`) REFERENCES `api_utilisateur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
