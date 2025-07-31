#import "global.typ": *
#set heading(numbering: "1.")
= #titles.intro <cha:intro>

//#quote([Privacy matters], [Edward Snowden],)
//describe problem, relevance of problem, what has to be improved, background, prerequisites for work, terms and definitions

The increasing demand for artificial intelligence (AI) in various applications, is a challenge that software developers have to deal with.
Many AI driven systems use online platforms that provide the necessary computational resources accessible in form of an API.
However, in scenarios where no internet connection is available, or where data privacy is a concern, the AI driven system has to be able to run locally on the device.

The challenge of running AI applications locally lies in the available hardware.
Large Language Models (LLMs) require significant resources, and their effectiveness is often tied to the availability of high-performance computing resources.
However, some practical use cases demand AI solutions that function reliably on consumer-grade hardware with minimal resources.

The idea for this thesis was born, when the author was tasked with developing a chatbot that should run locally on a Windows PC without an internet connection and only 8 GB of RAM.
The chatbot must support English and German.
It's task is to provide information that comes from a user manual.
This means that there is no huge amount of data that the chatbot has to process, but it still needs to be able to understand and answer questions in both languages.
The information should be replaceable to easily update information, or use it for other topics.

To reach this goal, different approaches were implemented.
All of them use Retrieval Augmented Generation (RAG) to retrieve information from a local vector store.
And they all use Ollama, a tool that allows running, and managing AI models locally with integrated resource management.
This thesis describes, compares, and evaluates the results of three different implementations, focusing on response time, response quality, and memory usage.

The first implementation, a low code approach, uses Langflow with Python and Ollama.
The next one uses C\# with OllamaSharp, a nuget package that supports Ollama.
The final implementation uses a FlaskAPI for the logic, and a C\# WPF application for the user interface.

The aim of this thesis is to to explain what is necessary for running a chatbot locally with hardware restrictions, and to find out which factors have the most significant impact on the performance of local AI chatbots and how they can be optimized for efficient offline use.

Despite the growing number of AI models, little research has been conducted on model fine-tuning and training for this thesis.
Instead it compares, and evaluates existing pre-trained models and their performance in the different approaches of the chatbot project.
A closer look on model quantization and its impact on performance is taken.
For this purpose, different quantization levels of the same model are used.

== #titles.problem <sec:problem>
// examples for problem, compare to existing solutions, why a better solution is needed

Developing an offline chatbot that can be used on a Windows PC with only 8 GB of RAM presents several challenges.
Large Language Models (LLMs) require significant computational resources, which are often beyond the capabilities of consumer-grade devices.
While smaller, optimized models can operate under these constraints, they frequently produce lower-quality responses, particularly in terms of coherence, grammar, and factual accuracy.
Running the chatbot in German adds another level of complexity, as many of the best-performing models are primarily optimized for English, making direct German language generation less reliable.  

The first idea of fine-tuning a model and use it for the chatbot was quickly dismissed.
Fine-tuning requires substantial computational power and long training times, as well as a large amount of training data.
Compared to Retrieval Augmented Generateion
RAG provides a more flexible alternative by retrieving domain-specific knowledge from a local vector store, but ensuring efficient retrieval and response generation remains a challenge.
To further improve accuracy, a translation model was introduced in the final chatbot implementation, allowing responses to be generated in English for better language quality before being translated into German.  

The famous strategy "Divide and conquer" (Julius Cäsar) provides an apt analogy for the FlaskAPI approach taken in this project.
Instead of relying on a single model to handle retrieving information, text generation, and multilingual processing, the chatbot's architecture distributes these tasks among three specialized models: an embedding model for retrieval (RAG), a lightweight LLM for response generation, and a translation model for language adaptation.
This modular approach optimizes efficiency while maintaining language quality, making it possible to run the chatbot on limited hardware.  

Compared to cloud-based solutions, an offline chatbot must carefully balance efficiency, accuracy, and speed while operating under hardware constraints.
Without proper optimization, local AI models risk being too slow or generating unreliable responses, limiting their practical usability.
This thesis investigates different offline AI approaches and explores strategies for improving performance in a multilingual chatbot.

== #titles.researchq <sec:researchq>

*"Which factors have the most significant impact on the performance of local AI chatbots, and how can they be optimized for efficient offline use?"*

By answering the research question above, the thesis will point out the key factors that influence the performance of local AI chatbots and propose optimization strategies to enhance their efficiency for offline use.
It will also refer to different hardware constraints.

