// IIT Institute of Software Design and Security
// FH JOANNEUM (fhj)
// Template for a Bachelor's and Master's thesis
// create PDF with 'typst compile thesis.typ'
// circled numbers: ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳ #text(1.3em)[③]
#import "chapters/global.typ": *

#import "chapters/glossary-definitions.typ": gls-entries
#register-glossary(gls-entries)
#show: make-glossary

#show: doc => thesis(
  logo: image("./figures/logo.svg", width: 32%),
  study: "msd",
  language: "en",
  title: "Optimizing Performance of Local AI Applications",
  subtitle: "Enhancing Offline Functionality Based on Hardware Constraints",
  supervisor: "Ing. DI Patrick Deininger BSc MSc", author: "Susanne Jandl",
  submission-date: "September 2025",
  abstract-ge: [
    #include "abstract_de.typ" 
  ], abstract-en: [
    #include "abstract_en.typ"
  ],
  keywords: ("chatbot", "RAG", "offline", "edge device", "Ollama"),
  show-list-of: ("listings", "tables", "figures"),
  biblio: bibliography("biblio.bib", style: "harvard-cite-them-right"),
  doc,
)

#include "./chapters/1-intro.typ"
#pagebreak()

#include "./chapters/2-related.typ"
#pagebreak()

#include "./chapters/3-background.typ"
#pagebreak()

#include "./chapters/4-concept.typ"
#pagebreak()

#include "./chapters/5-implementation.typ"
#pagebreak()

#include "./chapters/6-evaluation.typ"
#pagebreak()

#include "./chapters/7-conclusion.typ"
#pagebreak()

#include "./chapters/glossary.typ"
#pagebreak()

// Appendix (optional)
//    Will appear BEFORE the Bibliograhy and after the Glossary.
//    Alternatively, you might like the appendix AFTER the Bibliograhy.
//    In this case you have to put the 'include appendix..' - line from below
//    to near the end of file "lib.typ" ( just before the last closing "}" )
// #include "./chapters/appendix.typ"
// #pagebreak()
