#import "global.typ": *

= #titles.background <cha:background>
// define and explain terms, add glossary
In this chapter terms and concepts are introduced that are relevant for understanding this thesis.
The chapter starts with a brief introduction to the key concepts and technologies used and provides information about tools, models and libraries used in the project.

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
The embedding model converts the user query into vectors and the search engine of the vector store then finds the most relevant information.
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
When using a text generation model without specific fine-tuning on the topic, it is easy to replace the vector store and use the same system for different topics or just update information.

Due to the huge amount of available AI models for text generation, it can be very tricky to find the one that fits best for the specific purpose.
In  _@subsec:textgen #titles.textgen _the models used in this thesis are introduced.

Using RAG for chatbots brings several advantages.
Information retrieval and text generation are separated, which results in a very flexible system.
The information can be updated without the need to retrain the text-generation model.
The vector store and retrieval can be used with any text-generation model.
Fine-tuning of a pre-trained model is not necessary.

== #titles.AImodels <sec:AImodels>

AI models are algorithms that can learn from data and make predictions or decisions based on that data.
The most known type of AI models are Large Language Models (LLMs), which are designed to understand and generate human language.

A huge variety of AI models exist, each designed for specific tasks and applications.
Besides the mentioned LLMs, this thesis also uses embedding models, which are used to convert text into vectors.
There is also a translation model that is part of this thesis.
It's only purpose is to translate text from one language to another.
It also generates text, like a text generation model, but it is not used to generate answers based on a user query.

=== #titles.textgen <subsec:textgen>

A text generation model is a type of generative AI models which is designed to produce coherent and contextually relevant textual
content.
These models are typically based on natural language proc                                                                               essing (NLP) techniques and are trained in text data to learn the patterns, grammar, and context required to generate humanlike text.
When these these models are trained in huge sets of data and have been fed enough examples to be able to recognize and interpret human language or other types of complex data, then they are called large language models (LLM) [15].

These are the key components and concepts of text generation models:
• Training Data:
‣ Corpora: Large collections of text used to train the model. These can include books, articles,
websites, dialogues, and other text sources.
‣ Preprocessing: Cleaning and organizing the text data, including tokenization (breaking text
into words or subwords), removing special characters, and normalizing text.
• Model Architecture:
Development of an AIBased
System for Knowledge Specific
Assistance
8
MSc Thesis Apostolou Athanasios
‣ Recurrent Neural Networks (RNNs): Earlier models for text generation, including Long ShortTerm
Memory (LSTM) and Gated Recurrent Units (GRUs), which handle sequential data by
maintaining context over time.
‣ Transformers: Modern architecture that has become the standard for NLP tasks. Transformers
use selfattention
mechanisms to process entire sequences of text at once, allowing for
better handling of context and dependencies over long distances in the text. Examples
include the GPT (Generative Pretrained
Transformer) series, BERT (Bidirectional Encoder
Representations from Transformers), and others.
• Training Process:
‣ Unsupervised Learning: Most text generation models are trained using unsupervised learning,
where the model learns to predict the next word or sequence of words based on the context
provided by preceding text.
‣ FineTuning:
After pretraining
on a large corpus, models are often finetuned
on specific
datasets to adapt them to particular tasks or domains.
• Generation Techniques:
‣ Sampling: Randomly selecting the next word from the probability distribution generated by
the model.
‣ Beam Search: An algorithm that searches for the best sequence of words by considering
multiple candidate sequences at each step and selecting the most likely ones.
‣ Temperature Adjustment: Modifying the probability distribution to control the randomness of
the generated text. Lower temperatures result in more deterministic outputs, while higher
temperatures produce more diverse and creative text.
Usually the most popular LLMs have these parameters in order to control sampling. Parameter
“top_k” limits the model's output to the topk
most probable tokens at each step. This can
help reduce incoherent or nonsensical output by restricting the model's vocabulary. Parameter
“top_p” filters out tokens whose cumulative probability is less than a specified threshold (p). It
allows for more diversity in the output while still avoiding lowprobability
tokens. Temperature
adjusts the randomness or confidence level of the model's predictions by scaling the log
probabilities. Higher temperatures lead to more diverse but potentially nonsensical outputs,
while lower temperatures yield more focused and predictable responses [16], [17].
• Evaluation:
‣ Perplexity: A measure of how well a probability model predicts a sample. Lower perplexity
indicates better performance.
‣ Human Evaluation: Assessing the coherence, relevance, and fluency of the generated text
through human judges.
‣ Automated Metrics: BLEU (Bilingual Evaluation Understudy), ROUGE (RecallOriented
Understudy for Gisting Evaluation), and other metrics comparing the generated text to
reference texts.


=== #titles.modelfamilies <subsec:modelfamilies>

== #titles.finetuning <sec:finetuning>


== #titles.quantization <sec:quantization>

== #titles.huggingface <sec:huggingface>

== #titles.ollama <sec:ollama>

== #titles.cloudlocal <sec:cloudlocal>
