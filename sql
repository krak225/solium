CREATE TABLE categorie (
    categorie_id INT PRIMARY KEY,
    categorie_nom VARCHAR(255),
    categorie_description TEXT,
    categorie_date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    categorie_statut ENUM('BROUILLON', 'VALIDE', 'SUPPRIME') DEFAULT 'VALIDE'
);

CREATE TABLE formation (
    formation_id INT PRIMARY KEY,
    formation_titre VARCHAR(255),
    formation_description TEXT,
    formation_date_debut DATE,
    formation_date_fin DATE,
    formateur_id INT,
    categorie_id INT,
    formation_date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    formation_statut ENUM('BROUILLON', 'VALIDE', 'SUPPRIME') DEFAULT 'VALIDE',
    FOREIGN KEY (formateur_id) REFERENCES formateur(formateur_id),
    FOREIGN KEY (categorie_id) REFERENCES categorie(categorie_id)
);

CREATE TABLE formateur (
    formateur_id INT PRIMARY KEY,
    formateur_nom VARCHAR(255),
    formateur_prenom VARCHAR(255),
    formateur_telephone VARCHAR(15),
    formateur_email VARCHAR(255),
    formateur_specialite VARCHAR(255),
    formateur_date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    formateur_statut ENUM('BROUILLON', 'VALIDE', 'SUPPRIME') DEFAULT 'VALIDE'
);

CREATE TABLE etudiant (
    etudiant_id INT PRIMARY KEY,
    etudiant_nom VARCHAR(255),
    etudiant_prenom VARCHAR(255),
    etudiant_telephone VARCHAR(15),
    etudiant_email VARCHAR(255),
    etudiant_date_naissance DATE,
    etudiant_date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    etudiant_statut ENUM('BROUILLON', 'VALIDE', 'SUPPRIME') DEFAULT 'VALIDE'
);

CREATE TABLE inscription (
    inscription_id INT PRIMARY KEY,
    etudiant_id INT,
    formation_id INT,
    inscription_date_inscription DATE,
    inscription_date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    inscription_statut ENUM('BROUILLON', 'VALIDE', 'SUPPRIME') DEFAULT 'VALIDE',
    FOREIGN KEY (etudiant_id) REFERENCES etudiant(etudiant_id),
    FOREIGN KEY (formation_id) REFERENCES formation(formation_id)
);
