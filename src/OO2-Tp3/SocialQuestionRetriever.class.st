Class {
	#name : #SocialQuestionRetriever,
	#superclass : #QuestionRetriever,
	#category : #'OO2-Tp3-Model'
}

{ #category : #retrieving }
SocialQuestionRetriever >> retrieveQuestions: aUser [
	| qRet temp questions |
	qRet := OrderedCollection new.
	questions := aUser retrieveFollowingQuestions.
	temp := self orderQuestionsByPositiveVotes: questions.
	qRet := temp last: (100 min: temp size).
	^ qRet reject: [ :q | q user = aUser ]
]
