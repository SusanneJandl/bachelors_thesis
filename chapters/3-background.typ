#set heading(numbering: "1.")

#import "global.typ": *

= #titles.background <cha:background>
// define and explain terms, add glossary
This chapter provides a theoretical foundation for understanding the technologies and approaches applied in this thesis.
It starts with a brief introduction to the key concepts and technologies used and provides information about tools, models and libraries used in the project.

== #titles.rag <sec:rag>

Necessary components for a RAG system are a vector store, an embedding model, and a Large Language Model (LLM) for text generation.
The vector store contains the additional information the LLM needs to generate answers for a specific topic in form of vectors.
The embedding model is used to convert data like text, or images into vectors and back.
The search engine of the vector store finds relevant information.
The LLM retrieves the matching information from the vector store together with the user query and generates an answer based on the provided information.
@fig:RAG visualizes the components of a RAG system that only uses text based information and how they interact with each other.

#figure(
      image("../figures/RAG.svg"),
    caption: flex-caption(
        [General overview of a RAG system with only text based information],
        [General overview of a RAG system with text based information],
    )
  )<fig:RAG>

Before using a RAG system, like in @fig:RAG, the information has to be prepared and stored in a *vector store*.
This thesis only uses text based information, but RAG systems can also use images or other data types.
First the text is split into smaller parts, called *chunks*.
An *embedding model* is necessary to convert the chunks into vectors, that can then be stored in the vector store.
When storing the vectorized chunks, an index is created to allow fast retrieval of the most relevant chunks for a given query.
The embedding model converts the user query into vectors and the search engine of the vector store finds the most relevant information.
The search result in form of vectors is then converted back into text by the embedding model.

In @fig:VScreation the process of creating a vector store is visualized.

#figure(
      image("../figures/VScreation.svg"),
    caption: flex-caption(
        [General overview of vector store creation],
        [General overview of vector store creation],
    )
  )<fig:VScreation>

Together with the user query, the information from the vector store is passed to the text generation model.
The task the text generation model has to perform, is to create an answer in proper language based on the information it receives from the vector store.
It is not necessary to fine-tune the text generation model for the specific topic, as the information is provided by the vector store.

A combination of using a fine-tuned model with RAG can improve the results even further but will decrease the flexibility of the system.
When using a text generation model without specific fine-tuning on the topic, it is easy to replace the vector store and use the same system for different topics or update information.

Due to the huge amount of available AI models for text generation, it can be very tricky to find the one that fits best for the specific purpose.
In _@subsec:textgen #titles.textgen _ the models used in this thesis are introduced.

RAG presents two main advantages over fine-tuning a pre-trained model.
Fine-tuning requires a labeled dataset, which can be expensive to build, and a fine-tuned model is prone to outdated knowledge.
Instead a RAG model can continuously accesses and retrieve up-to-date information. #cite(<Chaudhary:2024>)

== #titles.AImodels <sec:AImodels>

AI models are algorithms that can learn from data and make predictions or decisions based on that data.
The most known type of AI models are Large Language Models (LLMs), which are designed to understand and generate human language.

A huge variety of AI models exist, each designed for specific tasks and applications.
Besides the mentioned LLMs, the implementation for this thesis also uses embedding models, which are used to convert text into vectors.
There is also a translation model that is part of this work.
After a short general intorduction of the model types @subsec:thesismodels #titles.thesismodels gives relevant information about the implemented AI models.

=== #titles.textgen <subsec:textgen>

A text generation model is a type of generative AI models which is designed to produce coherent and contextually relevant content.
These models are typically based on natural language processing (NLP) techniques and are trained in text data to learn the patterns, grammar, and context required to generate humanlike text.
When these models are trained in huge sets of data and have been fed enough examples to be able to recognize and interpret human language or other types of complex data, then they are called Large Language Models (LLM) #cite(<Athanasios:2024>).

=== #titles.embedding <subsec:embedding>

Embedding models are a type of AI model that is designed to convert text into numerical vectors, which can be easily processed by machine learning algorithms.
These models capture the semantic meaning of text sections, allowing for more effective information retrieval and comparison.

=== #titles.transl <subsec:translation>

Translation models are a subset of text generation models, designed to convert text from one language to another.
These models are trained on parallel corpora, which consist of text pairs in different languages, enabling them to learn the mappings between languages.

=== #titles.thesismodels <subsec:thesismodels>

