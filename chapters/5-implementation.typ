#import "global.typ": *

= #titles.implementation <cha:implementation>


== #titles.imploverview <sec:imploverview>
Finally, a solution for the offline chatbot was found.
For demonstration purpose a sample app was created.
The sample app has a dog and a bird page, each containing a ''Start chatbot'' button.
Accordingly a dogs and a birds vector store were created.
On button click the startbot endpoint of the Flask API is called and the page/vector store name are passed to the API.
The sent name has to be the same name of the vector store.

The Flask API triggers the chatbot app and passes the vector store name to the WPF window.
It also includes a query endpoint to retrieve relevant context from the vector store.

The WPF application with the chatbot window uses OllamaSharp and Ollama.
It sends the query to the Flask API and retrieves the context.

== Vector store creation

For this project the sample vector stores are provided.
Creating the vector stores is not part of the production environment.
Still it is an important step that will be documented here.

After different approaches, the decision was made to write own python scripts for vector store creation.
The packages used in the final version are hnswlib and sentence transformers.
For extracting text from different file types bs4 and pdfplumber are used.
For transforming text to vectors and vice versa the embedding model ''all-mpnet-base-v2'' was chosen.
It is multilingual, supporting English and German, and not too large.
The choice was made by comparing output, size and speed of different models.

In a first step the extracted text is cut into chunks that are then transformed into vectors.
The chunk size and other parameters  help to manipulate the output. This example refers to the use of hnswlib package:

- chunk size:
  - Number of characters in a chunk that will then become a vector
- overlap:
  - Number of characters that are in the previous chunk as well.
    #linebreak()
    Example: chunk size = 100, overlap = 20
    #linebreak()
    First chunk includes character 0-99, second chunk includes character 80-179
- M:
  - can be a value from 12-48 and represents the maximum number of edges per node.
  - higher M means more accuracy but needs more hardware resources
- ef:
  - Controls the size of the dynamic list of candidates during the search process.
  - higher ef means more accuracy but needs more hardware resources



== Flask API

Caused by the fact that the use of Python.Included in C\# did not work so well, the choice was to set up a flask API with functions to trigger the chatbot and retrieve the relevant context from the vector store based on the query.

The flask API has two endpoints:

- /startbot
  - is called by the sample app that sends the topic in a post request
    - starts the chatbot.exe and sets the topic as an environment variable in the chatbot app.- /query
  - is called by the chatbot app that sends the user input as query and the value of the environment variable as topic in a post request.
    - calls the retrieve\_context function that returns relevant context from the vector store based on the query.
    - passes the context as a string to the chatbot app.
  

=== Extract context form vector store

With help of a python script the relevant context is extracted from the vector store.
The query is converted to a vector using the same model that was used for the creation of the vector store.
The model will compare vectors inside the vector store to the vector created from the query.
Vectors that match best are identified.
The found vectors are transformed into text.

The ''k'' value idefines the number of results to retrieve.

== Chatbot app

The chatbot is implemented as a C\# WPF application.
The decision was made by the concept that specifies to implement a C\# application and the fact that the position and size of the WPF application can be set easily.

The chatbot app uses the OllamaSharp nuget package, which provides predefined functions to interact with Ollama.
Ollama simplifies the use of large language models and helps to increase performance on machines with limited hardware resources.
A more detailed description can be found in section {\it \ref{sec:Ollama} Ollama} on page~\pageref{sec:Ollama}.
For this project OllamaSharp is used to set the large language model (LLM) and to execute the predefinded chat function.
The streaming function, that enables retrieving the answer token by token is very important.
As the performance of LLMs can be very slow for local use (depending on the hardware) streaming helps to avoid frustration due to long waiting time on user side.

The context is created by a http post request to the flask API passing the query and the topic.
This context is then part of the prompt that is passed to the LLM, that answers the query based on the retrieved context.
The prompt will also contain the chat history, but not the context of the previous queries to avoid an unneccessary overhead of text that the LLM has to process.

The user interface's design is very simple.
It has an input field, a list box, and a send button.
The user writes the question into the input field and clicks the send button.
The listbox shows the chat history including the user input.

Language detection is covered by an instruction in the prompt that tells the LLM to use the language of the latest query.
With the use of a multilingual LLM this is all there is to do to retrieve the answer in the prefered laguage.

=== Choice of Large Language Model

It can be very challenging to find a large language model that fulfills the specific needs.
In this project it was important to find a model that can be used with limited hardware resources and supports English and German.
It has to be pretrained so that it offers good language skills.
There was a lot of research and trying out different models.
For testing purpose the use of langflow was very helpful.
Without coding and changing scripts all the time the different models could be tested.

In the end it was decided to use llama3.2:3b that works on most machines and supports multiple languages.
It has the capability to build reasonable sentences in English and German.

If the model is still too large, llama3.2:1b can be used as an alternative.
The language skills are not as good as in the 3b model, but the quality is acceptable.
Sometimes there is a mixture of English and German in the output and some grammar issues.

=== Tools and models
==== Ollama

Ollama helps to manage large language models and provides a models, a chat and an embedding endpoint in an API that runs on localhost.
It is available for Windows, Linux and MacOS.
Ollama improves the usage of hardware by detecting gpu if available and carrying out tasks on available resources.
It supports the upload and download of LLMs and includes a simple console chat function.

The usage of Ollama is quite simple.
It has to be downloaded and installed.
To activate it is necessary to open a terminal and enter the command "ollama serve".
