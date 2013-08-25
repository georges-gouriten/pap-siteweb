-- création de la base et du schéma


-- TODO regarder les contraintes de foreign key

-- base
create database pap_siteweb;
use pap_siteweb;

-- table des catégories des types de consommation
create table categories (
    id int(11) not null primary key,
    nom_url varchar(60),
    nom varchar(255),
    description_courte text,
    description_longue text,
    parent int(11)
);

-- table des sites plateforme de pair à pair
create table sites (
    id int(11) not null auto_increment primary key,
    url varchar(2083),
    titre varchar(255),
    description text,
    categorie int(11) not null,
    note int(11)
);

-- table des étiquettes des sites
create table etiquettes (
    id int(11) not null auto_increment primary key,
    nom varchar(255),
    description text
);

-- tables des connexions entre étiquettes et sites
create table site_etiquettes (
    site int(11),
    etiquette int(11)
);


-- données

insert into categories (
    id, parent,     nom_url,        nom,            description_courte,
    description_longue
    ) 
values
    (
    1,  null,       'immobilier',   'Immobilier',   'Logements, bureaux, etc',
    'Vous avez de l\'espace ou cherchez de l\'espace. Le particulier au particulier est possible'
    ),
    (
    2,  1,          'bureaux',      'Bureaux',      'Espaces professionnels',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet sodales ligula, vitae hendrerit nibh. Proin rutrum nibh sed convallis mattis.'
    ),
    (
    3,  1,          'logements',    'Logements',    'Lieux de vie',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet sodales ligula, vitae hendrerit nibh. Proin rutrum nibh sed convallis mattis.'
    ),
    (
    4,  1,          'salles',       'Salles',        'Lieux de débauche',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet sodales ligula, vitae hendrerit nibh. Proin rutrum nibh sed convallis mattis.'
    ),
    (
    5,  1,          'stockage',     'Espaces de stockage',  'Garages, caves, etc',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet sodales ligula, vitae hendrerit nibh. Proin rutrum nibh sed convallis mattis.' 
    ),
    (
    6,  1,          'jardins',      'Jardins',              'Potagers, pelouse, etc',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sit amet sodales ligula, vitae hendrerit nibh. Proin rutrum nibh sed convallis mattis.'
    )
;

