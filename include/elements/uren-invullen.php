<!--Uren registratie voor mobiel -->
<section class="ac-container container-mob">
    <div>
        <input id="ac-0" name="accordion-1" type="checkbox" />
        <label class="uren-mob-invullen" for="ac-0"><img src="images/icons/uren-mob.png">Uren invullen</label>
        <article class="ac-small-mob">

            <h3>Uren bijwerken</h3>
            <form method="post">
                <!--Project keuze -->
                <select>
                    <option>Kies een project</option>
                    <option>Logtime</option>
                    <option>Pizza today</option>
                    <option>Malcom</option>
                </select>
                <!--Taak keuze -->
                <select>
                    <option>Taak</option>
                    <option>Fase4A</option>
                </select>
                <!--Datum van vandaag tonen -->
                <input type="date" id="input_01" placeholder="Datum" name="date" class="datepicker">
                <!--begintijd alleen cijfers mogelijk-->
                <input type="text" placeholder="00:00"  id="uren-klein">
                <p class="uren-tot">tot</p>
                <!--eindtijd alleen cijfers mogelijk-->
                <input type="text" placeholder="00:00"  id="uren-klein">
                <textarea placeholder="Omschrijving"></textarea>
                <input type="submit" class="bijwerken" value=" ">
            </form>
        </article>
    </div>
</section>