#figure(
  table(
    columns: (auto, auto, auto, auto, auto), inset: 10pt, fill: (x, y) =>
    if y == 0 { luma(240) }, stroke: gray, align: center,
    [*Type*], [*Name*], [*Source*], [*Size*], [*Usage*],
    [Text Generation], [llama3.2:3b], [Ollama], [~2,00 GB],[#titles.transl (@subsec:translation) #linebreak() final, and others],
    [Embedding], [all-minilm:22m], [Ollama], [45,00 MB],[langflow approach],
    [Embedding], [paraphrase-multilingual-MiniLM-L12-v2], [Hugging Face], [~0,47 GB],[final],
    [Translation], [opus-mt-de-en], [Hugging Face], [~1,02 GB],[final],
    [Translation], [opus-mt-en-de], [Hugging Face], [~0,28 GB],[final],
    [Text Generation], [llama3.2:3b-instruct-q8_0], [Ollama], [~3,40 GB],[validation, qunatization],
    [Text Generation], [llama3.2:3b-instruct-q5_0], [Ollama], [~1,90 GB],[validation, qunatization],
  ), caption: flex-caption(
    [The table lists all AI models with basic information about source and size, as well as where they are used in this thesis.],
    [AI Model Overview],
  ),
) <tab:thesismodels>

== #titles.finetuning <sec:finetuning>

Fine-tuning is the process of taking a pre-trained AI model—typically trained on a large, general-purpose dataset—and continuing its training on a smaller, task-specific dataset.
Unlike training from scratch, fine-tuning starts from a model that already understands broad patterns (e.g., language structure or visual features).
This second training phase allows the model to adjust its language understanding and generation capabilities to better suit specific topics.
The fine-tuning process requires a huge data set and considerable computational resources.
Compared to RAG, fine-tuning offers tighter integration and faster inference, but comes with the challenge of keeping models updated as information changes.

== #titles.quantization <sec:quantization>

Quantization is a model compression technique that converts an LLM from a high-precision data representation to a lower-precision data representation.
Quantization is an important process because reducing the number of bits required for each of a model's weights adds up to a significant decrease in its overall size.
Consequently, quantization produces LLMs that consume less memory, require less storage space, are more energy-efficient, and are faster. #cite(<Talamadupla:2024>).

In this thesis the effect of qunatization will be evaluated by using Ollama with the same models with different qunatization.
#cite(<Talamadupla:2024>, form:"prose") explains different types of qunatization.
As Ollama uses models in GGUF format, the process used for quantization is the so called k-quant system.

== #titles.huggingface <sec:huggingface>

Hugging Face is a widely-used open-source platform that provides tools and infrastructure for developing, training, and deploying machine learning models.
At its core, the platform offers a powerful Python library called transformers, which allows researchers and developers to access and apply state-of-the-art pre-trained models.

The platform also serves as a comprehensive ecosystem for machine learning development.
The Hugging Face Model Hub enables users to browse, download, and share pre-trained models across various domains.
This collaborative model-sharing system facilitates reproducibility and accelerates experimentation, particularly in academic research and prototyping.
In addition to models, Hugging Face provides access to thousands of datasets for model-training.

For deployment and experimentation, Hugging Face offers hosted APIs and an online demo environment called Hugging Face Spaces.
Spaces supports building and showcasing machine learning applications using various frameworks.

Overall, Hugging Face significantly lowers the barrier to entry for working with advanced machine learning models by providing modular, well-documented, and community-driven tools.

#cite(<Huggingface:2025>)

For this thesis Hugging Face was used to download models and retrieve knowledge in general.

== #titles.ollama <sec:ollama>

Ollama is a command-line tool and runtime environment designed to simplify and optimize the deployment and execution of large language models (LLMs) on local machines.
It enables users to run state-of-the-art models without relying on external APIs or cloud infrastructure.
Ollama allows seamless access to generative AI with minimal setup, making it especially useful in environments that require privacy, offline access, or resource control.

The platform provides an interface for interacting with LLMs via terminal commands or through local APIs.
Ollama abstracts away the complexity of managing model architectures, tokenizers, and backend hardware compatibility, allowing users to focus on experimentation and application design.

One of the core strengths of Ollama lies in its ability to work efficiently on consumer-grade hardware.
It leverages techniques such as quantization and optimized inference backends to reduce memory and compute requirements, enabling models to run on laptops and edge devices.

#cite(<Ollama:2025>)

For all chatbot approaches in this thesis Ollama is used for text generation.

== #titles.langflow <sec:langflow>

Langflow is a graphical interface tool and provides a no-code or low-code interface.
It is a front-end wrapper for the LangChain framework, which is a Python-based toolkit for building AI aplications.
Users can connect components such as prompt templates, document retrievers, vector databases and more through the intuitive drag-and-drop interface.
Alongside to various cloud platforms like OpenAI, Langflow supports Ollama as one of the LLM providers, that 
enables offline use.

#cite(<Langflow:2025>)