//
// About the fh-joanneum-iit-thesis package used:
//

// Note 1:
//     following is an (indirect) import of the 'lib.typ' file
//     The file lib.typ (and others) will be downloaded and cached
//     by your system. The location of the @preview cache directory
//     is explained in
//     https://github.com/typst/packages?tab=readme-ov-file#downloads
//     e.g.  %APPDATA% on Windows on Windows
//           ~/.local/share or $XDG_DATA_HOME on Linux
//           ~/Library/Application Support on macOS
//
// Note 2:
//    If you like to modify "lib.typ", copy the file from the cache directory
//    or get it from the 'official' Typst Universe package git repo
//       (i.e. from proper 'version number subdir' of
//         https://github.com/typst/packages/tree/main/packages/preview/fh-joanneum-iit-thesis)
//    Copy the lib.typ to a (sub)folder of this project and
//    set the path accordingly.
#import "../lib.typ": *

// Anytime you might simply override custom macros, such as:
// #let quote(message, by) = {
//   block(
//         radius: 3em, width: 75%,
//         inset: (x: 2em, y: 0.5em),
//         [
//         #message,
//         #par(
//           first-line-indent: 15em,
//           text(font: "Inria Serif", size: 9pt, style: "italic", [
//           #by
//           ])
//         )
//         ]
//   )
// }

// Create your own custom format for being consistant in the text.
//
// E.g. format all file names monospaced: ./tmp/src/SecureMessage.py
#let filename(it) = text(font:"PT Mono", size: 10pt,it)
//
// E.g. format shell commands and command line tools: git, Python, curl
#let command(it) = [
  #set text(font:"PT Mono",size: 10pt, style: "oblique")
  #h(0.1em, weak: false)
  '#it'
  #h(0.3em, weak: true)
]


#let titles = (
  intro: "Introduction",
  problem: "Problem Statement",
  researchq: "Research Question",
  hypotheses: "Hypotheses",
  hypothesis1: "Hypothesis 1: Impact of Quantization on Performance",
  hypothesis2: "Hypothesis 2: Efficiency of OllamaSharp vs. Langflow vs. Ollama with Python",
  method: "Method",
  scope: "Scope and Limitations",
  structure: "Structure of the Thesis",
  related: "Related Work",
  background: "Background",
  rag: "RAG - Retrieval Augmented Generation",
  AImodels: "AI Models",
  modeltypes: "Types of AI Models",
  textgen: "Text Generation Models",
  transl: "Translation Models",
  embedding: "Embedding Models",
  thesismodels: "Models used for the implementation",
  finetuning: "Fine-Tuning",
  quantization: "Quantization",
  huggingface: "Hugging Face",
  ollama: "Ollama",
  langflow: "Langflow",
  concept: "Concept",
  langflowapproach: "Chat Widget with Langflow",
  csharpapproach: "OllamaSharp and Python.Included in C#",
  flaskapiapproach: "Flask API with C# User Interface",
  approachessummary: "Summary of Approaches",
  implementation: "Implementation",
  csharplangflow: "Langflow Workflow",
  csharppython: "Python Script",
  csharppythonincl: "Python.Included in C#",
  csharpollama: "OllamaSharp in C#",
  flaskapi: "Flask API",
  userinterface: "User Interface",
  imploverview: "Overview",
  evaluation: "Evaluation",
  conclusion: "Conclusion and Outlook",
  langflowoutput: "Langflow Output"
)

//
// Other packages used:
//

// See https://github.com/typst/packages/tree/main/packages/preview/glossarium
#import "@preview/glossarium:0.5.3": make-glossary, register-glossary, print-glossary, gls, glspl
#show: make-glossary
#set heading(numbering: "1.")