#import "global.typ": *
//① ② ③ ④ ⑤ 
= #titles.implementation <cha:implementation>

In the following sections insights of the different implementations and technologies are provided.

== #titles.langflowapproach <sec:langflowimpl>

Langflow works without any coding effort.
Python 3.10 is required for the Langflow version used in this work.
The command to start langflow in background is `python -m langflow run --port 7888 --backend-only`.
With `-m` the location of Langflow is detected automatically.
`--port 7888` specifies the port on which Langflow will run in the background.
`--backend-only` means that only the backend is started, and the user interface is not started in the browser.

The following code part shows how easy the workflow can be addressed using the widget.
The widget can be added to any html page.

#figure(
    align(
      left, fhjcode(code: read("../code/index.html"), firstline: 8, lastline: 16, language: "xml"),
    ), caption: flex-caption(
      [Adding the Chat Widget to an HTML Page.],
      [Adding the Chat Widget to an HTML Page.],
    ),
  ) <lst:Chatwidget>

  @lst:Chatwidget demonstrates the integration of the chat widget into an HTML page.
  The title is adaptable, and the flow id and url need to be added.
  The script is provided by langflow-ai #cite(<LangflowEmbeddedChat:2025>) and has to be included as well.

== #titles.csharpapproach <sec:csharpimpl>

For this chatbot implementation, in a first step a new Langflow workflow is created. Then the python script is developed, that will later be accessed from Python.Included #cite(<PythonIncluded:2025>) in C\#.
The purpose of the script is to retrieve the context from the vector store using the Langflow workflow that runs in the background.
The C\# console application finally uses the produced components, and integrates them into the application.

=== #titles.csharplangflow <subsec:csharplangflow>

After creating the vector store as shown in @fig:LangflowRAG in @sec:langflowapproach, the next step is to create a new workflow that outputs the context from the vector store, based on the user query.
Figure @fig:LangflowWorkflow shows the new workflow.

#figure(
    box(stroke: gray, inset: 0.5em, width: 80%,
      image("../figures/LangflowRetrieval.png")
    ),
    caption: flex-caption(
        [Retrieving context with Langflow Workflow.],
        [Retrieving context with Langflow Workflow.],
    )
  )<fig:LangflowWorkflow>

With help of the embedding model (all-minilm:22m) #text(1.3em)[①], that must be the same as used for vector store creation, the user query #text(1.3em)[②] is transformed into a vector and compared to the existing vectors in the vector store #text(1.3em)[③].
The output of the vector store is converted from vectors to text #text(1.3em)[④].
The final step outputs the text #text(1.3em)[⑤].

For successfully running the chatbot it is necessary to start Langflow with the added workflow in backend mode.
To do so the command `python -m langflow run --port 7888 --backend-only` must be entered in a console window using Python with version 3.10.
The port number must match the one used in the python script that retrieves the context.

=== #titles.csharppython <subsec:csharppython>

To retrieve the data, Langflow has to run in backend mode, and Ollama must be running as well, with the required models downloaded.
The text chunks are then provided in JSON format for further processing.
A sample #link("https://github.com/SusanneJandl/bachelor-thesis_offline-chatbot_data/blob/main/data/langflow-context.json")[JSON output] can be found in the repository, that contains a collection of data related to this thesis #cite(<Jandl:2025>).

A python script was developed to retrieve the output from the Langflow workflow.
The decision to use Python was made, as there was already existing code that was very similar and could be adapted.
As all of these chatbot versions are experiments, and other use-cases would benefit from using Python with C\#, this approach was chosen to test the use of the Python.Included #cite(<PythonIncluded:2025>) package.
@lst:ContextExtraction presents the code of the python script.

#figure(
    align(
      left, fhjcode(code: read("../code/prompt.py"), firstline: 0, lastline: 25, language: "python"),
    ), caption: flex-caption(
      [Retrieving JSON output and extracting context],
      [Retrieving JSON output and extracting context],
    ),
  ) <lst:ContextExtraction>

The script contains the URI to access Langflow and the relevant flow id to get the context from the vector store.
The extract_text function is used to get only the text parts from the JSON output for further processing.
Compared to a possible C\# implementation the extraction of the required context is more straightforward in Python.

=== #titles.csharppythonincl <subsec:csharppythonincl>

For Python integration in the C\# application the Nuget packages Python.Included #cite(<PythonIncluded:2025>) and Python.Runtime are required.

As displayed in @lst:PythonIntegration, first the python environment is set up and the required packages are installed.
The command `Installer.SetupPython();` creates a python environment in the project folder, when the program is started for the first time.
No separate Python installation is needed.
With `Installer.PipInstallModule("<package name>")` the required packages are installed in the created python environment.
At this point the developer experienced some issues with certain packages, that had to be added manually later on.
Using the Python Engine the python script can be executed from C\# code.

#figure(
    align(
      left, fhjcode(code: read("../code/Program.cs"), firstline: 0, lastline: 25, language: "cpp"),
    ), caption: flex-caption(
      [Retrieving JSON output and extracting context],
      [Retrieving JSON output and extracting context],
    ),
  ) <lst:PythonIntegration>

=== #titles.csharpollama <subsec:csharpollama>

The following code part shows the use of using Ollama API in C\# with OllamaSharp Nuget package #cite(<OllamaSharp:2025>).
A huge advantage of this package is the support of streaming responses, which enables to display the answer token by token.
This improves the user experience, as the user does not have to wait for the full answer to be generated before seeing any output.
As visible in @lst:OllamaCSharp, necessary values are the URI where Ollama is running, and the model name to be used.
The model must be downloaded and available in Ollama beforehand.

#figure(
    align(
      left, fhjcode(code: read("../code/Program.cs"), firstline: 36, lastline: 68, language: "cpp"),
    ), caption: flex-caption(
      [Using Ollama API in C\#],
      [Using Ollama API in C\#],
    ),
  ) <lst:OllamaCSharp>

== #titles.flaskapiapproach <sec:flaskapiimpl>

This chatbot version uses a Flask API including the necessary logic to an own implementation to retrieve the context from the vector store.
Before the vector store is created with an own python script.
Langflow is not used in this approach.
For the user interface a C\# WPF application is developed that accesses the query endpoint of the Flask API and 

=== #titles.flaskapi <subsec:flaskapi>

The Flask API provides endpoints for querying the vector store and retrieving context information.
=== #titles.userinterface <subsec:userinterface>