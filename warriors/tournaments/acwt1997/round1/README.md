# Round 1: Sorting

The objective of Round 1 was to write a sorting program in Redcode ('94 Draft).

## Rules

- Maximum program length: 100.
- The program should sort a list of items starting at location `ITEMLIST` in ascending order.
- The number of items to sort is `ITEMS`. Both `ITEMLIST` and `ITEMS` are defined externally to the program.
- The item list is appended directly to the end of the program when tested.
- `ITEMS` ranges from 0 to `CORESIZE / 2`.
- Each item is a (value, key) pair where the A-field contains the value and the B-field contains the key.
- Sorting is done using the key (0 to `CORESIZE - 1`).
- Entries were judged on size (initial program length), speed (cycles before termination), and correctness.

## Results

| Name | Score | Warrior | Length | Average Cycles |
| :--- | :---: | :--- | :---: | :---: |
| Brian Haskin | 8 | [Seaside sort](seaside.red) | 31 | 320,907 |
| Ilmari Karonen | 7 | [Bubbly Sort 1b](bubbly.red) | 10 | 13,505,607 |
| Mole IX | 5 | [Particle Sorter](particle.red) | 12 | 11,644,522 |
| Philipp Offermann | 4 | [PSort v1.0](psort.red) | 12 | 11,998,609 |
| Zul Nadzri | 3 | [Sort v1.5](sort15.red) | 20 | 9,066,053 |
| Robert Hale | 2 | [Consort](consort.red) | 15 | 27,968,360 |
| Christian Schmidt | 1 | [Sortidator](sortidat.red) | 31 | 68,427,233 |

### Notes

- **Brian Haskin**: Fastest program.
- **Ilmari Karonen**: Smallest program.
- **Zul Nadzri**: Doesn't work for `ITEMS == 0`.
- **Christian Schmidt**: Doesn't work for `ITEMS == 0` or `ITEMS == CORESIZE / 2`.
- **Robert Hale**: `Consort` required minor modifications to terminate and sort correctly.
