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

## ⚔️ Warriors & Challenges

This repository includes a curated collection of Redcode warriors and specialized challenges:

- **[ICWS Warriors](warriors/)**: A comprehensive set of warriors for various standards (ICWS'88, ICWS'94, Nano, Tiny, etc.).

## 📚 Documentation

Detailed documentation is available in the `doc` directory:
- [pMARS Guide](doc/guide.html) - Comprehensive HTML guide.
- [Redcode Reference](docs/redcode-ref.txt) - Quick reference for Redcode syntax.
- [Core War FAQ](doc/corewar-faq.html) - Frequently Asked Questions.
- [CDB Primer](doc/primer.cdb) - Introduction to the built-in debugger.
- [ICWS'94 Draft](doc/primer.94) - Introduction to the '94 standard.

## 🛡️ License

pMARS is released under the GNU General Public License v2.0. See the [COPYING](COPYING) file for details.

## 🤖 Agents

- **CoreWars for Agents:** [modelwar.ai](https://modelwar.ai) ([Mirror](https://modelwar-delta.vercel.app)) - Online arena for autonomous agents.
  - [How to Play](https://modelwar.ai/how-to-play)
  - [Source Code](https://github.com/pj4533/modelwar)
- **Digital Red Queen:** [Adversarial Program Evolution in Core War with LLMs](https://pub.sakana.ai/drq/) - A self-play algorithm using LLMs and MAP-Elites to evolve Redcode warriors.
  - [Paper](https://arxiv.org/abs/2601.03335) | [GitHub](https://github.com/SakanaAI/drq) | [Optimized Implementation](https://github.com/dietmarwo/drq_fast_mars)
## 🤝 Community & Resources

- **Homepage:** [koth.org](http://www.koth.org/) ([Hills](http://koth.org/koth.html))
- **The Corewar Info Page:** [corewar.info](http://www.corewar.info)
- **Core War Information:** [corewar.co.uk](https://corewar.co.uk/)
  - [pMARS Page](https://corewar.co.uk/pmars.htm)
  - [Index of /pmars/](https://corewar.co.uk/pmars/)
  - [Corewar Hills](https://corewar.co.uk/datagram/hills.html)
  - [Core War History](https://corewar.co.uk/hist.htm)
    - [Timeline](https://corewar.co.uk/history.htm) - A brief history of key events and publications.
    - [Who's Who](https://corewar.co.uk/whoswho.htm) - Biographies of members of the Core War community.
    - [Hall of Fame](https://corewar.co.uk/hof.htm) and [Hill Logs](https://corewar.co.uk/logs.htm) - Records and activity from the KOTH.org hills.
    - [History of the 94 No Pspace Hill](https://corewar.co.uk/gutzeit/history/94nop.htm) by Jens Gutzeit.
    - [94 No Pspace Hill](http://www.koth.org/lcgi-bin/current.pl?hill94nop) - Current status of the standard '94 hill at KOTH.org.
    - [New Redcode Opcodes](https://corewar.co.uk/opcodes.htm) - A collection of 140 suggested enhancements to Redcode.
    - [Guerra nuclear: una batalla en tu ordenador](https://www.grafotema.com/agullo/articulos/guerra_nuclear.html) by Nacho Agulló - History of Core War in Spain.
    - [Core War History in Poland](https://corewar.co.uk/ryba/index.htm) by Adam Ryba and [Andrzej Stasiewicz](https://corewar.co.uk/stasiewicz/index.htm).
    - [Wojny rdzeniowe](https://grabun.pl/wr/) by Łukasz Grabuń - Transcripts of Core War articles from Enter magazine.
- **Christoph C. Birk's Corewar Page:** [asdflkj.net](https://asdflkj.net/COREWAR/corewar.html)
  - [Koenigstuhl Infinite Hills](https://asdflkj.net/COREWAR/koenigstuhl.html) ([Mirror](https://users.obs.carnegiescience.edu/birk/COREWAR/koenigstuhl.html))
- **Planar's Corewar Page:** [Planar](http://moscova.inria.fr/~doligez/corewar)
- **Philip Kendall's Core War Page:** [Philip Kendall](https://www.shadowmagic.org.uk/corewar/resource.html)
- **A.K. Dewdney's Home Page:** [A.K. Dewdney](http://www.csd.uwo.ca/faculty/akd/index.html)
- **KOTH@SAL:** [SAL](https://sal.discontinuity.info/)
- **Inversed's Corewar Page:** [Inversed](http://inversed.ru/CoreWar.htm)
- **Neo's World of Corewar:** [Neo](http://labarga.atspace.com/)
- **Corewar, Programming with Style:** [S. Fernandes](http://corewar.atspace.com/)
- **Corewar Hall of Fame:** [Hall of Fame](http://jan.ucc.nau.edu/~ns46/corewar/cwhof.htm)
- **SourceForge:** [pMARS Project](https://sourceforge.net/projects/corewars/)
  - [corewars 8086](http://sourceforge.net/projects/corewars8086)
- **Tutorials & Guides:**
  - [The Beginner's Guide to Redcode](http://corewar.co.uk/karonen/guide.htm) - Ilmari Karonen's classic introduction.
  - [pMARS Reference Guide](http://www.koth.org/info/pmars-redcode-94.txt) - Detailed reference for pMARS Redcode.
  - [Steven Morrell's Guide (Imps)](http://www.koth.org/info/chapter1.html) - Introduction to Imp-Rings.
  - [Steven Morrell's Guide (Stones)](http://www.koth.org/info/chapter2.html) - Introduction to Stone warriors.
  - [The Corewar Bibliography](http://corewar.co.uk/biblio.htm) - Extensive index of Core War articles.
  - [P-Key development](http://labarga.atspace.com/pkey_dev.html) - Analysis of a winning P-space warrior.
  - [CoreExplorer](http://corewar.co.uk/ce/ce001.txt) - Newsletter for beginners.
  - [TinyWarrior](http://corewar.co.uk/tw/tw01.txt) - Newsletter focused on tiny hills.
  - [Steve's Guide for Beginners](newsletters/sgb/) - Gentle introduction to Core War and Redcode.
  - [Push Off](newsletters/pushoff/) - Paul Kline's midweek review of Core War (1993-1994).
- **Other Simulators & Tools:**
  - [Extra Redcode Kit (XRK)](https://mark0.net/soft-xrk-e.html) - Development system for DOS by Marco Pontello.
  - [RedCoder 2](http://redcoder.sourceforge.net/?p=redcoder) - Graphical simulator and debugger.
  - [ARES](http://harald.ist.org/ares/) - Complete simulator and debugger by Harald Markus Wirth.
  - [exMARS](http://corewar.co.uk/ankerl/exmars.htm#intro) - Fast simulator with Ruby interface by Martin Ankerl.
  - [nMars](http://nmars.sourceforge.net/) - Graphical simulator and debugger for .NET by Pavel Šavara.
  - [Redcode Simulators](http://corewar.co.uk/mars.htm) - John Metcalf's collection of simulators.
  - [optiMAX](http://www.corewar.info/optimax/) - Core War optimizer by Sascha Zapf and Christian Schmidt.
  - [On-line Paper Generator](http://labarga.atspace.com/papgen/pg.htm) - Web-based tool to create paper warriors.
- **Discord:** [#pmars-dev](https://discord.gg/SezcUMTXRZ)
- **IRC:** `#COREWARS` on [Libera.Chat](https://web.libera.chat/?channels=#corewars)
- **Newsgroup:** `rec.games.corewar`
- **Social Media:** [@xcorewar](https://x.com/xcorewar) on [𝕏](https://x.com/xcorewar), [Bluesky](https://bsky.app/profile/xcorewar.bsky.social), [Mastodon](https://mastodon.social/@xcorewar)
- **Mailing List:** [COREWAR-L](mailto:corewar-l@koth.org) (send `subscribe corewar-l` to `listproc@koth.org`)

## 🔬 Research & Studies

The [Core Science](https://corewar.co.uk/science.htm) page maintained by John Metcalf provides an extensive collection of research and evolutionary studies.

### Core Science
- [Mathematical Models for Step Sizes](https://corewar.co.uk/morrell/cwmath.txt) by Steven Morrell - Illustration of the ideas behind Optima numbers.
- [A Numeric Approach to Diversity Hills](https://corewar.co.uk/astolfi/diversity.htm) by Achille Astolfi.
- [Categorizing Corewar Warriors](https://corewar.co.uk/tomasev/CategorizingCoreWarWarriors.ppt) by Nenad Tomašev and Doni Pracner.
- [Optima Numbers](https://corewar.co.uk/optima.htm) - Choosing bombing/scanning steps to effectively find opponents.

### Evolutionary Studies
- [Core Wars Genetics: The Evolution of Predation](https://corewar.co.uk/perry/evolution.htm) by John Perry - Early techniques to evolve competitive warriors.
- [Using Core War to Simulate Evolution](http://newton.freehostia.com/cwevol.html) by Terry Newton - Experiments with RedMixer and analysis of the evolver's source code.
- [Evolving Core Warriors](https://corewar.co.uk/hillis/evolving.txt) by Dave Hillis - Experiments with different techniques to improve performance.
- [The Garden: Evolving Warriors in Core Wars](http://www.angio.net/res/garden.html) by David G. Andersen.
- [An Evolutionary Approach Generates Human Competitive Corewar Programs](https://corewar.co.uk/vowk/alife9ac.pdf) by Barkley Vowk, Alexander Wait, and Christian Schmidt.
- [100% Evolved warrior on 94-nop](http://groups.google.com/group/rec.games.corewar/browse_frm/thread/82c3cb75a00ff483) - Barkley Vowk's announcement of the first completely evolved warrior to stick on the 94nop hill.
- [Assimilated evolution](https://corewar.co.uk/roosendaal/roosendaal-assimilated-evolution2.doc) by Loren Roosendaal - Defeating new strategies by exploiting predecessors.
- [Evolving Warriors](https://corewar.co.uk/thorsell/paper.htm) by Linus Thorsell.
- [Learning By Simulating Evolution Using Corewars](https://corewar.co.uk/coleman/index.htm) by Ryan Coleman.

### [Digital Red Queen: Adversarial Program Evolution in Core War with LLMs](https://pub.sakana.ai/drq/)
- **Paper:** [arXiv:2601.03335](https://arxiv.org/abs/2601.03335)
- **GitHub Repository:** [SakanaAI/drq](https://github.com/SakanaAI/drq)
- **Optimized Implementation:** [dietmarwo/drq_fast_mars](https://github.com/dietmarwo/drq_fast_mars) (Improved performance via parallelization and optimized pMARS integration)

A 2026 study by researchers from Sakana AI and MIT exploring "Digital Red Queen" (DRQ), a self-play algorithm that uses LLMs and MAP-Elites to evolve Redcode warriors. The research demonstrates how adversarial "Red Queen" dynamics drive the emergence of robust, general-purpose behaviors and phenotypic convergence, positioning Core War as a rich, controllable sandbox for studying artificial evolution and adversarial adaptation.
## 🛠️ Contributing

Contributions are welcome! Please submit patches to [John Metcalf](mailto:digital.wilderness@googlemail.com) or join the Discord channel.
