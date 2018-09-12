import openSocket from 'socket.io-client';
const socket = openSocket('http://localhost:8000');

function subscribeToTimer(interval, cb) {
    socket.on('timer', timestamp => cb(null, timestamp));
    socket.emit('subscribeToTimer', interval);
}
function subscribeToSpaces(interval, cb) {
    socket.on('spaces', spaces => cb(null, spaces));
    socket.emit('subscribeToSpaces', interval);
}
function subscribeToClasses(interval, cb) {
    socket.on('classes', classes => cb(null, classes));
    socket.emit('subscribeToClasses', interval);
}
function emitToSpaces(cb) {
    socket.on('emitToSpaces', spaces => cb(null, spaces));
    socket.emit('emitToSpaces');
}
export { subscribeToTimer, subscribeToSpaces, subscribeToClasses, emitToSpaces }