# Quantification of Secreted Protein in Conditioned Media

## Materials

- Conditioned media stored at -80°C
- AcroPrep Advance 0.2 μm Omega 96-well filter plate (VWR, 97052-124)
- AcroPrep Advance 3K Supor 96-well filter plate (VWR, 89135-696)
- 96-well deep well plate (VWR, 76210-518)
- Troughs
- PBS
- NanoOrange Assay Kit (Fisher, N6666)
- 96-well PCR plate
- Tin foil

## Equipment

- Eppendorf benchtop centrifuge
- SpectraMax I3x multi-mode plate reader
- SpeedVac (optional)
- 12-channel pipettes
- Thermocycler


## Protocol

[ThermoFisher](https://www.thermofisher.com/document-connect/document-connect.html?url=https%3A%2F%2Fassets.thermofisher.com%2FTFS-Assets%2FLSG%2Fmanuals%2Fmp06666.pdf&title=TmFub09yYW5nZSBQcm90ZWluIFF1YW50aXRhdGlvbiBLaXQ=) & [Molecular Devices](https://www.moleculardevices.com/en/assets/app-note/br/using-nanoorange-protein-kit-with-spectramax-microplate-readers#gref) reference material

### Protein Purification

1. Retrieve conditioned media from the -80°C freezer and thaw at room temperature.

2. If pooling is necessary, pool thawed samples into 1.7 mL tubes and evaporate on the SpeedVac at medium setting. Liquid will evaporate at ~500 μL per hour. Pool to <500 μL (the maximum input for the filter plates).

3. Load 500 μL of thawed conditioned media to a 0.2 μm filter plate on top of a **clean** deep well plate.

4. Centrifuge at 1500 x *g* for 1 min.

5. Transfer the flow-through to a 3K filter plate on top of a **used** deep well plate (i.e., the original plate from which the flow-through was taken).

6. Centrifuge at 3000 x *g* for 45 min.

7. Add 500 μL PBS to each well.

8. Centrifuge at 3000 x *g* for 45 min.

9. Use a p20 pipette to check multiple wells to ensure <20 μL remains in each well. If more than 10 μL remains, perform an additional 20-40 min. spin. If the liquid continues to have a pink tint, repeat the PBS wash.

### Protein quantitation

10. Thaw the NanoOrange protein quantitation reagent at room temperature and prepare the working solution. Wrap the tubes of working solution with foil.

    - For a single 96-well plate, prepare 20 mL of the working solution by combining 1.996 mL diluent, 17.964 mL of Milli-Q water, and 40 μL of NanoOrange reagent.

    - For 4 technical replicates of the standard curve, prepare 12 mL of the working solution by combining 1.198 mL diluent, 10.778 mL Milli-Q water, and 24 μL of NanoOrange reagent.

    - **Note:** It is important that you use at least 3 technical replicates (4 is best) for each concentration of the standard curve. We have seen R<sup>2</sup> values drop to ~0.7 when only using 2 replicates.

11. Create the standard curve by first preparing a 10 μg/mL stock by diluting 5 μL of the 2 mg/mL stock in 995 μL working solution. Then perform the following dilutions:

| BSA Volume    | Working Solution Volume    | Final BSA Concentration |
|---------------|----------------------------|-------------------------|
| 2000 μL       | 0 μL                       | 10 μg/mL                |
| 600 μL of 10  | 400 μL                     | 6 μg/mL                 |
| 300 μL of 10  | 700 μL                     | 3 μg/mL                 |
| 100 μL of 10  | 900 μL                     | 1 μg/mL                 |
| 60 μL of 10   | 940 μL                     | 0.6 μg/mL               |
| 30 μL of 10   | 970 μL                     | 0.3 μg/mL               |
| 10 μL of 10   | 990 μL                     | 0.1 μg/mL               |
| 60 μL of 1    | 940 μL                     | 0.06 μg/mL              |
| 30 μL of 1    | 970 μL                     | 0.03 μg/mL              |
| 10 μL of 1    | 970 μL                     | 0.01 μg/mL              |
| 0 μL          | 1000 μL                    | 0 μg/mL                 |

    - **Note:** the working solution is very sensitive to light, so working in the dark is optimal, and standard curve stocks should be protected from the light.

12. Using a multichannel pipette, add 200 μL of the working solution to each well of the 3K filter plate. Gently pipette up and down, and transfer to a 96-well PCR plate. Wrap the plate in foil when complete.

13. Place the PCR plate on a thermocycler and incubate at 95°C for 10 min.

14. While incubating, prepare the SpectraMax i3X.

    a. Turn on the instrument on the back of the machine.

    b. After the instrument has booted, start the SoftMax Pro software.

    c. Click the plate icon at the top left > Open. Navigate to `Desktop/Custom_Protocols` and open the NW_NanoOrange protocol.

    d. In the Document tab on the left side of the screen, click New Plate to add as many additional plates as necessary.

    e. For each plate, click the plate name on the left, click the template editor icon, and add the unknown samples and/or standards in the proper wells (don't bother filling in sample names for the unknowns).

    f. For the standards, include the proper Standard Value and include all replicates. Set the 0 μg/mL standards as Plate Blanks.

14. Cool the plate at room temperature in the dark for 20 min.

15. Use a multichannel pipette to transfer 180 μL from the PCR plate to a black microplate. Protect from light.

16. Eject the plate stage by pressing the eject icon on the i3X touchscreen. Insert the plate and press the button to load the plate.

17. In SpectraMax, click the green arrowhead icon to run the plate.

18. Examine the standard curve to ensure the assay ran properly. This assay is sensitive from 300 ng/mL to 10 μg/mL in our hands.

19. Export the data by clicking the plate icon on the top left of the screen, Export, Export to XML XLS TXT.

    a. Select a single plate, Raw, and Plate format; click OK.

    b. Navigate to `Desktop/Data/`, create a folder for the date, and name the file in YEARMTDY-p##-INI format (i.e., 20201209-p01-NJW)

20. Save the raw data by clicking the plate icon at the top left of the screen, Save As.

    a. Navigate to the date folder created above. Name the file with the date, and save as a Data Files (*.sda) type.