An important factor that will be considered in the thesis are how different AI models and quantization levels affect the performance.
An other interesting aspect is how the choice of programming language and framework influences the performance of the chatbot, when using the same AI models.
This leads to the following hypotheses.

== #titles.hypotheses <sec:hypotheses>

=== #titles.hypothesis1 <subsec:hypothesis1>
This hypothesis examines whether lower-bit quantization (e.g., 4-bit vs. 8-bit) leads to a trade-off between processing speed, efficiency, and response quality in local AI chatbots. To measure the response quality, the correctness and grammar/spelling of the chatbot responses will be categorized as "Correct," "Partially Correct," or "Wrong."

- $H_0$: _Reducing quantization precision (e.g., from 8-bit to 4-bit) has no significant effect on chatbot processing speed, efficiency, or response quality (measured by correctness and grammar/spelling)._
- $H_A$: _Reducing quantization precision (e.g., from 8-bit to 4-bit) results in at least a 20% improvement in processing speed and efficiency compared to 8-bit quantization, but with a higher percentage of chatbot responses categorized as "Partially Correct" or "Wrong" in terms of factual correctness and grammar/spelling._

=== #titles.hypothesis2 <subsec:hypothesis2>

This hypothesis focuses on the efficiency of Ollama in different scenarios.
The experiment includes different approaches to implement a chatbot with Ollama.
Parameters to measure the efficiency include response time, required storage space, and memory usage.

- $H_0$: _The scenario in which Ollama is used does not have a significant impact on response time and memory usage (difference \<10%)._
- $H_A$: _The scenario in which Ollama is used does have a significant impact on response time and memory usage (difference \>10%)._

== #titles.method <sec:method>

To verify or disprove the hypotheses and ensure a solid foundation for this thesis, both scientific research and findings from an offline chatbot project developed as part of this work are combined.

Scientific literature is reviewed to identify the state of the art in the field of offline AI applications and their performance optimization.
To provide practical insights into the topic, the theoretical findings are compared to the project results.

To incorporate project-based data, tests with measurable results are defined and carried out.
The results are analyzed as part of the thesis and supported by theoretical findings from literature research, ensuring a well-rounded and reliable evaluation.

The most important results of the performed tests are the response time, the memory usage, and the accuracy of the chatbot or AI model under varying circumstances.
Tests are done on devices with different hardware specifications, such as a Windows PC with 8 GB of RAM, and a Windows PC with 32 GB of RAM.

== #titles.scope <sec:scope>

The scope of this thesis is limited to optimizing the performance of local AI applications by integrating and evaluating existing AI models.
No new AI models are created or trained from scratch.
Given the vast number of pre-trained models available, which continue to improve and expand daily, developing a custom model would be neither practical nor competitive.
Without extensive experience in AI model training and appropriate hardware, it is highly unlikely that any self-trained model would achieve results comparable to those of established ones.
Instead, the focus remains on selecting pre-trained models, and providing an implementation or framework that allows them to run efficiently on consumer-grade hardware.
Similarly, while quantization is a key factor in model optimization, this thesis does not include performing quantization itself.
Instead, it examines how different pre-quantized versions of the same model affect performance under various hardware constraints.
The aim is to analyze and compare existing models with different quantization rather than modifying or re-quantizing models directly.
By maintaining this focus, the thesis ensures a practical and achievable approach to enhancing offline AI applications while leveraging the strengths of available technology.

== #titles.structure <sec:structure>
 @cha:background (#ref(<cha:background>, form:"page") ff) includes background information on the key concepts and technologies used in the thesis, such as Large Language Models (LLMs) and retrieval-augmented generation (RAG) and gives information about tools and libraries used in the project.
@cha:concept (#ref(<cha:concept>, form:"page") ff) introduces the concept of possible solutions to the problem of optimizing local AI chatbots for offline use.
@cha:implementation (#ref(<cha:implementation>, form:"page") ff) presents the implementation of the solution, pointing out the key features and components of the chatbot system.
In @cha:evaluation (#ref(<cha:evaluation>, form:"page") ff) an evaluation of the chatbot's performance on different devices and using different quantization levels is conducted.
Finally, @cha:conclusion (#ref(<cha:conclusion>, form:"page") ff) concludes the thesis by summarizing the findings, discussing the implications of the results, and suggesting future research directions.
The following chapter (@cha:related (#ref(<cha:related>, form:"page") ff)), gives an overview of related work in the field of developing offline AI applications on limited hardware.
