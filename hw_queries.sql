-- Welke groepen hoort een apparaat allemaal bij?
    SELECT
    pm.model_id,
    pm.merk,
    pm.model_naam,
    hg.naam AS groep_naam,
    t.depth AS lagen_hoger
FROM
    product_model pm
    JOIN groep_tree t ON pm.groep_id = t.descendant_id
    JOIN hardware_groep hg ON t.ancestor_id = hg.groep_id
WHERE
    pm.model_id = 7 -- Smartphones horen bij zowel computers als netwerk
ORDER BY
    t.depth ASC

-- Welke apparaten horen bij een groep?
    SELECT
    pm.model_id,
    pm.merk,
    pm.model_naam,
    hg.naam AS subgroep
FROM
    product_model pm
    JOIN hardware_groep hg ON pm.groep_id = hg.groep_id
    JOIN groep_tree t ON pm.groep_id = t.descendant_id
WHERE
    t.ancestor_id = 1; -- alle computers

-- Welke kenmerken horen bij een apparaat?
SELECT
    pm.merk,
    pm.model_naam AS [type],
    k.naam AS kenmerk,
    kos.waarde + CASE WHEN k.eenheid IS NULL THEN '' ELSE ' ' + k.eenheid END AS waarde
FROM
    product_model pm
    JOIN model_kenmerk_string mks ON pm.model_id = mks.model_id
    JOIN kenmerk k ON k.kenmerk_id = mks.kenmerk_id
    JOIN kenmerken_opties_string kos ON kos.kenmerk_optie_id = mks.kenmerk_optie_id;
    

-- Verplichte kenmerken van een groep incl. parentgroepen. De tree tabel is handig hiervoor, alle parentrelaties staan hierin.
SELECT 
    hg_parent.naam AS gedefinieerd_op_niveau,
    k.naam AS kenmerk_naam,
    k.datatype,
    k.eenheid,
    kos.waarde,
    kon.min,
    kon.max
FROM groep_tree t
JOIN groep_kenmerk gk ON t.ancestor_id = gk.hardware_groep_id
JOIN kenmerk k ON gk.kenmerk_id = k.kenmerk_id
JOIN hardware_groep hg_parent ON hg_parent.groep_id = gk.hardware_groep_id
LEFT JOIN groep_kenmerk_kenmerk_opties_num gkon ON gkon.groep_kenmerk_id = gk.id
LEFT JOIN kenmerken_opties_num kon ON kon.kenmerk_optie_id = gkon.kenmerk_optie_num_id
LEFT JOIN groep_kenmerk_kenmerk_opties_string gkos ON gkos.groep_kenmerk_id = gk.id
LEFT JOIN kenmerken_opties_string kos ON kos.kenmerk_optie_id = gkos.kenmerk_optie_string_id
WHERE t.descendant_id = 10 -- Mobile workstations, categorie laptops als parent
  AND gk.is_verplicht = 1
ORDER BY t.depth DESC;
