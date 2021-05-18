# RestaurantRatingSystem-Django-Angular-

Possible Issues and Solutions

Issue -

"django.db.utils.OperationalError: (1055, "Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'rrs2.contribution.contribution_id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by") "

Solution -

    run below commands
        sudo mysql -u root -p
        SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
