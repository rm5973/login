// Movie List Array
const movieList = [
    { name: "Flash", price: 100 },
    { name: "Spider-Man", price: 200 },
    { name: "Batman", price: 250 },
    { name: "Superman", price: 300 }
];

// Elements
const movieSelect = document.getElementById('selectMovie');
const movieNameElement = document.getElementById('movieName');
const moviePriceElement = document.getElementById('moviePrice');
const totalPriceElement = document.getElementById('totalPrice');
const selectedSeatsHolder = document.getElementById('selectedSeatsHolder');
const cancelBtn = document.getElementById('cancelBtn');
const proceedBtn = document.getElementById('proceedBtn');

// Initialize
let selectedSeats = [];
let totalPrice = 0;

// Populate the dropdown menu with movie options
function populateMovies() {
    movieList.forEach((movie, index) => {
        const option = document.createElement('option');
        option.value = index;
        option.textContent = movie.name;
        movieSelect.appendChild(option);
    });
    // Set default movie
    movieNameElement.textContent = movieList[0].name;
    moviePriceElement.textContent = `Rs ${movieList[0].price}`;
    totalPrice = movieList[0].price;
    totalPriceElement.textContent = `Rs ${totalPrice}`;
}

// Update movie name and price based on selection
function updateMovieDetails() {
    const selectedIndex = movieSelect.value;
    const selectedMovie = movieList[selectedIndex];
    movieNameElement.textContent = selectedMovie.name;
    moviePriceElement.textContent = `Rs ${selectedMovie.price}`;
    
    // Reset selected seats and total price when changing movies
    resetSelectedSeats();
    updateTotalPrice();  // Update price based on currently selected seats
}

// Reset selected seats and display
function resetSelectedSeats() {
    selectedSeats.forEach(seat => {
        seat.classList.remove('selected');
    });
    selectedSeats = []; // Clear the selected seats
    updateSelectedSeatsDisplay(); // Update the display
}

// Handle seat selection and deselection
function handleSeatSelection(event) {
    const seat = event.target;
    if (seat.classList.contains('occupied')) return; // Do nothing if the seat is occupied

    // Toggle selected state
    if (seat.classList.contains('selected')) {
        seat.classList.remove('selected');
        selectedSeats = selectedSeats.filter(s => s !== seat); // Remove seat from selected
    } else {
        seat.classList.add('selected');
        selectedSeats.push(seat); // Add seat to selected
    }

    // Update the selected seats display and total price
    updateSelectedSeatsDisplay();
    updateTotalPrice();
}

// Update the display of selected seats
function updateSelectedSeatsDisplay() {
    if (selectedSeats.length === 0) {
        selectedSeatsHolder.innerHTML = '<span class="noSelected">No Seat Selected</span>';
    } else {
        const seatNumbers = selectedSeats.map(seat => {
            const seatIndex = Array.from(document.querySelectorAll('#seatCont .seat')).indexOf(seat) + 1; // +1 for human-friendly index
            return `Seat ${seatIndex}`;
        });
        selectedSeatsHolder.innerHTML = seatNumbers.join(', ');
    }
    
    // Update the number of selected seats
    document.getElementById('numberOfSeat').textContent = selectedSeats.length; // Update the count displayed
}

// Update total price based on selected seats
function updateTotalPrice() {
    const moviePrice = movieList[movieSelect.value].price;
    totalPrice = selectedSeats.length * moviePrice;
    totalPriceElement.textContent = `Rs ${totalPrice}`;
}

// Handle proceed button click
function handleProceed() {
    if (selectedSeats.length === 0) {
        alert("Oops no seat Selected");
    } else {
        alert("Yayy! Your Seats have been booked");
        selectedSeats.forEach(seat => {
            seat.classList.remove('selected');
            seat.classList.add('occupied');
        });
        resetBooking();
    }
}

// Handle cancel button click
function handleCancel() {
    selectedSeats.forEach(seat => {
        seat.classList.remove('selected');
    });
    resetBooking();
}

// Reset booking state
function resetBooking() {
    selectedSeats = [];
    totalPrice = 0;
    totalPriceElement.textContent = `Rs ${totalPrice}`;
    selectedSeatsHolder.innerHTML = '<span class="noSelected">No Seat Selected</span>';
    document.getElementById('numberOfSeat').textContent = 0; // Reset the count displayed
}

// Event Listeners
movieSelect.addEventListener('change', () => {
    updateMovieDetails();
});

// Add event listeners to seats
const seats = document.querySelectorAll('#seatCont .seat');
seats.forEach(seat => {
    seat.addEventListener('click', handleSeatSelection);
});

// Proceed and Cancel buttons
proceedBtn.addEventListener('click', handleProceed);
cancelBtn.addEventListener('click', handleCancel);

// Initialize the movie dropdown and display
populateMovies();
