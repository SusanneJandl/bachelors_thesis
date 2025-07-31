# cited

# notes

## Abbasi_2024

Superpipeline: A Universal Approach for Reducing GPU Memory Usage in Large Models

### Comment

- refers to GPU use and better hardware

## Athanasios_2024

Development of an AI-Based System for Knowledge Specific Assistance

### Summary

creates own LLM and uses RAG with book as source

### Topic related

- training with only gpu for 5 days (from scratch), page 29
- RAG in project, page 30
- Biblio,page 57
  - 1 Hugging face

### General

- explain LLM, page 8
- explain quantization in LLM section, page 9
- Perplexity for evaluation page 9
- for background
  - explain RAG, page 11
  - explain programming languages???
    - might explain why use what
    - libraries  



## Barr_2024

SlicerChat: Building a Local Chatbot for 3D Slicer

### Topic related

### General

- take a look at evaluation, if needed, page 5 right

## Chaudhary_2024

Developing a Llama-Based Chatbot for DI/CD Question Answering: A Case Study at Ericsson

- 72 questions about CI/CD in company Cloud Radio Access Network
- measure correct, incorrect, partially correct
- use ensemble retriever (BM25) and embedding retrievers
- RAG for up-to-date info from workspaces
  - retriever selects subset of documents (initial filter)
  - reader (LLM) uses retrieved documents
  - query rewriting (increase time)
  - vs update every night (teams, confluence)
  - llm for query rewriting template
  - setup for experiment page 7, left
  - for evaluation, ground truth (QA) and retrieval answer comparison

### Topic related

- compare RAG and fine-tuning, page 1 right
- about splitters for embedding, page 4 left
- good explanation of RAG, page 6
- cosine similarity

## Fan_2024

A Survey on RAG Meeting LLMs: Towards Retrieval-Augmented Large Language Models

### Comments
- intro to RAG, page 1, 4 

### Topic related

- Retriever types, page 4 left (background info)


## Gao_2023
Retrieval augmented generation for large language models: A Survey

### Topic related

- RAG versions

## Golla_2024

Enhancing Student Engagement through AI-Powered Educational Chatbots: A
Retrieval-Augmented Generation Approach 

### Topic related
- RAG
- agents API

## Hossain_2024
On Handling AI Tasks in CPU with Low Latency and High Performance
### Topic related
- GPU and CPU comparison, different versions

## Ko_2024
Retrieval Augmented Generation for Document Query Automation using Open source LLMs

### Topic related

- similarity example: food, snack, book, page 3

## Kofler_2025
Coding mit KI: Das Praxisbuch für Softwareentwicklung
### Topic related
- LLM families, page 263
- hardware, page 265
- GPT4All, page 267
- Ollama, page 271 ff
- RAG, page 351 ff
- Embedding model, page 361
- cloud vs local 405

## Liu_2024
Optimizing RAG Techniques for Automotive Industry PDF Chatbots: A Case Study with Locally Deployed Ollama Models Optimizing RAG Techniques Based on Locally Deployed Ollama ModelsA Case Study with Locally Deployed Ollama Models

### Topic related

- a lot about RAG

## Lewis_2020

Retrieval augmented generation for knowledge-intensive nlp tasks

### General

- lt. Athanasios first mention of RAG

## Magnini_2025
Open-source small language models for personal medical assistant chatbots
### General
- evaluation, page 4

## Nezami_2024
Generative AI on the Edge: Architecture and Performance Evaluation
### General
- Evaluation, page 3

## Pandelea_2024
Towards resource‑aware dialogue systems and sentiment analysis

### Topic related

- Quantization, page 35
- Retrieval based dialogue system, page 43

## Parthasarathy_2024
The Ultimate Guide to Fine-Tuning LLMs from Basics to Breakthroughs: An Exhaustive Review of Technologies, Research, Best Practices, Applied
Research Challenges and Opportunities
### Topic related
- fine-tuning and rag, page 10ff
- trainer API, page 80

## Sakai_2025

Implementation and Evaluation of LLM-Based Conversational Systems on a Low-Cost Device

### Topic related

- not useful

## Sander_2025
ON ACCELERATING EDGE AI: OPTIMIZING RESOURCE-CONSTRAINED ENVIRONMENTS

### Topic related
- quantization, page 3

## Yee_2024
On-Device LLMs for SMEs: Challenges and Opportunities
### Topic related
- whole work relevant
## Zhang_2025

Cloud-free question answering from internal knowledge bases: Building an AI for drilling applications

### Topic related

- RAG explanation, page 43 bottom right
- why retrieval is important, page 33 middle left

# New Added

- Robertson_2009 (BM25)
- Ezzini_2023