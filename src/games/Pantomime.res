let meta: Game.meta = {
  name: "Porno-Pantomime",
  url: "/#/porno-pantomime",
}

module Data = {
  let shuffledNames = Belt.Array.shuffle([
    `2001 Orgien im Weltraum`,
    `3 Schwengel für Charlie`,
    `Al Caporno`,
    `Alarm im Darm 1-4`,
    `Alfred Fistcock - Die vögeln`,
    `Alfred Fistcock – Die Vögeln`,
    `Alfred Fistcock – Die vögeln`,
    `Alice im Ständerland`,
    `Alice im Wonderbra `,
    `Aliens vs. Penetrator`,
    `Alte Schachteln frisch gebügelt`,
    `American Fickboxer`,
    `American Fistory XXX`,
    `Anal Total`,
    `Analdin und die wunde Schlampe`,
    `Analgeddon`,
    `Analien - das unbekannte Wesen aus einem fremden Bett`,
    `Analritter 2 – Heute wird eingedost`,
    `Analstufe Rot`,
    `Andere Länder, andere Titten`,
    `Animal Farm – Jetzt ficken wir Tiere`,
    `Arielle, die Nicht-mehr-Jungfrau`,
    `Auf Schloss Bumms klappern die Nüsse`,
    `Auf Schloss Bums klappern die Nüsse`,
    `Auf den Highway sind die Schlampen los`,
    `Auf der Liege der außergewöhnlichen Gentlemen`,
    `Aufstand in der Lederhose`,
    `Aus heiterem Pimmel`,
    `Ausgesaugt und blankgelutscht`,
    `Axel Fick und Obel Wichs`,
    `Babewatch`,
    `Baffy, die Dildojägerin`,
    `Bambi im Land der geilen Böcke`,
    `Bananenfick in Mosambik`,
    `Battlefield Ass`,
    `Beischlafes Bruder`,
    `Ben hurt`,
    `Bettmann`,
    `Bettmann - der dunkle Stecher`,
    `Beverly Hills Cock`,
    `Bienenstich im Lesbennest`,
    `Big Mama – Speckfalten in Wallung`,
    `Bin ich zu jung`,
    `Bitch – Der Fickdoktor`,
    `Black Cock Down`,
    `Blair Bitch Project`,
    `Blair Bitch Project`,
    `Blowing for Columbine`,
    `Bonnie in Clyde`,
    `Boschwanza`,
    `Brummi, sein Kolben läuft auch ohne Diesel`,
    `Chinese Dickstory (1-3)`,
    `Cockduel`,
    `Cocklateral damage`,
    `Cockzilla, Ein Riesenschwanz in New York`,
    `Darmageddon - nicht ins Gesicht!`,
    `Darmstadt - Hier findet der Verkehr im Darm statt`,
    `Das Besteigen der Lämmer`,
    `Das Fenster zum Hinterzimmer`,
    `Das Lustschloss am Venusberg`,
    `Das Sexperiment`,
    `Das Stöhnen der Lämmer`,
    `Das Todessperma des Dr. Mabumsen`,
    `Das Wunder im Bernd`,
    `Das Wunder von Bernd - dicker geht's nicht mehr`,
    `Das fickende Klassenzimmer`,
    `Das schwarze Loch`,
    `Der Club der roten Fister`,
    `Der Herr der Cockringe`,
    `Der Maler mit dem großen Pinsel`,
    `Der Mönch mit der Peitsche`,
    `Der Name der Hose`,
    `Der Name der Rosette`,
    `Der Pimmel kann warten`,
    `Der Pimmel soll warten`,
    `Der Pimmel über Berlin`,
    `Der Pimmel über Berlin`,
    `Der Sexorzist`,
    `Der Sexorzist`,
    `Der große Ficktator`,
    `Der kategorische Pimperativ von Immanuel Cunt`,
    `Deutschland sucht den Pornstar`,
    `Deutschland sucht den Superficker`,
    `Dickman (1+2)`,
    `Dickman Begins`,
    `Dickman& Robin`,
    `Die Fickinger`,
    `Die Prinzessin auf der Eichel`,
    `Die Reise zum G-Punkt der Elke`,
    `Die Schwanzwaldklinik`,
    `Die Schwanzwaldklinik`,
    `Die Sexen vom Eastfick`,
    `Die Stoßburg`,
    `Die Unbesteigbaren von hinten geknallt`,
    `Die Vögeln`,
    `Die Vögler`,
    `Die fabelhafte Welt der Analie`,
    `Die schlappe Schlange`,
    `Doctor Whore`,
    `Domina Day`,
    `Dornmöschen`,
    `Dr. Jekyll in Mrs. Hyde`,
    `Drei Enge für Charlie`,
    `Drei Schwengel für Charlie`,
    `Dune der Brüsteplanet`,
    `Dune, der Brüsteplanet`,
    `Edward mit den Penishänden`,
    `Ein Fick am Wörthersee`,
    `Ein Fuck kommt selten Alleine`,
    `Eine für alle, alle in einer`,
    `Eiskalte Schwengel`,
    `Es wird geschluck was in den Mund kommt`,
    `Feucht und Feuchter 2 – jetzt wirds spritzig`,
    `Feuchte Schenkel im Cockpit`,
    `Fick und Fotzi`,
    `Fick und Fotzi im Bumsbomber nach Thailand`,
    `Fick-Bonbons – Jetzt wirds feucht im Mund`,
    `Fickendes Inferno`,
    `Ficket Nemo`,
    `Fickhof der Muschitiere`,
    `Ficki und die starken Männer`,
    `Ficki und die starken Männer`,
    `Ficki und die starken Schwängel`,
    `Ficky Mouse – Gay Crazy`,
    `Fist Club`,
    `Flesh Gordon`,
    `Flucht von Analtraz`,
    `Frau Antje verkauft auch Eichelkäse`,
    `Frau Wirtin bläst auch ohne Tuba`,
    `Frisch gefickt und abgemolken`,
    `Fuck Bill`,
    `Fuck me if you can`,
    `Fuck off – Im Körper des Feindes`,
    `Fuckzilla`,
    `Fummeln im Sturm (1-6)`,
    `Fäkalschlacht am Analschacht`,
    `Ganz gut im Bett aber ugly`,
    `Gaylien – Director’s Fuck`,
    `Gaywatch, Die Riesenschwänze von Malibu`,
    `Gaywatch, die Riesenschwänze von Malibu`,
    `Gay’s Anatomy`,
    `Germany’s Next Popmodel`,
    `Graf Porno bläst zum Zapfenstreich`,
    `Gutes Reiten, schlechtes Reiten`,
    `HELLRASIERT`,
    `Hairy Popper und der Feuerfick`,
    `Hairy Popper und der Gefangene von Arschpackan`,
    `Hairy Popper und der Orgasmus des Phoenix (erscheint 2007)`,
    `Hairy Popper und der Stab der Steifen`,
    `Hairy Popper und der Vollblutfick (erscheint noch später)`,
    `Hairy Popper und die Kammer des Schleckens`,
    `Harte Spiele`,
    `Heisse Länder – Dauerständer`,
    `Helicoptermann 2 – Die Rückkehr des Kreiselfickers`,
    `Helicoptermann 2 – ‚Die Rückkehr des Kreiselfickers‘`,
    `Herr der Penisringe`,
    `Highway to Möpse`,
    `Hitchhikers guide to the fucktasy`,
    `Homoland`,
    `Hotel Sodom – Analstufe Rot`,
    `House of Wixx`,
    `Hör mal wer da nagelt`,
    `I Am Leckend`,
    `I, Fickbot`,
    `Ich habs Kommen sehen`,
    `Ich war jung und brauchte das Geld`,
    `Ich weiß wer dich letzen Sommer gefickt hat`,
    `Ich weiß, wer Dich letzten Sommer gefickt hat`,
    `Im Kloster der 1000 Sünden`,
    `Im Land der RaketenSpermer`,
    `Im Wald und auf der Heidi 1-3`,
    `Im Wald wird hart geknallt`,
    `In 80 Tagen durch ganz Hinterfeld`,
    `In Diana Jones`,
    `In Diana Jones`,
    `In Diana Jones: Der Tempel des Hodens`,
    `In Diana Jones: The last Cuissade`,
    `In einem Loch vor unserer Zeit`,
    `Independence Gay`,
    `Inzestbauern vom Rammlerhof`,
    `Jack the Raper`,
    `Jag den Gollum in die Höhle!`,
    `Jane Blond – Casino Anal`,
    `Jane Blond – Der Arsch ist nicht genug`,
    `Jane Blond – Der Mann mit dem goldenen Schwanz`,
    `Jane Blond – Der Spion mit dem ich Liebe machte`,
    `Jane Blond – Goldficker`,
    `Jarhead – Willkommen im Bett`,
    `Jeanne d’Arsch`,
    `Jetzt bin ich alt und brauch immer noch Geld`,
    `Jurassic Porn`,
    `Kack ab Baby 2`,
    `Kapitän Arsch und seine geilen Piraten`,
    `Kaviar zum Frühstück`,
    `Kevin allein im Puff`,
    `King Dingeling und die blonde Frau`,
    `Kliterus Rex – Die Rückkehr der Urzeitmösen`,
    `Kompanie Huren 2: Trommelfeuer aus der Sackkanone`,
    `Kuck‘ mal wer da schluckt!`,
    `Kung Fu Fisting`,
    `König der Mösen`,
    `Lass die Enkel zwischen die Schenkel`,
    `Last Penis Standing`,
    `Lawrence von Analien`,
    `Liebling, ich habe die Kinder gefickt`,
    `Mac Geiler`,
    `Mad Maxxx auf Tinas Donnerkuppeln`,
    `Mann fickt Hund`,
    `Maria mag die Lena`,
    `Marry Poppins`,
    `Mighty Fucks`,
    `Mighty Fucks II – Die Superficker kehren zurück`,
    `Moby Fick – Im Arsch des Pottwals`,
    `Monstergurken überfallen die Schweiz`,
    `Monsters Of Cock – Das Schwanzfestival`,
    `Nackt Zerhackt und Angekackt`,
    `Nackt im Möseum`,
    `Nackte X`,
    `Neues vom Sündenhof`,
    `Never fuck alone`,
    `Octopussy`,
    `Ohne Bockschein darf kein Bock rein`,
    `Ohne Bockschein darf kein Bock rein!`,
    `Oma Rose – „98“, fickgeil und nicht totzukriegen`,
    `Oma Rose „98“ fickgeil und nicht tot zukriegen`,
    `Oma, fick mich ins Koma`,
    `One Night in Bangcock`,
    `One Night in Rüsseldorf`,
    `Opa, nicht nur dein Knie ist steif`,
    `Operation Delta Fick I- III`,
    `Oral, Oral, Oral!`,
    `Penispiraten auf Rektalrandale`,
    `Per Anhalter durch den Analfick`,
    `Peterchens Wichsfahrt`,
    `Petri Geil! Angelurlaub am Analsee`,
    `Pipi auf Karl-Heinz`,
    `Pipi im Puller-Puller-Land`,
    `Pissing in Action`,
    `Popeye, der Puffbesitzer`,
    `Porn Wars Periode I – Die dunkelbraune Bedrohung`,
    `Porn Wars Periode II – Anschiss der Klokrieger`,
    `Porn Wars Periode III – Die Rache der Spermien`,
    `Porn Wars Periode IV – Ein neuer Harem`,
    `Porn Wars Periode V – Das Spermium schlägt zurück`,
    `Porn Wars Periode VI – Die Rückkehr der Analritter`,
    `Pornocchio`,
    `Pornomon – Professor Eichel stopft den Rachen`,
    `Pornstar`,
    `Pulp Fickschön`,
    `Pulp Fickschön`,
    `Quasimodo und seine sieben Glocken`,
    `Rapunze - neu verwöhnt!`,
    `Rasierte Rentnerinnen wollens richtig`,
    `Rate mal wer beim Essen kommt`,
    `Reich mir den Stengel, du Bengel`,
    `Reinstecke Fuchs`,
    `Rex Dildo – Arschalarm auf der Akropolis`,
    `Ringmuskeln aus Stahl`,
    `Robin Cock – König der Stecher`,
    `RoboCock`,
    `Rock fort - Anruf genügt!`,
    `Rosette`,
    `Roundhouse Fick – Chuck im Rausch der Leidenschaft`,
    `Räuber Fotzenglotz`,
    `SEX AGE 2 -jetzt wird gespritzt`,
    `Sauerei auf der Bounty`,
    `Schamlos in Seattle`,
    `Scheidi und der Einöli`,
    `Scheiß am Stil`,
    `Schneeflittchen und die sieben Geilen`,
    `Schwanz der Vampire`,
    `Schwanz der Vampire`,
    `Schweinchen Fick`,
    `Schwester, bitte Kommen!`,
    `Schwänze & Partner`,
    `Schwänzel und Gretel`,
    `Sexcalibur`,
    `Sexy Island – Der Kampf ums nackte Überleben`,
    `Sexy Pirates – Hier wird nicht nur in See gestochen`,
    `Shaving Private Ryan`,
    `Shaving Ryan’s Privates`,
    `Sieben Tage, sieben Möpse`,
    `Sklave Pupsmuckel und der geile Meister Leder`,
    `Spermarella und die sieben Bukkakezwerge`,
    `Spermboat Willie`,
    `Sperminator`,
    `Spiel mir am Glied bis zum Tod`,
    `Spiel mir am Glied mit Kot`,
    `Spiel mir das Lied vom Glied`,
    `Sponge Bob Arschkopf`,
    `Stadt der Engen`,
    `Stadt der Engen`,
    `Stadt der Schwengel`,
    `Stanley Kuhficks – Cockwork Orange`,
    `Star Whores`,
    `Star Whores - das Pimperium schlägt zurück`,
    `Starfick – Popisode 1:“Das Impedium fickt zurück“`,
    `Steiß am Stiel`,
    `Steven Strings – Shiting`,
    `Stoß langsam (1-3)`,
    `Stoß langsam I- III`,
    `Stoß langsam I-III`,
    `Stoß langsam I–III`,
    `Strip langsam`,
    `Strip langsam`,
    `Swingapur`,
    `Sündbart der Seepfarrer`,
    `Tatsächlich … Lesben`,
    `Texas Chainfuck Massacre`,
    `The Ass-Team`,
    `The Fuck - Nebel der Lust`,
    `The Gay after Tomorrow`,
    `The Gays’s After`,
    `The Masturbator`,
    `The Oklahoma bumser`,
    `The Porn Identity`,
    `The Sperminator`,
    `The Texas Dildo Massacre`,
    `The Truman Po`,
    `The XXX-Men: Orgien`,
    `The XXX-Men: Vulvarine`,
    `Tittanic`,
    `Tittenherz von Pornelia Funke`,
    `Tokiobordel`,
    `Totgefickt am 4. Juli`,
    `Und täglich schmerzt die Murmel mir`,
    `Uranus is huge`,
    `V for Vagina`,
    `Vier Fäuste in Julia`,
    `Voll In‘ Arsch 1 bis 6`,
    `Von Mösen und Männchen`,
    `Von hinten verwöhnt`,
    `Whorehouse 13`,
    `Whores of the Worlds`,
    `Wichs-Men`,
    `Wicki und die starken Schwängel`,
    `Wixblumenstrauß`,
    `Wunderbare Welt des Schwellsaft`,
    `XXX-Men -Der letzte stand wieder`,
    `XXX-Men Ejakulation`,
    `Yellow Sexmachine`,
    `Zucht der Karibik: Hairy Man’s Chest`,
    `Zum Löten freigegeben`,
    `Zunge weg, ich furze.`,
    `iPop`,
    `xXx`,
  ])

  let numberOfRounds = Array.length(shuffledNames)
}

module Component = {
  open Emotion

  let main = css(`
    display: flex;
    justify-content: center;
    align-items: center;

    padding: 0 0.5rem;
  `)

  let name = css(`
    font-size: 2rem;
    text-align: center;

    ::before {
        content: '„';
        opacity: 0.5;
    }

    ::after {
        content: '“';
        opacity: 0.5;
    }
  `)

  @react.component
  let make = () => {
    let (round, setRound) = React.useState(_ => 1)

    let onNextRoundClick = _ => {
      if round < Data.numberOfRounds {
        setRound(succ)
      }
    }

    <div className=Shared.Styles.fullscreenContainer>
      <Header.Component name=meta.name round numberOfRounds=Data.numberOfRounds />
      <main className=main>
        <div className=name> {React.string(Data.shuffledNames[round - 1])} </div>
      </main>
      <footer className=Shared.Styles.footer>
        <button className=Shared.Styles.primaryButton onClick=onNextRoundClick>
          {React.string(`Nächste Runde`)}
        </button>
      </footer>
    </div>
  }
}
