#import "global.typ": *

= #titles.concept <cha:concept>

== #titles.approaches <sec:approaches>

For creating a chatbot, also a local one, there are many frameworks and thousands of AI models available.
Here are some approaches the author had a closer look at.
It starts with a first experience with fine tuning an AI model and progresses towards the final implementation.

=== #titles.finetuningapproach <subsec:finetuningapproach>

The first idea was to fine tune a pre trained AI model with specific information the chatbot needs in production.

For fine tuning a lot of aspects have to be considered.
It is important to choose a suitable pre trained model.
Training data has to be prepared.
The number of training cycles is crucial to put the focus on the new information and not to overwrite the pre trained knowledge.

This approach requires experience and knowledge to get good results.
A huge disadvantage compared to the final implementation and other RAG approaches is the lack of flexibility when it comes to changes or updates of the relevant information.

=== #titles.langflow <subsec:langflow>

Langflow is a low-code tool to create AI workflows.
Workflows can be created in an intuitive UI including a playground to use the created workflow.
Langflow can be executed in the background as an API as well.
Workflows can be down- and uploaded in the form of json files.

For offline use it is possible to use Ollama for providing large language models and embedding models.
Ollama provides a local API that manages AI models and their usage for chat, and embeddings.

For using Retrieval Augmented Generation (RAG) two workflows are necessary.
The first workflow stores a vector store that is created from a folder containing documents including relevant information.
@fig:LangflowRAG shows the Langflow UI with a workflow that creates a vector store.

#figure(
    box(stroke: gray, inset: 0.5em, width: 80%,
      image("../figures/LangflowRAG.png")
    ),
    caption: flex-caption(
        [Vector store creation with Langflow],
        [Vector strore creation with Langflow https://www.langflow.org/],
    )
  )<fig:LangflowRAG>

The second workflow is used to generate answers based on a user query.
It includes retrieving the context from the vector store and generating an answer based on the user query.
@fig:LangflowChat shows the Langflow UI with a workflow for answer generation based on a user query.

#figure(
    box(stroke: gray, inset: 0.5em, width: 100%,
      image("../figures/LangflowChat.png")
    ),
    caption: flex-caption(
        [Answer generation with Langflow],
        [Answer generation with Langflow https://www.langflow.org/],
    )
  )<fig:LangflowChat>

A downside when using langflow is the installation that includes a lot of packages that are not used.
As this thesis is about limited hardware resources, it is not suitable to use langflow in production.

=== #titles.csharpapproach <subsec:csharpapproach>

This approach includes a C\# application.

For that purpose Python.Included Nuget package was used.
This way python packages can be used in C\# code.

An important part is the use of OllamaSharp that enables streaming.
As LLMs produce their answers token by token (a token is a word or part of a word) the stream starts when the first token is received.
That means that there could be a response time of three minutes, but the stream starts after 10 seconds and outputs token by token until the answer is completed after three minutes.
That is a huge advantage for user experience.

== #titles.finalimplementation <sec:inalimplementation>

The final approach uses a flask API.
The tasks, such as translation, answer generation, context retrieval, and starting the chatbot are divided into different endpoints to keep them small and enable use on devices with limited resources.

One downside is, that due to the separation of text generation and translation there is no streaming possible.
Compared to the previous approaches the final implementation has a shorter response time and better quality of the answers.