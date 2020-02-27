# Parasite Protein Release

All protein release assays are performed in 24-well tissue culture plates. The following numbers of parasites should be used:

  |Stage | Number per Well |
  |------|--------|
  |Adult |1       |
  |L3    |300     |
  |mf    |125k    |

Experiments typically are performed using a 24 hour incubation, after which media is removed and stored at -20°C.

## Adults

1. Upon receipt, adult parasites must be washed in fresh RPMI 1640 and incubated overnight in fresh complete media (RPMI 1640 + 10% FBS + P/S).

2. After overnight incubation, prepare a 24-well plate with 500 μL of warm incomplete media (RPMI 1640 + P/S) per well (**NOTE**: do **not** use FBS, as this will be picked up when later quantifying protein release).

2. Using a probe, forceps, or similar device, sort parasites individually into wells, taking care not to injure the worms or damage the cuticle. Damaged/injured parasites should be discarded. Return the plates to the 37°C incubator; it is imperative to make every effort to not allow the parasites to cool to room temperature.

3. Prepare 2X drug stocks. Generally, this means making 200X stocks in water, DMSO, or ethanol, and then performing a 1:100 dilution in sufficient volume of incomplete media (>500 μL per replicate). Warm the 2X stocks to 37°C prior to adding to the parasites.

4. Prepare a spreadsheet (`plate_design.csv`) that outlines the drug, concentration, and replicate number for each well of the 24-well plates. Use the following syntax: `DRG_10-3_1` where DRG is a three digit abbreviation for the drug, 10-3 is the concentration (10-3 is equal to 10^-3) and 1 is the replicate number.

5. Note the time in your lab notebook, and then add 500 μL of each drug stock to the proper well. If the protein release experiment is to be linked to motility analysis, immediately record the plate after adding the drugs before moving on to the next plate (see the [WormViz](../wormviz/wormviz.md) protocol for the protocol for video recording adult parasites). Return the parasites to 37°C.

6. After 24 hour incubation, record the plates if desired and prepare 1.5 mL tubes for media storage. Each tube should be labeled with the plate number (i.e. BmAF1) and the well (i.e. A1). The date should be written on the side of the tube.

7. It is difficult to remove all of the conditioned media without incidentally aspirating the worms themselves, so it is recommended to manually remove the worms before aspirating conditioned media. Parasites can be disposed, stored for RNA-seq/qPCR analysis, or stored for general cloning procedures.

8. After removing worms, aspirate all of the conditioned media (there should be >850 μL remaining) and transfer to the correct labeled tubes.

9. Store the media in a labeled box (species, life stage, treatments, date) in -20°C.

## L3 and mf

- Much of the protocol is same for larval worms, with the following changes:

  - Larvae should begin treatment on the day of receipt. Wash worms with incomplete media as described:

    - L3s can be washed by "settling" - allowing worms to sink to the bottom at room temperature.

    - Mf can be washed with a combination of syringe filters.

        1. Upon receipt, push mf through a 30 μm syringe filter (this filters out debris).

        2. Push the flow-through through a 5 μm. Do not force the media and worms through the filter, but use a new filter whenever you begin experiencing strong pressure against the syringe plunger.

        3. Transfer the filter to a Petri dish filled with 5-10 mL of warm incomplete media. Continue to add filters to the same dish.

        4. Use a pasteur pipette to gently free the mf from the filters. **NOTE**: many worms will remain stuck to the filter and are unable to be removed.

        5. Transfer clean mf to a 15 mL conical tube, and take three 0.5 μL aliquots for counting at 20X on the Zeiss Axioscope.

        - **NOTE**: we typically experience >50% loss during this washing protocol, so be sure to account for loss when initially planning the number of treatments and wells.

  - After washing, transfer the desired number of worms to a 24-well plate in 500 μL incomplete media per well.

  - Follow steps 3-9 in the adult protocol; remove worms in step 8 via settling of L3s or centrifuging mf for 2 minuts at 2000 x g.
