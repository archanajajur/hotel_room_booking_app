import React from "react";

function Rooms(props) {
  return (
    <div>
      <h1>List of rooms</h1>
      <table class="table table-bordered">
        <thead>
        <tr>
        <th scope="col">Name</th>
        <th scope="col">Description</th>
        <th scope="col">Location</th>
        </tr>
        </thead>
      {props.rooms.map((room) => {
        return (
          <tr table key={room.id}>
            <td>{room.name}</td>
            <td>{room.description}</td>
            <td>{room.location_id}</td>
          </tr>
        );
      })}
       
      </table>
    </div>
  );
}

export default Rooms;