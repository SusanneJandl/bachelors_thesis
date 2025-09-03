#import "global.typ": *
//① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳
= #titles.concept <cha:concept>

The implementation for this thesis includes various approaches to create an offline chatbot to compare different ways to achieve the goal of a working version.
All of the versions use Retrieval Augmented Generation (RAG) to access specific information, and Ollama for text generation.

The decision to use RAG was made to enable the use of varying information for different chatbots, and to handle updates of data easily.
A different solution would have been to fine-tune an existing Large Language Model (LLM), or to train one from scratch.
Training of a model for this specific use-case comes with multiple disadvantages:
The training process requires a well prepared huge data set, and a lot of computing power.
In addition it is necessary to have deep knowledge about the model architecture and training process.

Ollama was chosen as it provides a local API to manage and use LLMs and embedding models.
It adapts to existing hardware and optimizes the usage of available resources.
The examples in the implementation compare different ways to use Ollama, as numerous libraries and tools are available for integration.

The developer started the implementation with the wish to use C\# as the main programming language.
In the end she found out, that more suitable tools and libraries, as well as community support are available in Python.

So the implementation finally uses Python alongside with C\# code.
There is also a no-code version using Langflow.
Whenever possible the same circumstances are created for all chatbot versions.
This includes the data for RAG, as well as the chunk size of 700 characters, and an overlap of 200 characters for text splitting.
Llama3.2:3b with Ollama is used for text generation in all versions.
As Llama3.2:3b is a multilingual model, a separate model for translation is only included in the latest chatbot version, to improve response quality.
There are differences in vector stores and embedding models, as not all tools support the same models and stores.

After details of the different approaches, a summary points out the key facts, advantages and disadvantages when comparing them.

== #titles.langflowapproach <sec:langflowapproach>

The first approach uses Langflow, a no-code tool to create workflows.
Langflow is easy to use after successful installation.
This project uses Langflow version 1.1.1.
For successful installation and execution Python 3.10 is required.
This version is not up-to-date, but due to huge changes after updates, the workflows created with version 1.1.1 do not work with later versions.
Langflow provides the possibility to download and upload workflows as JSON files.
That way the workflows can be easily shared and reused, given that the same version of Langflow is installed.

For this project, two workflows were created.
The first workflow creates a vector store that includes the additional information for the pre-trained LLM.

@fig:LangflowRAG shows the Langflow UI with a workflow that creates a vector store.

In the first card that can be added easily by drag-and-drop #text(1.3em)[①] the data source is defined.
In the second step the text is split into smaller chunks #text(1.3em)[②] and an overlap is defined.
Using an embedding model #text(1.3em)[③] the text chunks are transformed into vectors and stored in a vector store #text(1.3em)[④].

#figure(
    box(stroke: gray, inset: 0.5em, width: 80%,
      image("../figures/LangflowRAG.png")
    ),
    caption: flex-caption(
        [Vector store creation with Langflow],
        [Vector store creation with Langflow https://www.langflow.org/],
    )
  )<fig:LangflowRAG>

@fig:LangflowChat shows the Langflow UI with a workflow for answer generation based on a user query.
With help of the embedding model (all-minilm:22m) #text(1.3em)[①], that must be the same as used for vector store creation, the user query #text(1.3em)[②] is transformed into a vector and compared to the existing vectors in the vector store #text(1.3em)[③].
The output of the vector store is converted from vectors to text #text(1.3em)[④].
The prompt is then created by combining the user query with the context retrieved from the vector store #text(1.3em)[⑤].
An example for a prompt is: Answer the following question \[QUERY\] based on the provided context \[CONTEXT\].
This prompt is passed to the LLM (Llama3.2:3b) #text(1.3em)[⑥] that generates an answer #text(1.3em)[⑦].

#figure(
    box(stroke: gray, inset: 0.5em, width: 100%,
      image("../figures/LangflowChat.png")
    ),
    caption: flex-caption(
        [Answer generation with Langflow],
        [Answer generation with Langflow https://www.langflow.org/],
    )
  )<fig:LangflowChat>

The user interface covers the creation of workflows and offers a playground for testing.
For production a chatbot user interface is needed.
For this purpose a chatbot widget for langflow is available, that works with the workflow ID of the answer generation workflow, when running Langflow in background mode.
There is no possibility to customize the widget design to specific needs.
The workflow can also be called via API, so a custom user interface can be created.
The Langflow project for this thesis includes a sample console app that uses the API to call the workflow and display the answer in the console.

