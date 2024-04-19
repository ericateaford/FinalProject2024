document.addEventListener('DOMContentLoaded', function() {
    const numberOfQuestionsInput = document.getElementById('number-of-questions');
    numberOfQuestionsInput.addEventListener('change', function() {
      const numberOfQuestions = this.value;
      const surveyQuestionsDiv = document.getElementById('survey-questions');
      surveyQuestionsDiv.innerHTML = '';
      fetch('/questions.json')
        .then(response => response.json())
        .then(questions => {
          for (let i = 0; i < numberOfQuestions; i++) {
            const questionField = document.createElement('div');
            questionField.innerHTML = `
              <label for="survey_survey_questions_attributes_${i}_question_id">Question</label>
              <select name="survey[survey_questions_attributes][${i}][question_id]" id="survey_survey_questions_attributes_${i}_question_id">
                ${questions.map(question => `<option value="${question.id}">${question.desc}</option>`).join('')}
              </select>
            `;
            surveyQuestionsDiv.appendChild(questionField);
          }
        });
    });
  });