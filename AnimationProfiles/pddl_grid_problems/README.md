# PDDL Grid Problems

Exploring the representation and visualisation of grid-based puzzles in [PDDL](https://en.wikipedia.org/wiki/Planning_Domain_Definition_Language) and [Planimation](https://planimation.planning.domains/). A project for [COMP30022](https://handbook.unimelb.edu.au/2023/subjects/comp30022).

<img src="https://prideout.net/blog/group_theory/Bloxorz.gif" alt="drawing" height="200"/>
<img src="https://upload.wikimedia.org/wikipedia/commons/4/4b/Sokoban_ani.gif" alt="drawing" height="200"/>

## Examples

A number of specific games and puzzles modelled in PDDL and Planimation. Documentation on each game can be found in the readme for each example.

## Installation & Usage

We use [editor.planning.domains](http://editor.planning.domains/) as our PDDL editor. To try out an example, use the 'Editor Session' link in each example's documentation. Alternatively, download the code and upload the files to a new editor session of your own.

### Quick links:

- [Bloxorz](examples/bloxorz)
- [Lights Out](examples/lights-out)
- [Sokoban](examples/sokoban)
- [Traffic Rush](examples/traffic-rush)

## Helper Scripts

Tools to assist in creating PDDL grid problem representations. Documentation on each tool is found in the respective tool's directory.

# Contributing

Active contributors:
- Liam Anthian
- Reuben Cook 
- Erich Huang
- Richele Maryanto
- Jakob Schuster

Contact us via the GitHub Discussions tab.

## Coding Standards

Practices we will generally follow:

- Hierarchically deeper code will be indented one tab (4 spaces) further in than its parent if spread across multiple lines.
- Opened code blocks that span across multiple lines will be closed with a lone bracket on its own line – this closing bracket at the same depth as the initial opening bracket.
- Predicate and action code will be indented such that all code in the following block is at the very least past this term.
- `:requirements` will be imported in the domain file below the main parent domain definition.
- Where possible, lines will be attempted to be kept at a suitable length - deemed 80 characters for now.
- We will keep predicates and actions defined in snake_case (chosen just for consistency) where possible. Some planimation features will require other specific formats (e.g. pos1_1) and these will be used strictly where necessary. It should also be noted that Planimation visual components are defined in camelCase and there isn't anything that can be done about this.
- Comments will be placed before each non-obvious action and large code block explaining the purpose and reasoning behind the changed predicates and states. Precondition justification should be present when logic not immediately clear.
