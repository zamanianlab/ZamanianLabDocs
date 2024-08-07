# C. elegans Lysis PCR
Lysis reactions for PCR input are most reliable when they are used immediately after lysing in the thermocycler. Plan accordingly to avoid prolonged incubation in the thermocycler or storage on ice/+4°C as this may inhibit PCR.

## Materials

- 2X Lysis Buffer
- 20 mg/mL Proteinase K
- PCR Strip Tubes and Caps
- Thermocycler
- Minicentrifuge
- GoTaq DNA Polymerase (Promega, Cat.# M3005)
- 5X GoTaq Buffer (Green or Colorless)
- dNTP Mix (10 mM)
- Primer pair for gene target (10 μM)
- Nuclease-free water


## Protocol

1. Prepare lysis solution by combining 98 μL of 2X Lysis Buffer (recipe below) with 2 μL of 20 mg/mL Proteinase K (PK).

    a. Prepare enough lysis solution for the number of lyses you want to carry out (6 μL per reaction).

2. Aliquot 6 μL of the lysis solution into each cap of an 8-tube strip cap.

3. Pick desired number of worms into each cap (3-5 worms per cap is recommended).

    a. Take care to not transfer too much bacteria to the lysis buffer when removing worms from the pick. Bacteria will inhibit the downstream PCR reaction. You can watch the pick in the cap through the microscope to make sure the worms come off and to monitor the transfer of bacteria.

    <img src="../img/Picking_into_cap.png" width="300" />

4. Place the caps onto an appropriately labeled strip tube. Spin down the worms into the 8-strip tube using the minicentrifuge. Double check that the worms made it to the bottom of the tubes and are not stuck on the tube walls or in caps.

5. Replace the flat 8-tube strip caps with domed 8-tube strip caps. This helps maintain proper temperature control of the sample in the SimpliAmp thermal cycler.

5. Place strip tube(s) in frost accumulated in the -80°C freezer and freeze for approx. 10 min.

6. Preheat the thermocycler with the following program (Lid set to 105°C):

    |  Time  | Temperature | Cycles |
    |--------| :-----------:|--------|
    | 1 hour | 60°C        | 1      |
    | 15 min | 95°C        | 1      |
    | Hold   | 6°C         | 1      |

    **Note:** Individual PCR tubes can and should be placed in each corner of the thermocycler heat block to ensure thorough and even heating across all samples.

7. When there is ~20 minutes left on the lysis, assemble your PCR master mix on ice. The master mix recipe will vary depending on the Taq polymerase being used in the PCR reaction. A sample table for GoTaq polymerase (Promega, Cat#M3001/M3005)

    a. Make enough master mix for the number of reactions you need plus 1 additional reaction (e.g. if you need to complete 8 reactions, make enough master mix for 9 reactions)

| Constituent      | [Stock]  | Volume Per 20 μL Rxn | [Final]  |
|------------------|--------|:------:|--------|
| Nuclease-free H<sub>2</sub>O   | -      | 9.5 μL | -      |
| 5X GoTaq Buffer  | 5X     | 4 μL   | 1X     |
| dNTPs            | 10 mM  | 0.4 μL | 0.2 mM |
| Forward Primer   | 10 μM  | 2 μL   | 0.1 μM |
| Reverse Primer   | 10 μM  | 2 μL   | 0.1 μM |
| GoTaq Polymerase | 5units/μL      | 0.1 μL | 0.5units      |
| **TOTAL**        | -      | 18 μL  | -      |

8. Add 18 μL of master mix to each tube and keep on ice until the lysis is completed.

9. When the lysis reaction is complete, gently mix and centrifuge the strip tube(s) to pull the contents to the bottom of the tube. Return the rxns to ice.

10. Add 2 μL of the lysis rxn to each corresponding PCR tube containing master mix. Keep the reactions on ice until the thermocycler is preheated.

    **Note**: Do NOT pool the lysis rxns prior to using as template for the master mix. This may increase the likelihood of PCR inhibition.

11. Thermocycler parameters may differ depending on the Taq polymerase used in the master mix. Run the following program on a thermocycler for Promega GoTaq polymerase:

|  Time  | Temperature | Cycles |
|--------|-------------|--------|
| 2 min      | 95ºC        | 1      |
| 30 s <br> 30 s <br> 1 min<sup>2</sup> | 95°C <br> Tm - 5ºC (42-65°C)<sup>1</sup> <br> 72°C | <br> 35 <br> <br>|
| 5 min      | 72ºC        | 1      |
| Hold       | 6°C         | 1      |

<sup>1</sup> Annealing temperature is primer pair specific and must be modified accordingly.

<sup>2</sup> An extension time of 1 min/kb is recommended. Cycling parameters may need to be adjusted depending on the length of the target being amplified.

### Recipe for 2X Lysis Buffer

1. Combine the following ingredients to a 100mL bottle:

    | Constituent      | Amount  | [Final]  |
    |------------------|---------|--------|
    | KCl              | 0.745 g | 100 mM |
    | Tris-HCl (pH 8.2)<sup>1</sup>   | 0.24 g  | 20 mM  |
    | MgCl<sub>2</sub> | 0.047 g | 5 mM   |
    | IGEPAL<sup>2</sup>           | 900 μL  | 0.9%   |
    | Tween 20<sup>2</sup>         | 900 μL  | 0.9%   |
    | Gelatin          | 20 mg   | 0.02%  |
    | Water |   Q.S to 100 mL |

    <sup>1</sup> pH is critical to the success of the lysis rxn and downstream PCR. A Tris-HCl pH 8 solution can be added to a final concentration of 20 mM in the final volumne of 100 mL OR powder Tris-HCl can be used but the pH of the final solution will need to be adjusted.

    <sup>2</sup> Tween 20 and IGEPAL are difficult to pipette, so you may choose to make a 50% solution in water and double the input amount.

2. Add a small stir bar to the bottle and mix with **low**, gentle heat until the gelatin is completely dissovled into the solution. 

3. Aliquot the 2X lysis buffer into 15 mL conical tubes each containing ~10 mL and store at -20°C. Please include the date (MM/DD/YY) of preparation on the tubes.


