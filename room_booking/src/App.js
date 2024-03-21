import './App.css';
import axios from 'axios'
import Rooms from "./components/rooms";
import { useEffect, useState } from "react";

const API_URL = "http://localhost:3000/api/v1/rooms/";

function getAPIData() {
  return axios.get(API_URL).then((response) => response.data);
}

function App() {
  const [rooms, setRooms] = useState([]);

  useEffect(() => {
    let mounted = true;
    getAPIData().then((items) => {
      if (mounted) {
        setRooms(items);
      }
    });
    return () => (mounted = false);
  }, []);

  return (
    <div className="App">
      <Rooms rooms={rooms} />
    </div>
  );
}
export default App;
