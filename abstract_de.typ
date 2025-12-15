Viele Websites bieten heutzutage eigene Chatbots zur Beantwortung von Kundenfragen.  
Mit der Hilfe von Online-APIs wie der OpenAI API oder der Huggingface Inference API ist es einfach, einen individuellen Chatbot zu erstellen.
Ausserdem ist es somit nicht notwendig sich mit Hardware Limits oder Skalierung auseinanderzusetzen.
Es kann jedoch Situationen geben, in denen ein Chatbot lokal ausgeführt werden soll.
Der häufigste Grund dafür ist, dass die Daten das lokale Netzwerk nicht verlassen sollen, wenn sensible Informationen verarbeitet werden.
Für diesen Fall können KI-Modelle auf lokaler Hardware ausgeführt werden, die über ausreichend Speicherplatz und leistungsstarke CPUs verfügt.
#linebreak()
Doch wie kann Kunden bei begrenzten Hardware-Ressourcen dennoch der Nutzen eines Chatbots auf einem lokalen Gerät geboten werden?
An diesem Punkt setzt das Projekt dieser Bachelorarbeit an:
#linebreak()
#linebreak()
Die Autorin wurde in Ihrem Ausbildungsbetrieb damit beauftragt, einen Chatbot zu erstellen, der lokal ausgeführt wird und nicht mit dem Internet verbunden ist. 
Die Hardware hatte begrenzten Ressourcen, und der Chatbot musste so gestaltet werden, dass er unter den gegebenen Bedingungen funktioniert.  
#linebreak()  
Das Zielgerät war ein Windows-PC mit nur 8 GB RAM und der Chatbot muss die Hardware-Ressourcen mit anderen Anwendungen und dem Betriebssystem teilen.
Eine weitere Herausforderung bestand darin, dass der Chatbot sowohl auf Englisch als auch auf Deutsch antworten sollte.
#linebreak()  
Um das Ziel zu erreichen, wurden mehrere Ansätze getestet.  
Die erste Idee, ein vortrainiertes Large Language Model (LLM) mit den erforderlichen Informationen für den Chatbot zu fine-tunen, brachte kein akzeptables Ergebnis.  
Nach einer Reihe von Experimenten mit RAG (Retrieval-Augmented Generation), bei dem die produktspezifischen Informationen für den Chatbot in einem Vektor-Store gespeichert werden, wurde eine funktionierende Lösung gefunden.
Alle Chatbot-Ansätze verwenden Ollama, ein Tool zur Verwaltung von Large Language Models.
Die finale Implementierung funktionierte, erfüllte jedoch nicht die Erwartungen der Nutzer an einen Chatbot.  
Die Antwortzeit war zu lang, und die Qualität der Antworten war nicht zufriedenstellend.
Für die Entwicklerin war es dennoch ein Erfolg, den Chatbot zum Laufen zu bringen.
#linebreak()  
Die verschiedenen Chatbot-Ansätze wurden getestet und verglichen, wobei der Fokus auf der Antwortzeit sowie der Qualität des Inhalts und der Sprache der Antworten lag.  
#linebreak()  
Zusammenfassend lässt sich sagen, dass das Ergebnis ein Chatbot war, der Fragen beantworten konnte, aber die Antworten nicht immer korrekt waren, die Qualität der Sprache war nicht zufriedenstellend und die Antwortzeit zu lang.
#linebreak()  
Der Chatbot wurde auch auf einem Windows-Laptop mit 32 GB RAM getestet.
Auf diesem Gerät funktionierte der Chatbot gut, selbst bei Verwendung eines größeren LLM, um eine bessere Antwortqualität zu erzielen.
#linebreak()
Der aktuellste Ansatz, auch auf dem ursprünglichen Zielgerät ein brauchbares Ergebnis zu erhalten, ist eine KI Anwendung, die KI für die Übersetzung und Retrieval verwendet.
Dem Chatbot liegen Informationen in Form einer JSON-Datei mit englischen Fragen und vordefinierten Antworten in Deutsch und Englisch vor.
Die Frage mit der höchsten Ähnlichkeit zur Benutzereingabe wird aus der JSON-Datei abgerufen und die entsprechende Antwort zurückgegeben.
Das wird nur als alternative Lösung vorgestellt, da keine fortlaufende Konversation möglich ist, was ein zentrales Merkmal eines Chatbots ist.
