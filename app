import React, { useState, useEffect } from "react";
import "/src/App.js";

const App = () => {
  const [notes, setNotes] = useState([
    {
      title: "Note 1",
      body: "Make some coding tutorials...",
      date: "01/06/2024",
      reminder: "reminder",
      color: "white",
    },
    {
      title: "Note 2",
      body: "Probably should start eating healthy at some point this year",
      date: "01/06/2024",
      reminder: "",
      color: "white",
    },
    {
      title: "Note 3",
      body: "Go and watch a movie, for once",
      date: "01/06/2024",
      reminder: "",
      color: "white",
    },
    {
      title: "",
      body: "Learn an outside hobby such as mowing the lawn",
      date: new Date().toLocaleString(),
      reminder: "reminder",
      color: "white",
    },
  ]);

  const [newNote, setNewNote] = useState({ title: "", body: "", reminder: "" });

  useEffect(() => {
    localStorage.setItem("notes", JSON.stringify(notes));
  }, [notes]);

  const removeNote = (index) => {
    const updatedNotes = [...notes];
    updatedNotes.splice(index, 1);
    setNotes(updatedNotes);
  };

  const updateNote = (index, updatedContent, property) => {
    const updatedNotes = [...notes];
    updatedNotes[index][property] = updatedContent;
    setNotes(updatedNotes);
  };

  const addNote = () => {
    setNotes([
      ...notes,
      {
        title: "",
        body: "",
        date: new Date().toLocaleString(),
        reminder: "",
        color: "white",
      },
    ]);
  };

  return (
    <div className="App">
      <h1>Notes App</h1>
      <div className="note-container">
        {notes.map((note, index) => (
          <div
            key={index}
            className="note"
            style={{ backgroundColor: note.color }}
          >
            <input
              type="text"
              placeholder="Title"
              value={note.title}
              onChange={(e) => updateNote(index, e.target.value, "title")}
            />
            <textarea
              value={note.body}
              onChange={(e) => updateNote(index, e.target.value, "body")}
              placeholder="Type here..."
            />
            <p>{note.date}</p>
            <p>{note.reminder}</p>
            <button onClick={() => removeNote(index)}>Remove</button>
          </div>
        ))}
      </div>
      <div className="new-note-container">
        <input
          type="text"
          placeholder="Title"
          value={newNote.title}
          onChange={(e) => setNewNote({ ...newNote, title: e.target.value })}
        />
        <textarea
          placeholder="Body"
          value={newNote.body}
          onChange={(e) => setNewNote({ ...newNote, body: e.target.value })}
        />
        <input
          type="text"
          placeholder="Reminder (optional)"
          value={newNote.reminder}
          onChange={(e) => setNewNote({ ...newNote, reminder: e.target.value })}
        />
        <button onClick={addNote}>Add Note</button>
      </div>
    </div>
  );
};

export default App;
