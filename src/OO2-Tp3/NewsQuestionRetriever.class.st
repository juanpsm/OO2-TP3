Class {
	#name : #NewsQuestionRetriever,
	#superclass : #QuestionRetriever,
	#category : #'OO2-Tp3-Model'
}

{ #category : #retrieving }
NewsQuestionRetriever >> retrieveQuestions: aUser [
	| qRet temp questions |
	qRet := OrderedCollection new.
	questions := cuoora retrieveTodayQuestions.
	temp := self orderQuestionsByPositiveVotes: questions.
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = aUser ]
]
