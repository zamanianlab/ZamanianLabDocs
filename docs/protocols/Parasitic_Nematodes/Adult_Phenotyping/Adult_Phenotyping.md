# Multivariate phenotyping of adult filarial parasites

## Materials
- RPMI-1640 (Sigma R8758)   
- Pen-Strep 10,000U/mL (Thermo 15140122)  
- Gentamicin 0.4 mg/µL (Sigma G1272-100ML)  
- FBS (Thermo 16000044)
- Drug solutions
- 24-well plates (Corning 3524)
- 96-well deep well plates (VWR 76210-518)
- 96-well plates used for ImageXpress (USA Scientific 5665-5180Q)
- 1.5 mL tubes
- TempPlate Sealing Film (USA Scientific 2921-0010)
- Tools for worm handling (i.e. probes, forceps)

## Equipment

- 37°C CO<sub>2</sub> incubator
- WormViz
- Eppendorf microcentrifuge
- Sterile BSC
- Eppendorf M4 repeater pipette
- ImageXpress Nano (for quantifying microfilaria release)

## Protocol

### Day 1

1. On day of receipt, prepare 24-well plates with 750 μL complete media per well. Use the recipe from the [general parasite culture protocol](../General_Parasite_Culture/General_Parasite_Culture.md) without gentamicin. Ensure media and plates are warmed prior to parasite arrival.

2. Upon receipt, place the tubes of parasites in the 37°C CO<sub>2</sub> incubator. Parasites typically arrive cold and sluggish but will resume normal motility after 30-60 min. of incubation.

3. After parasites have warmed, transfer a single parasite to each well of the prepared 24-well plates. Return the plate to the incubator immediately after it is filled with parasites and note the time.

### Day 2 (Time points 0, 0.1, & 1)

1. Prepare new 24-well plates with the media of choice:

    - For most experiments (i.e., drug treatment or RNAi) this will be **incomplete** media (no serum).

    - If drug treatments are planned, prepare wells with 750 μL minus the amount of drug to be added. For example, add 675 μL if a 10X drug dilution is planned.

2. Prepare drug stocks at 10X concentration in RPMI. Keep warm.

3. Transfer parasites to the new plates ~23 hr after the noted time from Day 1 and return the parasites to 37°C to recover for ~1 hr. Keep the old plates with conditioned media from females (for mf quantification); discard the conditioned media from males.

    a. Transfer all the conditioned media from females to labelled 1.5 mL tubes.

    b. Centrifuge the tubes for 5 min at 10,000 *x g*.

    c. Discard 500 μL of the supernatant. Store the remainder (pellet of mf, should be ~200 μL) at 4°C.

4. Record on the WormViz immediately prior to adding drug. All videos are labeled in reference to the day upon which drug is added such that the 24 hr time point is 24 hours after drug addition (not after parasite receipt). Thus, this first video will be the 0 hr time point.

    a. Align the WormViz camera and stage to the markings on the pillar.

    b. Set the red LEDs to the highest setting.

    c. Remove the lid from the plate and ensure well A01 is at the top left of the camera view.

    d. Record the video

      - Video parameters:

        - Time = 15 s.
        - Frame rate = 16 FPS
        - Format = 1280 x 960
        - Brightness = 1000
        - Gain = 1000

    e. Immediately after recording, transfer to the BSC and add drug at the desired dilution.

    f. Immediately record on the WormViz.

    g. Return to the incubator.

    h. Record videos again after 1 hr incubation.

### Days 3-4 (Time points 24 & 48)

1. Prepare new 24-well plates with the media of choice. Warm plates at 37°C.

    - For drug experiments, make 1X drug in **incomplete** media.

2. Record videos at the 24 hr mark.

3. Transfer parasites to new plates and return them to the incubator. Keep the plates with conditioned media.

4. Transfer all the conditioned media from females to labelled 1.5 mL tubes (**Note:** male conditioned media does not need to be centrifuged).

5. Centrifuge the tubes for 5 min at 10,000 *x g*.

6. Transfer 500 μL of the supernatant (or conditioned media from males) to a 96-well deep well plate, cover the plate with foil sealing film, and store at -80°C. Create a Google Spreadsheet with the arrangement of the samples (see [this example](https://docs.google.com/spreadsheets/d/136XA8yCzhY0h7fKNrcppDCZV97jnYLagD5qhwuxPzds/edit?usp=sharing)). Try to fill as much of these wells as possible by using the same plate for consecutive days.

7. For female conditioned media, store the pellet at 4°C. Discard the remaining male conditioned media.

8. Repeat steps 1-7 on day 4.

### Downstream sample processing

- Follow the protocol for [quantifying protein release](../Protein_Release_Assay/Protein_Release_Assay.md).

- For mf pellets stored at 4°C, pipette to mix and transfer 50 μL to a 96-well plate used for the ImageXpress. Image the plate with the `microfilaria_count` protocol stored in the ImageXpress DB (complete ImageXpress instructions can be found [here](https://docs.google.com/document/d/1CLaqODDSfTY-3CK3ORyoiqtW7k7MVlBo8bqKmZStuCs/edit?usp=sharing)).

### Fecundity image analysis

1. Load the images from the entire plate into ImageJ as a stack.

2. Draw circle ROI and make sure it doesn’t contain the well rim for any images

3. Edit > Clear outside

4. Process > Find edges

5. Image > Adjust > Threshold (dark background, stack histogram) > Apply (unselect everything)

    - Manually choose a percentage on the histogram that maximizes segmented objects and minimizes background.

6. Process > Binary > Make binary (unselect everything)

7. Analyze > Set measurements (Only select area & limit to threshold)

8. Image > Stacks > Measure stack

9. Analyze data in R.

    **NOTE**: Worms that lay less than 200 mf (160,000 pixels) over the first day of recovery should be removed from all downstream data analysis
