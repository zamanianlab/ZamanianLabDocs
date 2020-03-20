# *C. elegans* Population Chemotaxis Assays

## Materials

1. 10 cm chemotaxis plates (modified recipe from Bargmann 1993)

    a. Autoclave agar and water

    b. Add salt solutions

    c. Mix and pipette 10 mL per each 10 cm plate

    d. Allow to dry at least overnight

    | Constituent                  | Stock Concentration   | Amount Added   | Final Concentration   |
    |------------------------------|-----------------------|----------------|-----------------------|
    | Agar                         | NA                    | 5 g            | 2%                    |
    | CaCl<sub>2</sub>             | 1 M                   | 250 μL         | 1 mM                  |
    | KH<sub>2</sub>PO<sub>4</sub> | 1 M                   | 1250 μL        | 5 mM                  |
    | MgSO<sub>4</sub>             | 1 M                   | 250 μL         | 1 mM                  |
    | H<sub>2</sub>O               | NA                    | 248.25 mL      | NA                    |

2. Sodium azide

3. Cue and diluent (e.g. diacetyl or isoamyl alcohol and ethanol)

## Pre-assay preparation

1. Ensure enough chemotaxis plates are prepared - typically 5 technical replicates per strain.

    a. Label each plate with the strain name and plate number.

    b. Use a ruler and marker to mark a dot at the direct center of the bottom side of the plate and 5 mm from each opposite edge.

    c. Label each edge mark as either cue or diluent.

2. 4 days before assay day, pick 5 positive (if transgenic) worms to normal seeded 6 cm NGM plates.

    a. If you have 3 independent transgenic lines, pick 2 plates each of the highest transmitting lines and 1 plate of the lowest transmitting line.

## Assay protocols

1. Wash worms off of all 5 plates from each strain into a single 1.5 mL tube per strain.

    a. Add 1 mL M9 to the first plate, swirl, transfer to the next plate, and after the 5th plate pipette into the 1.5 mL tube (**NOTE**: this will mix independent lines of transgenic strains; alter washing protocol if you wish to maintain separation).

    b. Repeat with a second wash.

    c. After washing the worms into a a tube, set a timer for 2:15 and mix all the tubes with gentle rocking. Start the timer and wait for the adults to settle at the bottom of the tubes (the timing may be slightly modified in order to ensure you maintain all the adults while removing most of the larvae. **NOTE**: in order to get a consistent population of young adults, you will need to move quickly if you have several strains).

    d. After settling, remove most of the M9 and add 1 mL of fresh M9.

    e. Repeat c-d twice for a total of 3 M9 washes.

    f. Repeat c-d one more time, but this time add water instead of M9.

    g. After the water wash, remove all but ~50 uL of water.

2. While waiting for worms to settle during each wash, prepare the assay plates.

    a. Add 1 μL of sodium azide to the agar at each cue and diluent dot and leave plate lids slightly open to facilitate drying.

    b. After drying, quickly add 1 μL of cue to each cue dot and immediately put the lid on.

    c. After adding cues on all of the plates, do the same for the diluent.

3. Once all plates are prepared, resuspend settled worms and add 10 uL of worms to the center dot.

    a. The volume of worms added can be slightly adjusted based on the concentration of worms and the volume of water left after the final watch - the goal is to add 100-200 young adult worms to each plate.

    b. Ensure each plate has a roughly similar number of worms added to it.

4. After adding worms to the final plate, go back to the first place and use a strip of Kimwipe to gently wick away residual water from where the worms were added.

    a. If you have many plates, by the time you have added worms to the last plate the first plate may have dried, negating the need to use the Kimwipe.

    b. Try to organize the assay such that worms on each plate begin moving on the agar at roughly the same time.

5. After wicking water, if necessary use a worm pick to spread the worms out.

    a. Worms will tend to clump up even if dry.

    b. **IMPORTANT: flame the pick before moving to a plate that has a different strain in order to prevent strain contamination.**

6. Once worms on all plates are freely moving about, put each plate directly on the bench (do not stack) and set a timer for 60 minutes.

7. After 60 minutes, count the number of worms at each cue/diluent dot, and count the worms that are still freely moving about the plate.

    a. To maintain consistency, I set a Stemi microscope to 1.5X and arrange the plate on the stage such that I can see the entire group of paralyzed worms at the cue/control. I then count all the worms in view. I arrange the plate in the exact same way at the opposite end and count all the worms in view. Then I count all the worms not at the cue/control, taking care not to double count worms.

8. Store the data in a CSV file in (`ZamanianLab/Data/Chemotaxis/Celegans/{YourName}`) with the following format:

    |Date      | Strain | Cue      | Control | Cue_N | Control_N | Outside | Total | Notes    |
    |----------|--------|----------|---------|-------|-----------|---------|-------|----------|
    | 20181217 | N2     | Diacetyl | Ethanol | 24    | 4         | 18      |46     | 6 cm NGM |
    | 20181217 | N2     | Diacetyl | Ethanol | 22    | 1         | 4       |27     | 6 cm NGM |
    | 20181217 | N2     | Diacetyl | Ethanol | 37    | 0         | 5       |42     | 6 cm NGM |
    | 20181217 | N2     | Diacetyl | Ethanol | 35    | 6         | 10      |51     | 6 cm NGM |
    | 20181217 | N2     | Diacetyl | Ethanol | 14    | 3         | 3       |20     | 6 cm NGM |
    | 20181217 | CX10   | Diacetyl | Ethanol | 7     | 10        | 11      |28     | 6 cm NGM |
    | 20181217 | CX10   | Diacetyl | Ethanol | 13    | 2         | 11      |26     | 6 cm NGM |

9. Copy `ZamanianLab/Data/Chemotaxis/Celegans/Nic/ce_chemotaxis.R` into your personal data directory and use it to calculate the chemotaxis index (equation below) and plot the data.
$$
CI=\frac{Cue_N - Control_N}{Total_N}
$$
