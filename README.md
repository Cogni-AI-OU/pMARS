# pMARS - Portable MARS

[![License](https://img.shields.io/badge/license-GPL--2.0-blue.svg)](COPYING)
[![Discord](https://img.shields.io/discord/1085114757516034088?label=discord&logo=discord&logoColor=white)](https://discord.gg/SezcUMTXRZ)

**pMARS** (Portable Memory Array Redcode Simulator) is the official Core War simulator of the ICWS (International Core Wars Society) and the `rec.games.corewar` newsgroup. It serves as the standard test bed for new Redcode dialects and tournament styles.

Core War is a game where two or more programs (warriors) fight for control of a virtual computer's memory. Written in an assembly language called **Redcode**, these programs attempt to survive while causing their opponents to crash.

## ✨ Highlights

- **Multi-platform:** Portable C source code running on UNIX, Windows, Mac, and more.
- **Standards Compliant:** Implements the ICWS'94 Redcode standard while maintaining compatibility with ICWS'88.
- **Advanced Core Displays:** Graphical views of the simulation for X11, SDL, Curses, and DOS.
- **Powerful Debugger:** Full-featured, programmable debugger (`cdb`) for warrior development.
- **Optimized:** One of the fastest Redcode simulators available.
- **Extensible:** Supports multi-line EQUates, FOR/ROF text repetition, and P-space extensions.

## 🚀 Getting Started

### Prerequisites

To compile pMARS from source, you'll need a C compiler (GCC, Clang, or MSVC) and standard development tools.

### Building

Navigate to the `src` directory and use the provided Makefiles:

```bash
cd src
make
```

For specific platforms, specialized Makefiles are available:
- `Makefile.mingw` (Windows/MinGW)
- `Makefile.djg` (DOS/DJGPP)
- `Makefile.wat` (Watcom)
- `Makefile.clang` (Clang)

### Running

To start a battle between two warriors:
```bash
./pmars warrior1.red warrior2.red
```

## 📚 Documentation

Detailed documentation is available in the `doc` directory:
- [pMARS Guide](doc/guide.html) - Comprehensive HTML guide.
- [Redcode Reference](doc/redcode.ref) - Quick reference for Redcode syntax.
- [Core War FAQ](doc/corewar-faq.html) - Frequently Asked Questions.
- [CDB Primer](doc/primer.cdb) - Introduction to the built-in debugger.
- [ICWS'94 Draft](doc/primer.94) - Introduction to the '94 standard.

## 🛡️ License

pMARS is released under the GNU General Public License v2.0. See the [COPYING](COPYING) file for details.

## 🤝 Community & Resources

- **Homepage:** [koth.org/pmars](http://www.koth.org/pmars/)
- **Core War Information:** [corewar.co.uk](https://corewar.co.uk/)
  - [pMARS Page](https://corewar.co.uk/pmars.htm)
  - [Index of /pmars/](https://corewar.co.uk/pmars/)
- **SourceForge:** [pMARS Project](https://sourceforge.net/projects/corewars/)
- **Discord:** [#pmars-dev](https://discord.gg/SezcUMTXRZ)
- **IRC:** `#COREWARS` on [Libera.Chat](https://web.libera.chat/?channels=#corewars)
- **Newsgroup:** `rec.games.corewar`
- **Social Media:** [@xcorewar](https://x.com/xcorewar) on [𝕏](https://x.com/xcorewar), [Bluesky](https://bsky.app/profile/xcorewar.bsky.social), [Mastodon](https://mastodon.social/@xcorewar)
- **Mailing List:** [COREWAR-L](mailto:corewar-l@koth.org) (send `subscribe corewar-l` to `listproc@koth.org`)

## 🔬 Research & Studies

### [Digital Red Queen: Adversarial Program Evolution in Core War with LLMs](https://pub.sakana.ai/drq/)
- **Paper:** [arXiv:2601.03335](https://arxiv.org/abs/2601.03335)
- **GitHub Repository:** [SakanaAI/drq](https://github.com/SakanaAI/drq)
- **Optimized Implementation:** [dietmarwo/drq_fast_mars](https://github.com/dietmarwo/drq_fast_mars) (Improved performance via parallelization and optimized pMARS integration)

A 2026 study by researchers from Sakana AI and MIT exploring "Digital Red Queen" (DRQ), a self-play algorithm that uses LLMs and MAP-Elites to evolve Redcode warriors. The research demonstrates how adversarial "Red Queen" dynamics drive the emergence of robust, general-purpose behaviors and phenotypic convergence, positioning Core War as a rich, controllable sandbox for studying artificial evolution and adversarial adaptation.

## 🛠️ Contributing

Contributions are welcome! Please submit patches to [John Metcalf](mailto:digital.wilderness@googlemail.com) or join the Discord channel.
