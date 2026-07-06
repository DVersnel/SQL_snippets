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
    t.depth ASC;

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
    pm.model_naam 'type',
    k.naam kenmerk,
    CONCAT(kos.waarde, IFNULL(CONCAT(' ', k.eenheid), '')) waarde
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
JOIN groep_kenmerk gk ON t.ancestor_id = gk.id
JOIN groep_kenmerk_kenmerken_opties gkko ON gk.kenmerk_id = gkko.groep_kenmerk_id
LEFT JOIN kenmerken_opties_num kon ON gkko.kenmerken_opties_id = kon.kenmerk_optie_id
LEFT JOIN kenmerken_opties_string kos ON gkko.kenmerken_opties_id = kos.kenmerk_optie_id
JOIN kenmerk k ON gk.kenmerk_id = k.kenmerk_id
JOIN hardware_groep hg_parent ON gk.id = hg_parent.groep_id
WHERE t.descendant_id = 10 -- Mobile workstations, categorie laptops als parent
  AND gk.is_verplicht = TRUE
ORDER BY t.depth DESC;
