<section class="ac-container">
    <div>
        <!--bij de id van ac-1 haal je de id op van db bijvoorbeeld ac-2, ac-3 ect geld ook bij de label van for  ac-1-->
        <input id="ac-1" name="accordion-1" type="checkbox" />
        <label for="ac-1">Voortgang van het project Logtime<!--naam van project hier-->
            <div class="rechts-colum">
                <p class="totaal-uren">321 uren</p>
                <div class="progress">
                    <div data-percentage="0%" style="width: 50%;" class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p>75%</p>
            </div>
        </label>
        <article class="ac-small">
            <!-- hier begin leerlingen kaart -->
            <a href="#"> <div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Thiago van dieten</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 74%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>74%</p>
                    <div class="leerling-uren">
                        <h2>324</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>12 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>

            <a href="#"><div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Thiago van dieten</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 74%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>74%</p>
                    <div class="leerling-uren">
                        <h2>324</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>12 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>


            <a href="#"> <div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Fatih Celik</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 50%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>50%</p>
                    <div class="leerling-uren">
                        <h2>290</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>11 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>


            <a href="#">  <div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Dennis Eilander</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 45%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>45%</p>
                    <div class="leerling-uren">
                        <h2>300</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>13 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>


            <a href="#"> <div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Yannick Berendsen</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 60%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>60%</p>
                    <div class="leerling-uren">
                        <h2>314</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>18 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>


            <a href="#"><div class="leerling-kaart">
                    <img src="images/icons/alert.png" alt="Alert" title="Logboek lang niet bijgewerkt!" class="alert">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Phillip Heemskerk</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 66%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>66%</p>
                    <div class="leerling-uren">
                        <h2>320</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2 style="color: #e84c3d;!important">14 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>
            <!-- hier eindigt de leerlingen kaart -->

            <!-- Pie chart begint hier -->
            <div class="klas-stats">
                <div class="pie-chart">
                    <div class="pieID pie">

                    </div>
                    <ul class="pieID legend">
                        <li>
                            <em>Thiago van Dieten</em> <!-- Leerling naam ophalen van db -->
                            <span>324 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                        <li>
                            <em>Fatih Celik</em><!--Leerling naam ophalen van db-->
                            <span>290 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                        <li>
                            <em>Dennis Eilander</em><!--Leerling naam ophalen van db-->
                            <span>300 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                        <li>
                            <em>Yannick Berendsen</em><!--Leerling naam ophalen van db-->
                            <span>314 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                        <li>
                            <em>Phillip Heemskerk</em><!--Leerling naam ophalen van db-->
                            <span>320 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                    </ul>
                </div>
                <!--Pie chart eindigt hier-->

                <!--Voortgang begint hier-->
                <div class="voortgang-leerlingen">
                    <div id="canvas-holder">
                        <canvas id="chart-area" width="150" height="150"/></canvas>
                    </div>
                    <p><b>75%</b> <br /> voltooid</p><!--aantal % van de project voortgang ophalen begint hier-->
                    <div class="progress-project">
                        <!--Looptijd in elke als de einddatum naderdt dient dat in % te berekenen begin datum en eindatum -->
                        <div data-percentage="0%" style="width: 30%;" class="progress-bar-project progress-bar-success-project" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div> <!--voortgang % in width plaatsen-->
                    </div>
                    <div class="start-datum">
                        <b>Start</b><br />
                        19 sep 2016 <!--Startdatum van db ophalen-->
                    </div>
                    <div class="eind-datum">
                        <b>Eind</b><br />
                        24 sep 2017<!--Startdatum van db ophalen-->
                    </div>
                </div>
            </div>
            <!--Voortgang eindigt hier-->

</section>

</article>

