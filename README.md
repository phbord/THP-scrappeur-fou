# THP-scrappeur-fou

## 1. Dark Trader
- récupère le cours de toutes les cryptomonnaies et les enregistre bien proprement dans un array de hashs
  - avec XPath extraire les 2 infos dont tu as besoin : le nom des crypto et leur cours
  - puts : pour afficher quelque chose à chaque récupération de données
  - Rappel: un hash s’initialise avec result = Hash.new et on y stocke des infos avec result['ta_key'] = 'ta_value'
  - étapes :
    1. Isoler les éléments HTML qui vont bien
    2. En extraire le texte et mettre ça dans un hash
    3. Réorganiser ce hash dans un array de plusieurs mini-hash
- __tests__ :
  - fonctionnement de base de ton programme (pas d'erreur ni de retour vide)
  - ton programme sort bien un array cohérent (vérifier la présence de 2-3 cryptomonnaies, vérifier que l’array est de taille cohérente...)

## 2. Mairie christmas
1. obtenir un __e-mail__ de la __mairie d'Avernes__ :
   - à partir de la page de cette dernière
   - (pas en partant du listing complet des mairies)
   - *get_townhall_email(townhall_url)*
2. récupère les __URLs__ de chaque __ville du Val d'Oise__
   - *get_townhall_urls*
3. chaque méthode marche séparément, imbrique les 2
   - enregistrer les données dans un array de hash
   - a = [{ "ville_1" => "email_1" }, ...]
4. __tests__ : même chose que pour l'exercice précédent

## 3. Cher député
- récupérer la liste complète des députés de France
  - first_name
  - last_name
  - email
- sortie : array de hashs
  - a = [{"first_name" => "Jean", "last_name" => "Durant", "email" => "jean.durant@assemblée.fr"}, {...}, ...]
- __tests__ : même chose que pour les exercices précédents