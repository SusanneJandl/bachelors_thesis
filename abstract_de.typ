Viele Websites bieten heutzutage Chatbot-Funktionen zur Unterstützung der Kunden an.  
Zahlreiche vorgefertigte Lösungen stehen zur Implementierung zur Verfügung, erfordern jedoch in der Regel Internetzugang.  
Falls keine dieser Lösungen passend ist, kann ein eigener Chatbot mit kostenpflichtigen Diensten, wie der OpenAI API oder der Huggingface Inference API mit wenig Aufwand erstellt werden.
#linebreak()  
#linebreak()
Aber wie kann Kunden die Nutzung eines Chatbots ermöglicht werden, wenn es sich um eine lokale Anwendung ohne Internetzugang handelt?
Hier beginnt das in der Bachelorarbeit beschriebene Projekt:
#linebreak()  
Für eine Software, die lokal ohne Internetverbindung läuft, musste ein Chatbot entwickelt werden.  
Die Hardware hatte begrenzten Ressourcen, und der Chatbot musste so gestaltet werden, dass er unter den gegebenen Bedingungen funktioniert.  
#linebreak()  
Das Zielgerät ist ein Windows-PC mit 8 GB RAM und einer CPU mit 4 Kernen.
Eine weitere Herausforderung besteht darin, dass der Chatbot sowohl auf Englisch als auch auf Deutsch antworten muss.
#linebreak()  
Um das Ziel zu erreichen, wurden mehrere Ansätze getestet.  
Die erste Idee, ein vortrainiertes Large Language Model (LLM) mit den erforderlichen Informationen für den Chatbot zu fine-tunen, brachte kein akzeptables Ergebnis.  
Nach Versuchen mit einigen anderen Möglichkeiten, die in dieser Arbeit erwähnt werden, wurde schließlich eine endgültige Lösung gefunden.  
Diese umfasste die Verwendung von RAG (Retrieval-Augmented Generation), bei der die produktspezifischen Informationen für den Chatbot in einem Vector Store gespeichert wird, sowie die Nutzung von Ollama. Ollama ist ein Tool, das Large Language Models verwaltet.  
#linebreak()  
Die Lösung funktionierte, entsprach jedoch nicht den Erwartungen der Nutzer an einen Chatbot.  
Für den Entwickler war es zwar ein Erfolg, den Chatbot zum Laufen zu bringen, aber es dauerte bis zu einer Minute, um eine Antwort zu erhalten, und die Sprachqualität war nicht gut.  
In der Klassifizierung der KI-Ausgabequalität wurden die Antworten des Chatbots als teilweise korrekt in Rechtschreibung und Grammatik sowie inhaltlicher Korrektheit bewertet.  
#linebreak()  
Zusammenfassend war das Ergebnis ein Chatbot, der Fragen beantworten konnte, dessen Antworten jedoch nicht immer korrekt waren, mit unzureichender Sprachqualität und langen Antwortzeiten.
#linebreak()  
Der Chatbot wurde auch auf anderen Geräten, wie einem Windows-Laptop mit 16 GB RAM und einem MacBook mit M1-Chip getestet.
Auf beiden Geräten funktionierte der Chatbot gut, sogar mit einem größeren LLM zur Verbesserung der Antwortqualität.
#linebreak()
Der aktuellste Ansatz, auch auf dem ursprünglichen Zielgerät ein brauchbares Ergebnis zu erhalten, ist eine KI Anwendung, die KI für die Übersetzung und Retrieval verwendet.
Dem Chatbot liegen Informationen in Form einer JSON-Datei mit englischen Fragen und vordefinierten Antworten in Deutsch und Englisch vor.
Die Frage mit der höchsten Ähnlichkeit zur Benutzereingabe wird aus der JSON-Datei abgerufen und die entsprechende Antwort zurückgegeben.
Das wird nur als alternative Lösung diskutiert, da keine fortlaufende Konversation möglich ist, was ein zentrales Merkmal eines Chatbots ist.
