# Multivariate phenotyping of adult filarial parasites

## Materials
- RPMI-1640 (Sigma R8758)   
- Pen-Strep 10,000U/mL (Thermo 15140122)  
- Gentamicin 0.4 mg/µL (Sigma G1272-100ML)  
- FBS (Thermo 16000044)
- 24-well plates (Corning 3524)
- 96-well deep well plates (VWR 76210-518)
- 96-well plates used for ImageXpress (USA Scientific 5665-5180Q)
- 1.5 mL tubes
- TempPlate Sealing Film (USA Scientific 2921-0010)
- Tools for worm handling (i.e. probes, forceps)

## Equipment

37°C CO<sub>2</sub> incubator
WormViz
Eppendorf microcentrifuge
Sterile BSC
Eppendorf M4 repeater pipette
ImageXpress Nano (for quantifying microfilaria release)

## Protocol

### Day 1

1. On day of receipt, prepare 24-well plates with 750 μL complete media per well. Use the recipe from the [general parasits culture protocol](../General_Parasite_Culture/General_Parasite_Culture.md) without gentamicin. Ensure media and plates are warmed prior to parasite arrival.

2. Upon receipt, place the tubes of parasites in the 37°C CO<sub>2</sub> incubator. Parasites typically arrive cold and sluggish but will resume normal motility after 30-60 min. of incubation.

3. After parasites have warmed, transfer a single parasite to each well of the prepared 24-well plates. Return the plate to the incubator immediately after it is filled with parasites and note the time.

4. Video the parasites using the WormViz after the parasites have recovered from the transfer and cooling, about 1 hr after being return to the incubator.

    a. Align the WormViz camera and stage to the markings on the pillar.

    b. Set the red LEDs to the highest setting.

    c. Remove the lid from the plate and ensure well A01 is at the top left of the camera view.

    d. Record the video and back it up to the Seagate external drive and ResearchDrive.

    - Video parameters:

      - Time = 15 s.
      - Frame rate =  16 FPS
      - Format =
      - Brightness = 1000
      - Gain = 1000

### Day 2

5. Prepare new 24-well plates with the media of choice:

    - For most experiments (i.e., drug treatment or RNAi) this will be **incomplete** media (no serum).

    - If drug treatments are planned, prepare wells with 750 μL minus the amount of drug to be added. For exmample, add 675 μL if a 10X drug dilution is planned.

    - Use **complete** media for assay optimization. Using complete media will keep parasites healthier for longer but will negate the ability to quantify protein release.

6. Transfer parasites to the new plates ~23 hr after the noted time from Day 1. Keep the plates with conditioned media from females; discard the conditioned media from males.

7. Record on the WormViz at the 24 hr time point. If adding drug, follow the below steps. If not, return the plates to the incubator.

    a. Immediately after recording, transfer to the BSC and add drug at the desired dilution.

    b. Immediately record on the WormViz.

    c. Return to the incubator.

    d. Record videos again 1 hr after adding drug.

8. Transfer all the conditioned media from females to labelled 1.5 mL tubes.

9. Centrifuge the tubes for 5 min at 10,000 *x g*.

10. Discard 500 μL of the supernatant. Store the remainder (pellet of mf, should be ~200 μL) at 4°C.

### Days 3-5

11. Prepare new 24-well plates with the media of choice. Warm plates at 37°C.

    - For drug experiments, make 1X drug in **incomplete** media.

12. Record videos at the 48 hr mark.

13. Transfer parasites to new plates and return them to the incubator. Keep the plates with conditioned media.

14. Transfer all the conditioned media from females to labelled 1.5 mL tubes.

15. Centrifuge the tubes for 5 min at 10,000 *x g*.

16. Transfer 500 μL of the supernatant to a 96-well deep well plate, cover the plate with foil sealing film, and store at -80°C. Create a Google Spreadsheet with the arrangement of the samples (see [this example](https://docs.google.com/spreadsheets/d/136XA8yCzhY0h7fKNrcppDCZV97jnYLagD5qhwuxPzds/edit?usp=sharing)). Try to fill as much of these wells as possible by using the same plate for consecutive days.

17. For female conditioned media, store the pellet at 4°C. Discard the male conditioned media.

18. Repeat steps 11-18 for the entirety of the experiment.

### Downstream sample processing

- Follow the protocol for [quantifying protein release](../Protein_Release_Assay/Protein_Release_Assay.md).

- For mf pellets stored at 4°C, pipette to mix and transfer 50 μL to a 96-well plate used for the ImageXpress. Image the plate with the `microfilaria_count` protocol stored in the ImageXpress DB (complete ImageXpress instructions can be found [here](https://docs.google.com/document/d/1CLaqODDSfTY-3CK3ORyoiqtW7k7MVlBo8bqKmZStuCs/edit?usp=sharing)).
