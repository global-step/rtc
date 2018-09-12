const io = require('socket.io')();
let spaces = 3;
let classes = [
    {
        title: 'Maths',
        spaces: 3,
        start: 10 
    },
    {
        title: 'English',
        spaces: 4,
        start: 11
    },
    {
        title: 'History',
        spaces: 2,
        start: 11 
    },
    {
        title: 'Biology',
        spaces: 5,
        start: 12
    },
    {
        title: 'English',
        spaces: 3,
        start: 12 
    },
    {
        title: 'Physics',
        spaces: 5,
        start: 14 
    },
    {
        title: 'Japanese',
        spaces: 5,
        start: 14
    }
]
io.on('connection', (client) => {
    client.on('subscribeToTimer', (interval) => {
        console.log('client is subscribing to timer with interval ', interval);
        setInterval(() => {
            client.emit('timer', timeStamp());
        }, interval);
    });
    client.on('subscribeToSpaces', (interval) => {
        console.log('client is subscribing to spaces with interval ', interval);
        setInterval(() => {
            client.emit('spaces', spaces);
        }, interval);
    });
    client.on('subscribeToClasses', (interval) => {
        console.log('client is subscribing to classes with interval ', interval);
        setInterval(() => {
            client.emit('classes', classes);
        }, interval);
    });
    client.on('emitToSpaces', () => {
        spaces = spaces -1
    });
});
function timeStamp() {
    var now = new Date();
    var time = [ now.getHours(), now.getMinutes(), now.getSeconds() ];
    // Determine AM or PM suffix based on the hour
    var suffix = ( time[0] < 12 ) ? "AM" : "PM";
    // Convert hour from military time
    time[0] = ( time[0] < 12 ) ? time[0] : time[0] - 12;
    // If hour is 0, set it to 12
    time[0] = time[0] || 12;
    // If seconds and minutes are less than 10, add a zero
    for ( var i = 1; i < 3; i++ ) {
        if ( time[i] < 10 ) {
            time[i] = "0" + time[i];
        }
    }
    return time.join(":") + " " + suffix;
}
const port = 8000;
io.listen(port);
console.log('listening on port ', port);