<section class="ac-container">
    <div>
        <!--bij de id van ac-1 haal je de id op van db bijvoorbeeld ac-2, ac-3 ect geld ook bij de label van for  ac-1-->
        <input id="ac-1" name="accordion-1" type="checkbox" />
        <label for="ac-1">Voortgang van het project Logtime<!--naam van project hier-->
            <div class="rechts-colum">
                <p class="totaal-uren">321 uren</p>
                <div class="progress">
                    <div data-percentage="0%" style="width: 50%;" class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p>75%</p>
            </div>
        </label>
        <article class="ac-small">
            <!--hier begin leerlingen kaart-->
            <a href="#"> <div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Thiago van dieten</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 74%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>74%</p>
                    <div class="leerling-uren">
                        <h2>324</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>12 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>

            <a href="#"><div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Thiago van dieten</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 74%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>74%</p>
                    <div class="leerling-uren">
                        <h2>324</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>12 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>


            <a href="#"> <div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Fatih Celik</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 50%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>50%</p>
                    <div class="leerling-uren">
                        <h2>290</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>11 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>


            <a href="#">  <div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Dennis Eilander</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 45%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>45%</p>
                    <div class="leerling-uren">
                        <h2>300</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>13 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>


            <a href="#"> <div class="leerling-kaart">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Yannick Berendsen</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 60%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>60%</p>
                    <div class="leerling-uren">
                        <h2>314</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2>18 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>


            <a href="#"><div class="leerling-kaart">
                    <img src="images/icons/alert.png" alt="Alert" title="Logboek lang niet bijgewerkt!" class="alert">
                    <img src="images/avatar1.png" alt="avatar">
                    <h2>Phillip Heemskerk</h2>
                    <div class="stand-leerling">
                        <div class="progress-leerling">
                            <div data-percentage="0%" style="width: 66%;" class="progress-bar-leerling progress-bar-success-leerling" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <p>66%</p>
                    <div class="leerling-uren">
                        <h2>320</h2>
                        <p>uren</p>
                    </div>
                    <div class="leerling-datum">
                        <h2 style="color: #e84c3d;!important">14 sep 2014</h2>
                        <p>Laats geupdate</p>
                    </div>
                </div></a>
            <!--hier eindigt de leerlingen kaart-->

            <!--Pie chart begint hier-->
            <div class="klas-stats">
                <div class="pie-chart">
                    <div class="pieID pie">

                    </div>
                    <ul class="pieID legend">
                        <li>
                            <em>Thiago van Dieten</em> <!--Leerling naam ophalen van db-->
                            <span>324 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                        <li>
                            <em>Fatih Celik</em><!--Leerling naam ophalen van db-->
                            <span>290 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                        <li>
                            <em>Dennis Eilander</em><!--Leerling naam ophalen van db-->
                            <span>300 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                        <li>
                            <em>Yannick Berendsen</em><!--Leerling naam ophalen van db-->
                            <span>314 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                        <li>
                            <em>Phillip Heemskerk</em><!--Leerling naam ophalen van db-->
                            <span>320 </span><!--Totale uren van het project van leerling ophalen van db-->
                        </li>
                    </ul>
                </div>
                <!--Pie chart eindigt hier-->

                <!--Voortgang begint hier-->
                <div class="voortgang-leerlingen">
                    <div id="canvas-holder">
                        <canvas id="chart-area" width="150" height="150"/></canvas>
                    </div>
                    <p><b>75%</b> <br /> voltooid</p><!--aantal % van de project voortgang ophalen begint hier-->
                    <div class="progress-project">
                        <!--Looptijd in elke als de einddatum naderdt dient dat in % te berekenen begin datum en eindatum -->
                        <div data-percentage="0%" style="width: 30%;" class="progress-bar-project progress-bar-success-project" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div> <!--voortgang % in width plaatsen-->
                    </div>
                    <div class="start-datum">
                        <b>Start</b><br />
                        19 sep 2016 <!--Startdatum van db ophalen-->
                    </div>
                    <div class="eind-datum">
                        <b>Eind</b><br />
                        24 sep 2017<!--Startdatum van db ophalen-->
                    </div>
                </div>
            </div>
            <!--Voortgang eindigt hier-->
        </article>
</section>

