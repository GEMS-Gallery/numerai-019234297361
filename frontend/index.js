import { backend } from 'declarations/backend';

document.getElementById('numerologyForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const name = document.getElementById('name').value;
    const dateOfBirth = document.getElementById('dateOfBirth').value.replace(/-/g, '');
    
    try {
        const reading = await backend.getNumerologyReading(name, dateOfBirth);
        const resultDiv = document.getElementById('result');
        resultDiv.textContent = reading;
        resultDiv.classList.remove('hidden');
    } catch (error) {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    }
});
