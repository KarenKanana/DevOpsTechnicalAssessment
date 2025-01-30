// Snowflake generation function
function createSnowflakes() {
    const snowflakesContainer = document.querySelector('.snowflakes');
    const numberOfSnowflakes = 150; 
    
    for (let i = 0; i < numberOfSnowflakes; i++) {
        const snowflake = document.createElement('div');
        snowflake.classList.add('snowflake');
        
        // Randomize size, animation duration, and starting position of snowflakes
        const size = Math.random() * 5 + 5; 
        const animationDuration = Math.random() * 3 + 9; 

        snowflake.style.width = `${size}px`;
        snowflake.style.height = `${size}px`;
        snowflake.style.animationDuration = `${animationDuration}s`;
        snowflake.style.left = `${Math.random() * 100}vw`; 

        snowflakesContainer.appendChild(snowflake);
    }
}

createSnowflakes();
