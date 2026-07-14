Opdracht hardware store (zie hardware_case.txt)

De voornaamste uitdaging bij deze opdracht is het vermijden van schaarse tabellen en dubbel opgeslagen data. Een product heeft kenmerken, maar deze zijn van een variabel aantal en kunnen al dan niet verplicht zijn obv de categorie waar het product in zit. Neem bijvoorbeeld de ports van een laptop: als je dit als string opslaat per product krijg je veel dubbele data, maar als je voor iedere soort port een kolom maakt wordt de data schaars en moeilijker uitbreidbaar. Ik heb hierom gekozen voor een EAV-patroon dat wel zo sterk mogelijk getypeerd is (zie ERD). In dit ontwerp is het mogelijk om met relationele integriteit de kenmerken van een product op te slaan, zowel als bij welke groep deze kenmerken horen. 

Bij de productgroepen is er sprake van een hiërarchie. Iemand zou bijv. willen weten onder welke subcategorieën een product valt of welke subcategorieën een productgroep heeft. Hiervoor heb ik gekozen voor een closure tabel (groep_tree). Door alle parent-child relaties op te slaan in een aparte tabel voorkom je dat meerdere self-joins moet uitvoeren bij het queryen van diepere lagen. Ook is het met dit design mogelijk voor een child om meerdere parents te hebben.

NB: db oorspronkelijk in mariadb, overgezet naar sql server mbv microsoft sql server migration assistant

Opdracht mhl:

Opschonen van een database uit de praktijk. De meest voorkomende problematiek was het ontbreken van foreign key constraints, orphaned records, inefficiënte datatypes. Ook was er een tabel met een normalisatieprobleem: er waren id's uit een andere tabel kommagescheiden opgeslagen in een kolom. Door middel van de recursieve query konden deze waardes eenvoudig naar een koppeltabel worden verplaatst.