A downside when using langflow is the installation that includes a lot of packages that are not used and can lead to increased resource consumption.
As this thesis is about limited hardware resources, this is a reasonable argument against using langflow in production.
The following approach in the next section still uses Langflow, but only for retrieving the context from the vector store.

== #titles.csharpapproach <sec:csharpapproach>

This approach includes a C\# console application.
No graphical user interface (GUI) was implemented, as the purpose was to test the functionality first, and add a GUI if the result was successful for use in production.

@fig:OllamaSharpChat shows the architecture of the chatbot with OllamaSharp and Python.Included in C\#.
The test results of the Langflow approach showed that the time for retrieving the context from the vector store was acceptable for a first prototype.
For retrieving the context, a new workflow was created with Langflow, and used in backend mode.
A python script calls the workflow via API and returns the context as text.
To integrate this into the C\# application, the Nuget package Python.Included is used.
With Python.Included, the necessary Python environment is packaged with the application, allowing it to run without requiring a separate Python installation.

For text generation Ollama is used with OllamaSharp, a second Nuget package that provides ready-to -use functions to interact with the local Ollama API.
The text generation still takes significant time, but the streaming functionality supported by OllamaSharp improves user experience.
As soon as a token is generated, it is sent to the client, allowing the user to see the response being formed in real-time.

#figure(
    image("../figures/OllamaSharp.svg"),
    caption: flex-caption(
        [Chatbot with OllamaSharp and Python.Included in C\#],
        [Chatbot with OllamaSharp and Python.Included in C\#],
    )
  )<fig:OllamaSharpChat>

Still there is the downside of the installation overhead with Langflow, as it comes with a lot of packages that are not used for this chatbot.

== #titles.flaskapiapproach <sec:flaskapi>

The next version of the chatbot uses a Flask API for the backend, and a C\# WPF application as user interface.
Like the other two implementations, Ollama is used for text generation.
Additional translation models are used to improve the quality of the answers and the context retrieved based on the query.
So the retrieval and text generation process only uses English, and if the user chooses German, the separate translation step is added in the beginning and the end of the process.
fig:FlaskChat shows the architecture of the chatbot with Flask API, followed by a detailed description of the steps.

#figure(
    image("../figures/Flask.svg"),
    caption: flex-caption(
        [Architecture of the chatbot with Flask API],
        [Architecture of the chatbot with Flask API],
    )
  )<fig:FlaskChat>

A HTTP request including the selected language, question and topic is forwarded to the /answer endpoint of the Flask API from the C\# app #text(1.3em)[①].
The process starts with the context retrieval script #text(1.3em)[②].
If German is selected, the translation script is called #text(1.3em)[③].
Using the translation model opus-mt-de-en, the input text is translated from German to English #text(1.3em)[④].
Then the translation script returns the English query back to the content retrieval script #text(1.3em)[⑤].
The embedding model paraphrase-multilingual-MiniLM-L12-v2, converts the query into a vector #text(1.3em)[⑥].
The best matching chunks are then returned from the vector store #text(1.3em)[⑦].
The context together with the query is passed to the answer generation script #text(1.3em)[⑧].
This script uses Ollama with a Python library.
A prompt containing the query and content is passed to Ollama #text(1.3em)[⑨].
The generated answer is then returned to the answer generation script #text(1.3em)[⑩].
If German is selected, the translation script is called #text(1.3em)[⑪].
Using the translation model opus-mt-en-de, the input text is translated from English to German #text(1.3em)[⑫].
Then the translation script returns the English query back to the answer generation script #text(1.3em)[⑬].
This answer is the result that is passed to the /answer endpoint #text(1.3em)[⑭].
Finally the answer is returned to the user interface #text(1.3em)[⑮].

One downside is, that due to the separation of text generation and translation it is not possible to stream the response.

== #titles.approachessummary <sec:approachessummary>

The different chatbot versions come with benefits and downsides.
The Langflow version is very easy to implement and does not even require coding knowledge.
The response times are slow, and the installation overhead is high due to the many unused packages.

The OllamaSharp version offers better user experience, due to the fact, that it supports streaming of the response as soon as a token is generated.
Even if the response times are still not long, the ability to stream the response improves the overall interaction quality.
For retrieval this approach still uses Langflow, and so the installation overhead is still present.

The Flask API version is the only version with separate translation.
This allows for more accurate and context-aware responses, especially for users who prefer to interact in German rather than English.
The text generation model does not need to support multiple languages, which results in more suitable models.
In this work, there is still the multilingual Lllama3.2:3b model used, for better comparison of the different approaches.

The following chapter will introduce some implementation details and code snippets for each approach.