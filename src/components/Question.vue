<template>
	<div>
		<h3>
			{{this.question.title}}
		</h3>
		<div>
			<b-form-group label="Варианты ответа">
		      <b-form-radio 
		     	v-model="selected"
		      	v-for="(answer, index) of this.question.answers" 
		      	name="some-radios" 
		      	:value="index">
		      	{{answer}}
		      </b-form-radio>
		    </b-form-group>
		    {{selected}}
		</div>
		{{!this.selectedLen}}
		Counter === {{counts}}
		<div>
		  <b-button variant="danger" @click="prevQuestion" :disabled="!isPrevQuestions">Prev questions</b-button>
		  <b-button 
		  	v-if="!this.isQuestionsEnd"
		  	variant="success"
		  	@click="nextQuestion""
		  	:disabled="!this.selectedLen"
		  >
		  	Next questions
		  	
		  </b-button>

		  <b-button
		  	v-else 
		  	variant="success"
		  	:disabled="!this.selectedLen"
		  >
		  	Check
		  	
		  </b-button>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				title: this.question.title,
				answers: this.question.answers,
				selected: '',
				counts: this.counter
			}
		},
		props: {
			question: {
				type: Object
			},
			isQuestionsEnd: {
				type: Boolean
			},
			counter: { 
				type: Number
			}
		},
		methods: {
			learnObj() {
				console.log(this.question)
			},
			nextQuestion() {		
				this.$emit("next", this.selected);
				this.selected = '';
			},
			prevQuestion() {
				this.$emit("prev");
			}
		},
		computed: {
			selectedLen() {
				return this.selected !== '';
			},
		}
	}
</script>

<style>
	
</style>