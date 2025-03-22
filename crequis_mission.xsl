<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <!--VARIABLES GENERALES DES DOCUMENTS HTML-->
    
    <!-- HEAD du document html -->
    <xsl:variable name="head">
        <head>
            <meta charset="utf-8"/>
            <title>Crequis mission</title>
            <style>
                * {
                box-sizing: border-box;
                }
                
                body {
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
                background-color: #fae2d6 ;
                }
                
                /* Style the side navigation */
                nav {
                height: 100%;
                width: 200px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #4f5b93 ;
                overflow-x: hidden;
                }
                
                /* Side navigation links */
                nav a {
                color: white;
                padding: 16px;
                text-decoration: none;
                display: block;
                }
                
                /* Change color on hover */
                nav a:hover {
                background-color: #fae2d6;
                color: #d6336c;
                }
                
                /* Style the content */
                .content {
                margin-left: 200px;
                padding-left: 20px;
                padding-right: 20px;
                align-content: center;
                }
                
                .content table {
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 20px;
                }
                
                .content a {
                color: #d6336c;
                text-decoration: none;
                }
                
                .content a:hover {
                color:#4f5b93;
                text-decoration: underline;
                }
                
                h1 {
                text-align: center;
                margin-right:200px;
                margin-left:400px;
                }
                
                h1, h2, h3 {
                color: #4f5b93;
                }
                
                #metadonnees {
                background-color: #4f5b93;
                color: white;
                padding: 20px;
                margin-left: 100px;
                margin-right: 100px;
                margin-bottom: 50px;
                box-shadow: -10px 10px 0px #d6336c;
                }
                
                #metadonnees h2, #metadonnees h3 {
                color: white;
                }
                
                th, td {
                width: 200px;
                word-wrap: break-word;
                }
                
                td, th, thead, caption {
                padding: 8px;
                }
                
                td{
                text-align: center;
                }
                
                caption {
                color:  #4f5b93;
                font-weight: bold;
                border-bottom: #4f5b93 solid 3px;
                }
                
                footer {
                background-color: #fae2d6;
                bottom: 0;
                padding: 10px 20px;
                text-align: center;
                z-index: 2; /* Pour qu'il passe au-dessus de la nav */
                width: 100%;
                position: relative;
                }
            </style>
            <!-- Script visionneuse IIIF -->
            <script src="https://openseadragon.github.io/openseadragon/openseadragon.min.js"></script>
            <!-- Styles pour la timeline -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis-timeline-graph2d.min.css" rel="stylesheet" />
            <!-- Bibliothèque JS timeline-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis-timeline-graph2d.min.js"></script>
        </head>
    </xsl:variable>
    
    <!-- NAVBAR-->
    <xsl:variable name="nav">
        <h1>La Mission Créqui Montfort (1904)</h1>
        <nav>
            <a href="./Accueil.html">Accueil</a>
            <xsl:for-each select="//TEI">
                <xsl:variable name="nom_lettre" select="concat('Lettre' , ' ', position())"/>
                <xsl:variable name="doc_lettre" select="concat('./Lettre',position(),'.html')"/>
                <a href="./{$doc_lettre}"><xsl:value-of select="$nom_lettre"/></a>
            </xsl:for-each>
            <a href="./Index.html">Index</a>
        </nav>
    </xsl:variable>
    
    <!-- FOOTER du document html -->
    <xsl:variable name="footer">
        <footer>
            <div>Ce site a été réalisé dans le cadre du projet <i>Crequi's Mission</i>.</div><br/>
            <!-- Lien vers le dépot github sous forme de logo -->
            <div>
                Dépôt GITHUB : 
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                    <a href="https://github.com/Melina-Conter/Crequis_mission_tei">
                        <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27s1.36.09 2 .27c1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8"/>
                    </a>
                </svg>
            </div>
            <!-- logo de l'Ecole des Chartes -->
            <div><img src="https://upload.wikimedia.org/wikipedia/commons/8/84/Logo_Ecole_nationale_des_Chartes_PSL.svg" height="40" alt="Logo_ENC"></img></div>
        </footer>
    </xsl:variable>
    
    
    <!-- Création des documents html -->
    <xsl:template match="/">
        <xsl:call-template name="page_index"/>
        <xsl:call-template name="lettres"/>
        <xsl:call-template name="accueil"/>
    </xsl:template>
    
    <!-- Structure de la page Index -->
    <xsl:template name="page_index">
        <xsl:result-document href="./out/Index.html" method="html" indent="yes">
            <html lang="fr">
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$nav"/>
                    <div class="content">
                    <xsl:call-template name="index_personnes"/>
                    <xsl:call-template name="index_lieux"/>
                    <xsl:call-template name="index_org"/>
                    <xsl:copy-of select="$footer"/>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    

    <!-- STRUCTURES DES DIFFERENTS INDEX -->
    
    <!-- INDEX DES PERSONNES -->
    <xsl:template name="index_personnes">
        <!--Table contenant les informations sur les personnes citées dans les lettres-->
            <table>
                <caption>
                    Index des personnes
                </caption>
                <!--Définition des colonnes-->
                <thead>
                    <tr>
                        <th scope="col">Nom complet</th>
                        <th scope="col">Rôle</th>
                        <th scope="col">Notice d'autorité</th>
                        <th scope="col">Citations dans le contenu des lettres</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="//listPerson/person">
                        <!--Variable contenant l'ID de la personne actuellement itérée -->
                        <xsl:variable name="currentID" select="./@xml:id"/>
                        <!--Variable contenant l'URL de la notice d'autorité de la personne actuellement itérée -->
                        <xsl:variable name="URL_notice">
                            <xsl:choose>
                                <xsl:when test="./idno[@type = 'wikidata']">
                                    <xsl:value-of select="concat('https://www.wikidata.org/wiki/',./idno)"/>
                                </xsl:when>
                                <xsl:when test="./idno[@type = 'bnf']">
                                    <xsl:value-of select="concat('https://data.bnf.fr/',./idno)"/>
                                </xsl:when>
                                <xsl:when test="./idno[@type = 'VIAF']">
                                    <xsl:value-of select="concat('https://viaf.org/fr/viaf/',./idno)"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                       
                    <tr>
                        <!--Nom de la personne itérée-->
                        <th scope="row" id="{$currentID}"><xsl:value-of select="./persName"/></th>
                        <!--Rôle de la personne itérée-->
                        <td><xsl:value-of select="./occupation"/></td>
                        <!--Lien vers la notice d'autorité de la personne itérée-->
                        <td><xsl:value-of select="upper-case(./idno/@type)"/> : <a href="{$URL_notice}"><xsl:value-of select="./idno"/></a></td>
                        <!--Nombre de citations de la personne itérée par lettre encodée-->
                        <td>
                            <xsl:if test="//TEI[text/body//persName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Crequi_28_02_1903'">
                                <xsl:variable name="nb_citations_lettre1" select="count(//TEI[1]//body//persName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre1.html?person={$currentID}" >Lettre du 28/02/1903</a> : cité <xsl:value-of select="$nb_citations_lettre1"/> fois. <br/>
                            </xsl:if>
                            <xsl:if test="//TEI[text/body//persName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Enlart_08_12_1904'">
                                <xsl:variable name="nb_citations_lettre2" select="count(//TEI[2]//body//persName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre2.html?person={$currentID}" >Lettre du 08/12/1904</a> : cité <xsl:value-of select="$nb_citations_lettre2"/> fois. <br/>
                            </xsl:if>
                            <xsl:if test="//TEI[text/body//persName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Enlart_15_12_1903'">
                                <xsl:variable name="nb_citations_lettre3" select="count(//TEI[3]//body//persName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre3.html?person={$currentID}" >Lettre du 15/12/1903</a> : cité <xsl:value-of select="$nb_citations_lettre3"/> fois.
                            </xsl:if>
                        </td>
                    </tr>
                   </xsl:for-each>
                </tbody>
              </table>
    </xsl:template>
    
    <!-- INDEX DES LIEUX -->
    <xsl:template name="index_lieux">
        <!--Table contenant les informations sur les lieux cités dans les lettres-->
        <table>
            <caption>
                Index des Lieux
            </caption>
            <!--Définition des colonnes-->
            <thead>
                <tr>
                    <th scope="col">Dénomination</th>
                    <th scope="col">Adresse</th>
                    <th scope="col">Géolocalisation</th>
                    <th scope="col">Notice d'autorité</th>
                    <th scope="col">Citations dans le contenu des lettres</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="//listPlace/place">
                    <!--Variable contenant l'ID du lieu actuellement itéré -->
                    <xsl:variable name="currentID" select="@xml:id"/>
                    <!--Variable contenant l'URL de la notice d'autorité du lieu actuellement itéré -->
                    <xsl:variable name="URL_notice">
                        <xsl:choose>
                            <xsl:when test="./idno[@type = 'wikidata']">
                                <xsl:value-of select="concat('https://www.wikidata.org/wiki/',./idno)"/>
                            </xsl:when>
                            <xsl:when test="./idno[@type = 'bnf']">
                                <xsl:value-of select="concat('https://data.bnf.fr/',./idno)"/>
                            </xsl:when>
                            <xsl:when test="./idno[@type = 'VIAF']">
                                <xsl:value-of select="concat('https://viaf.org/fr/viaf/',./idno)"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <tr>
                        <!--Nom du lieu itéré -->
                        <th scope="row" id="{$currentID}"><xsl:value-of select="./placeName"/></th>
                        <!--Adresse du lieu itéré -->
                        <td><xsl:value-of select="./location/address/addrLine"/></td>
                        <!--Coordonnées du lieu itéré si elles existent-->
                        <xsl:choose>
                            <xsl:when test=".//geo">
                                <td><xsl:value-of select=".//geo"/></td>
                            </xsl:when>
                            <xsl:otherwise>
                                <td></td>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!--Lien vers la notice d'autorité du lieu itéré-->
                        <td><xsl:value-of select="upper-case(./idno/@type)"/> : <a href="{$URL_notice}"><xsl:value-of select="./idno"/></a></td>
                        <!--Nombre de citations du lieu itéré dans les lettres encodées-->
                        <td>
                            <xsl:if test="//TEI[text/body//placeName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Crequi_28_02_1903'">
                                <xsl:variable name="nb_citations_lettre1" select="count(//TEI[1]//body//placeName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre1.html?person={$currentID}" >Lettre du 28/02/1903</a> : cité <xsl:value-of select="$nb_citations_lettre1"/> fois. <br/>                            </xsl:if>
                            <xsl:if test="//TEI[text/body//placeName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Enlart_08_12_1904'">
                                <xsl:variable name="nb_citations_lettre2" select="count(//TEI[2]//body//placeName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre2.html?person={$currentID}">Lettre du 08/12/1904</a> : cité <xsl:value-of select="$nb_citations_lettre2"/> fois. <br/>
                            </xsl:if>
                            <xsl:if test="//TEI[text/body//placeName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Enlart_15_12_1903'">
                                <xsl:variable name="nb_citations_lettre3" select="count(//TEI[3]//body//placeName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre3.html?person={$currentID}" >Lettre du 15/12/1903</a> : cité <xsl:value-of select="$nb_citations_lettre3"/> fois.
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>

    <!-- INDEX DES ORGANISATIONS -->
    <xsl:template name="index_org">
        <!--Table contenant les informations sur les oragnisations citées dans les lettres-->
        <table>
            <caption>
                Index des organisations
            </caption>
            <!--Définition des colonnes-->
            <thead>
                <tr>
                    <th scope="col">Dénomination</th>
                    <th scope="col">Notice d'autorité</th>
                    <th scope="col">Citations dans le contenu des lettres</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="//listOrg/org">
                    <!--Variable contenant l'ID du lieu actuellement itéré -->
                    <xsl:variable name="currentID" select="@xml:id"/>
                    <!--Variable contenant l'URL de la notice d'autorité du lieu actuellement itéré -->
                    <xsl:variable name="URL_notice">
                        <xsl:choose>
                            <xsl:when test="./idno[@type = 'wikidata']">
                                <xsl:value-of select="concat('https://www.wikidata.org/wiki/',./idno)"/>
                            </xsl:when>
                            <xsl:when test="./idno[@type = 'bnf']">
                                <xsl:value-of select="concat('https://data.bnf.fr/',./idno)"/>
                            </xsl:when>
                            <xsl:when test="./idno[@type = 'VIAF']">
                                <xsl:value-of select="concat('https://viaf.org/fr/viaf/',./idno)"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <tr>
                        <!--Nom de l'organisation itérée -->
                        <th scope="row" id="{$currentID}"><xsl:value-of select="./orgName"/></th>
                        <!--Lien vers la notice d'autorité de l'organisation itérée-->
                        <td><xsl:value-of select="upper-case(./idno/@type)"/> : <a href="{$URL_notice}"><xsl:value-of select="./idno"/></a></td>
                        <!--Nombre de citations de l'organisation itérée dans les lettres encodées-->
                        <td>
                            <xsl:if test="//TEI[text/body//orgName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Crequi_28_02_1903'">
                                <xsl:variable name="nb_citations_lettre1" select="count(//TEI[1]//body//orgName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre1.html?person={$currentID}" >Lettre du 28/02/1903</a> : cité <xsl:value-of select="$nb_citations_lettre1"/> fois. <br/>                            </xsl:if>
                            <xsl:if test="//TEI[text/body//orgName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Enlart_08_12_1904'">
                                <xsl:variable name="nb_citations_lettre2" select="count(//TEI[2]//body//orgName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre2.html?person={$currentID}" >Lettre du 08/12/1904</a> : cité <xsl:value-of select="$nb_citations_lettre2"/> fois. <br/>
                            </xsl:if>
                            <xsl:if test="//TEI[text/body//orgName[@ref = concat('#', $currentID)]]/
                                teiHeader/fileDesc/titleStmt/title = 'Enlart_15_12_1903'">
                                <xsl:variable name="nb_citations_lettre3" select="count(//TEI[3]//body//orgName[@ref = concat('#', $currentID)])"/>
                                <a href="./Lettre3.html?person={$currentID}" >Lettre du 15/12/1903</a> : cité <xsl:value-of select="$nb_citations_lettre3"/> fois.
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
    
    
    <!--STRUCTURE DES PAGES LETTRES -->
    <xsl:template name="lettres">
        <xsl:for-each select="//TEI">
            <xsl:variable name="doc_lettre" select="concat('./out/Lettre',position(),'.html')"/>
            <xsl:result-document href="{$doc_lettre}" method="html" indent="yes">
            <html lang="fr">
            <xsl:copy-of select="$head"/>
            <body>
            <xsl:copy-of select="$nav"/>
             
            <div class="content">
            <!--Métadonnées de la lettre-->
             <section id="metadonnees">
                 <!-- Date d'envoi -->
                 <h2>Métadonnées de la lettre</h2>
                 <h3>Expédition</h3>
                 <p>
                     Lettre envoyée le <xsl:value-of select=".//correspAction[@type='sent']/date"/> par 
                     <!-- Expéditeur.s -->
                     <xsl:choose> 
                         <xsl:when test="count (.//correspAction[@type='sent']/persName) > 1">
                             <xsl:value-of select=".//correspAction[@type='sent']/persName[1]"/> et <xsl:value-of select=".//correspAction[@type='sent']/persName[2]"/>.<br/>
                         </xsl:when>
                         <xsl:otherwise>
                             <xsl:value-of select=".//correspAction[@type='sent']/persName"/>.<br/>
                         </xsl:otherwise>
                     </xsl:choose>
                     <!-- Lieu d'expédition -->
                     Adresse d'expédition : 
                     <xsl:if test=".//correspAction[@type='sent']/placeName">
                         <xsl:value-of select=".//correspAction[@type='sent']/placeName"/>, 
                     </xsl:if>
                     <xsl:if test=".//correspAction[@type='sent']/address">
                         <xsl:value-of select=".//correspAction[@type='sent']/address/addrLine"/>, 
                     </xsl:if>
                     <xsl:value-of select=".//correspAction[@type='sent']/country"/>.
                 </p>
                 <!-- Destinataire -->
                 <h3>Réception</h3>
                 <p>
                     Lettre reçue par <xsl:value-of select=".//correspAction[@type='received']/persName"/>.<br/>
                     <!-- Lieu de réception -->
                     Adresse de réception : 
                     <xsl:if test=".//correspAction[@type='received']/placeName">
                         <xsl:value-of select=".//correspAction[@type='received']/placeName"/>, 
                     </xsl:if>
                     <xsl:if test=".//correspAction[@type='received']/address">
                         <xsl:value-of select=".//correspAction[@type='received']/address/addrLine"/>, 
                     </xsl:if>
                     <xsl:value-of select=".//correspAction[@type='received']/country"/>.
                 </p>
                 <h3>Document physique</h3>
                 <p>
                     Conservation : <xsl:value-of select=".//repository"/>, <xsl:value-of select=".//settlement"/>, <xsl:value-of select=".//msIdentifier/country"/>.<br/>
                     Cote : <xsl:value-of select=".//msIdentifier/idno"/><br/>
                     Description physique du document : <xsl:value-of select=".//supportDesc/support"/>, <xsl:value-of select=".//supportDesc/extent"/>.
                 </p>
             </section>
             <section>
             <!-- contenu des lettres -->
                 <h2>Contenu des lettres</h2>
                 <xsl:apply-templates select=".//div"/>
             </section>
            <xsl:copy-of select="$footer"/>    
            </div>
                
                <!-- Script permettant l'affichage en évidence de l'entité indexée dans le corp de la lettre-->
                <!-- Malgré l'écriture du script qui utilise "person" pour l'entité, cela fonctionne aussi avec les lieux et organisations -->
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                    // Récupère l'ID de la personne depuis l'URL
                    const urlParams = new URLSearchParams(window.location.search);
                    const personId = urlParams.get('person');
                    
                    if (personId) {
                    // Sélectionner tous les éléments avec la classe correspondant à l'ID
                    const personElements = document.getElementsByClassName(personId);
                    
                    // Applique un style pour mettre en évidence les noms dans le contenu
                    for (let element of personElements) {
                    element.style.color = "#d6336c";        // Change la couleur
                    element.style.fontWeight = "bold";  // Met en gras
                    }
                    }
                    });
                </script>
            </body>
            </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="div">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Récupération du contenu du head lorsqu'il existe -->
    <xsl:template match="head">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- Récupération du contenu des balises opener et closer -->
    <xsl:template match="opener | closer">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- Récupération du contenu des balises p -->
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- Remplacement des balises persName, placeName et orgName par <i id="id"> -->
    <!-- Permet l'identification dans le texte en HTML des personnes, lieux et organisations et d'y appliquer un script -->
    <xsl:template match="persName | placeName | orgName">
        <!-- Lien vers le bon niveau de l'index -->
        <xsl:variable name="id" select="@ref"/>
        <xsl:variable name="class" select="substring-after(@ref, '#')"/>
        <a href="./Index.html{$id}">
             <i>
                 <xsl:attribute name="class">
                     <xsl:value-of select="$class"/>
                 </xsl:attribute>
                 <xsl:apply-templates/>
             </i>
        </a>
    </xsl:template>
    
    <!-- Transformation des listes TEI en listes HTML -->
    <xsl:template match="list">
        <ul>
            <xsl:apply-templates select="item"/>
        </ul>
    </xsl:template>
    
    <!-- Transformation des items -->
    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    
    
    <!-- STRUCTURE DE LA PAGE D'ACCUEIL -->
    <xsl:template name="accueil">
        <xsl:result-document href="./out/Accueil.html" method="html" indent="yes">
            <html lang="fr">
            <xsl:copy-of select="$head"/>
            <body>
                <xsl:copy-of select="$nav"/>
                <div class="content">
                <!-- Traduction et reprise de la présentation du "faux" projet XML TEI posté sur github -->
                <div>
                    <h2>Le projet Crequi's Mission</h2>
                    <p>Ce projet développe un schéma d'encodage XML conforme à la norme TEI pour les documents archivistiques conservés aux Archives nationales. Il se concentre sur les matériaux relatifs à la mission scientifique de 1904 dirigée par Georges de Créqui-Montfort en Amérique du Sud et sur les collections ethnographiques et archéologiques qu'elle a rassemblées. Les archives comprennent de la correspondance, notamment des lettres échangées entre les membres de la mission et le Ministère de l'Instruction publique et des Beaux-Arts, ainsi que des communications avec les conservateurs des musées parisiens.</p>
                    
                    <p>Les fichiers sources sont des transcriptions des lettres originales au format <code>.txt</code>. Leur encodage en XML TEI permet une représentation numérique structurée, offrant aux chercheurs la possibilité d'analyser les rôles des individus, des institutions, ainsi que la chronologie des événements liés à l'acquisition et à la répartition des collections. Les documents archivistiques couvrent la période 1903–1912, illustrant l'organisation, l'exécution de la mission et la gestion de ses artefacts, répartis dans les musées régionaux de France.</p>
                    
                    <h3>Fonctionnalités du projet</h3>
                    <ul>
                        <li>️ <strong>Fichiers sources</strong> : Lettres transcrites au format <code>.txt</code> et encodées en XML TEI.</li>
                        <li>📜 <strong>Document ODD</strong> : Un ODD TEI personnalisé définit le schéma, axé sur les éléments spécifiques à la correspondance.</li>
                        <li>🛠️ <strong>Schéma Relax NG</strong> : Généré à partir de l'ODD pour valider les documents encodés.</li>
                        <li>📚 <strong>Documentation</strong> : Des directives complètes pour l'encodage et l'utilisation du schéma.</li>
                        <li>📄 <strong>Encodages XML</strong> : Documents structurés de manière uniforme selon le schéma TEI personnalisé.</li>
                    </ul>
                    
                    <h3>Conception du schéma</h3>
                    <p>Le schéma est spécifiquement adapté pour l'encodage des lettres et l'identification des éléments clés tels que les lieux, les individus et les organisations impliqués dans la mission. Cette structure permet aux chercheurs de suivre les déplacements géographiques, d'analyser les rôles institutionnels et de mieux comprendre le contexte historique de la mission.</p>
                </div>
                
                <!--Timeline de la mission-->
                <div id="timeline">
                    <h2>Timeline de la mission et de sa correspondance</h2>
                </div>
                    
                
                <!-- Visionneuse IIIF pour intégrer la carte de l'itinéraire de la mission -->
                <div id="visioneuse">
                    <h2>L'Itinéraire de la mission</h2>
                    <p>Carte : "Ministère de l'Instruction publique. Mission G. de Créqui Montfort et E. Sénéchal de La Grange, 1903. Itinéraire général suivi par la mission [Document cartographique] / dressé par V. Huot".<br/>
                        Conservée à la BNF. Notice : <a href="https://catalogue.bnf.fr/ark:/12148/cb407199712">https://catalogue.bnf.fr/ark:/12148/cb407199712</a> .
                    </p>
                    <div id="_viewer" style="width: 100%; height: 800px;"></div>
                    <script>
                        var _viewer = OpenSeadragon({
                        id: "_viewer",
                        prefixUrl: "https://openseadragon.github.io/openseadragon/images/",
                        sequenceMode: true,
                        tileSources:['https://gallica.bnf.fr/iiif/ark%3A%2F12148%2Fbtv1b8443634z/f1/info.json',
                        
                        ],
                        });
                    </script>
                </div>
                
                <!-- Liste des lettres avec leur métadonnées -->
                <div>
                    <h2>Liste des lettres déjà encodées : </h2>
                    <xsl:for-each select="//TEI">
                        <xsl:variable name="num_lettre" select="position()"/>
                        <p>
                            <a href="./Lettre{$num_lettre}.html">Lettre <xsl:value-of select="$num_lettre"/></a> : 
                        </p>
                        <p>
                            Conservation : <xsl:value-of select=".//repository"/>, <xsl:value-of select=".//settlement"/>, <xsl:value-of select=".//msIdentifier/country"/>.<br/>
                            Cote : <xsl:value-of select=".//msIdentifier/idno"/><br/>
                            Description physique du document : <xsl:value-of select=".//supportDesc/support"/>, <xsl:value-of select=".//supportDesc/extent"/>.
                        </p>
                        <ul>
                            <li>Expéditeur : 
                                <xsl:choose> 
                                    <xsl:when test="count (.//correspAction[@type='sent']/persName) > 1">
                                        <xsl:value-of select=".//correspAction[@type='sent']/persName[1]"/> et <xsl:value-of select=".//correspAction[@type='sent']/persName[2]"/>.
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select=".//correspAction[@type='sent']/persName"/>.
                                    </xsl:otherwise>
                                </xsl:choose>
                            </li>
                            <li>Date d'envoi : <xsl:value-of select=".//correspAction[@type='sent']/date"/></li>
                            <li>Lieu d'expédition : 
                                <xsl:if test=".//correspAction[@type='sent']/placeName">
                                    <xsl:value-of select=".//correspAction[@type='sent']/placeName"/>, 
                                </xsl:if>
                                <xsl:if test=".//correspAction[@type='sent']/address">
                                    <xsl:value-of select=".//correspAction[@type='sent']/address/addrLine"/>, 
                                </xsl:if>
                                <xsl:value-of select=".//correspAction[@type='sent']/country"/>.
                                
                            </li>
                            <li>Destinataire : <xsl:value-of select=".//correspAction[@type='received']/persName"/>.</li>
                            <li>Lieu de réception : 
                                <xsl:if test=".//correspAction[@type='received']/placeName">
                                    <xsl:value-of select=".//correspAction[@type='received']/placeName"/>, 
                                </xsl:if>
                                <xsl:if test=".//correspAction[@type='received']/address">
                                    <xsl:value-of select=".//correspAction[@type='received']/address/addrLine"/>, 
                                </xsl:if>
                                <xsl:value-of select=".//correspAction[@type='received']/country"/>.
                            </li>
                        </ul>
                    </xsl:for-each>
                </div>
                <br/>
                <xsl:copy-of select="$footer"/>
                </div>
                
                <!--Script pour afficher la timeline-->
                <script>
                    var items = new vis.DataSet([
                    {id: 1, content: 'Mission Créqui Montfort', start: '1903-04-03', end: '1904-05-15', title:'(1903-04-03) - (1904-05-15)', style: 'background-color: #4f5b93; color: #ffffff; border-color: #4f5b93'},
                    <xsl:for-each select="//TEI//correspAction[@type = 'sent']">
                        {id: <xsl:value-of select="position() + 1"/>, 
                        content: 'Lettre <xsl:value-of select="position()"/>', 
                        start: '<xsl:value-of select="date/@when"/>',
                        title: '<xsl:value-of select="date/@when"/>',
                        style : 'background-color: #d6336c; color: white; border-color: #d6336c'},
                    </xsl:for-each>
                    ]);
                    
                    var container = document.getElementById('timeline');
                    var options = {
                    zoomable: true,
                    min: '1902-01-01',  // 🟢 Début de la plage d'affichage
                    max: '1905-12-31'   // 🔴 Fin de la plage d'affichage
                    };
                    
                    var timeline = new vis.Timeline(container, items, options);
                </script>
                
            </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    
</xsl:stylesheet>