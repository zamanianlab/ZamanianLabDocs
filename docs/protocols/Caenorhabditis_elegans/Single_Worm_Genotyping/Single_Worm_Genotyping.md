# *C. elegans* Lysis PCR

## Materials

- Lysis solution
- Thermocycler
- Minicentrifuge
- 20 mg/mL proteinase K

## Protocol

1. Prepare lysis solution by combining 98 μl of 2X Lysis Buffer (recipe below) with 2 μl of 20 mg/mL Proteinase K (PK).

    a. Prepare enough lysis solution for the number of lyses you want to carry out (6 μl per reaction).

2. Aliquot 6 μl of the lysis solution into each cap of an 8-tube strip cap.

3. Pick desired number of worms into each cap (3-5 worms per cap).

4. Put the caps onto an appropriately labeled strip of tubes. Spin down the worms into the 8-strip tube using the minicentrifuge.

5. Run the following program on a thermocycler:

|  Time  | Temperature | Cycles |
|--------|-------------|--------|
| 1 hour | 60°C        | 1      |
| 15 min | 95°C        | 1      |
| Hold   | 6°C         | 1      |

6. When there is about 20 minutes left on the lysis, set up your PCR master mix (number of reactions + 1):

| Constituent    | Stock  | Volume | Final  |
|----------------|--------|--------|--------|
| Lysis reaction | -      | 2      | -      |
| Forward primer | 10 μM  | 2      | 0.1 μM |
| Reverse primer | 10 μM  | 2      | 0.1 μM |
| dNTPs          | 2.5 mM | 1.6    | 0.2 mM |
| 5X Buffer      | 5X     | 4      | 1X     |
| Taq            | -      | 0.2    | -      |
| H<sub>2</sub>O | -      | 8.2    | -      |

7. Add 18 μL of master mix to each tube of a strip of tubes.

8. When the lysis is done, add 2 μL of the lysis to each reaction. Keep reactions on ice until the thermocycler is ready.

9. Run the following program on a thermocycler:

|  Time  | Temperature   | Cycles |
|--------|---------------|--------|
| 3 min  | 95°C          | 1      |
| 15 sec | 95°C          | -      |
| 15 sec | Primer Tm - 5 | 35     |
| 1 min  | 72°C          | -      |
| 5 min  | 72°C          | 1      |
| Hold   | 6°C           |        |

### Recipe for 2X lysis buffer

| Constituent      | Amount  | Final  |
|------------------|---------|--------|
| KCl              | 0.745 g | 100 mM |
| Tris (pH 8.2)    | 0.24 g  | 20 mM  |
| MgCl<sub>2</sub> | 0.047 g | 5 mM   |
| IGEPAL           | 900 μL  | 0.9%   |
| Tween 20         | 900 μL  | 0.9%   |
| Gelatin          | 20 mg   | 0.02%  |

- Add water to 100 mL

- **NOTE: Tween 20 and IGEPAL are difficult to pipette, so you may choose to make a 50% solution in water and double the input amount.**
