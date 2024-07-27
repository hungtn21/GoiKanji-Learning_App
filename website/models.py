from . import db
from flask_login import UserMixin
from sqlalchemy.sql import func
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

class User(db.Model, UserMixin):
    __tablename__ = 'User'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=True)  
    dob = db.Column(db.Date, nullable=True,default=func.now()) 
    username = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    created_at = db.Column(db.DateTime,default=func.now())         
    progress = db.relationship('UserProgress', backref='user', lazy=True)
    comments = db.relationship('Comment', backref='user', lazy=True) 

class Lesson(db.Model):
    __tablename__ = 'Lesson'
    lesson_id = db.Column(db.Integer, primary_key=True)
    level_id = db.Column(db.Integer, nullable=True)
    title = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text, nullable=True)
    vocabulary = db.relationship('Vocabulary', backref='lesson', lazy=True)
    kanji = db.relationship('Kanji', backref='lesson', lazy=True)
    questions = db.relationship('Question', backref='lesson', lazy=True)
    progress = db.relationship('UserProgress', backref='lesson', lazy=True)

class Vocabulary(db.Model):
    __tablename__ = 'Vocabulary'
    vocab_id = db.Column(db.Integer, primary_key=True)
    lesson_id = db.Column(db.Integer, db.ForeignKey('Lesson.lesson_id'), nullable=True)
    hiragana = db.Column(db.Text, nullable=False)
    word = db.Column(db.String(50), nullable=False)
    meaning = db.Column(db.Text, nullable=False)
    example_sentence = db.Column(db.Text, nullable=True)
    comments = db.relationship('Comment', backref='vocabulary', lazy=True)

class Question(db.Model):
    __tablename__ = 'Question'
    question_id = db.Column(db.Integer, primary_key=True)
    lesson_id = db.Column(db.Integer, db.ForeignKey('Lesson.lesson_id'), nullable=False)
    type = db.Column(db.Integer, nullable=False)
    question_content = db.Column(db.Text, nullable=False)
    option_1 = db.Column(db.Text, nullable=False)
    option_2 = db.Column(db.Text, nullable=False)
    option_3 = db.Column(db.Text, nullable=False)
    option_4 = db.Column(db.Text, nullable=False)
    correct_answer = db.Column(db.Text, nullable=False)

class Kanji(db.Model):
    __tablename__ = 'Kanji'
    kanji_id = db.Column(db.BigInteger, primary_key=True)
    lesson_id = db.Column(db.BigInteger, db.ForeignKey('Lesson.lesson_id'), nullable=False)
    kanji = db.Column(db.String(20), nullable=False)
    photo = db.Column(db.Text, nullable=False)
    on = db.Column(db.Text, nullable=False)
    kun = db.Column(db.Text, nullable=False)
    meaning = db.Column(db.Text, nullable=False)
    example_sentence = db.Column(db.Text, nullable=False)
    comments = db.relationship('Comment', backref='kanji', lazy=True)

class UserProgress(db.Model):
    __tablename__ = 'UserProgress'
    progress_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id = db.Column(db.Integer, db.ForeignKey('User.id'))
    lesson_id = db.Column(db.Integer, db.ForeignKey('Lesson.lesson_id'))
    times_reviewed = db.Column(db.Integer)
    next_review = db.Column(db.DateTime)


class Comment(db.Model):
    __tablename__ = 'Comment'
    comment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    word_id = db.Column(db.Integer, db.ForeignKey('Vocabulary.vocab_id'), nullable=True)
    id = db.Column(db.Integer, db.ForeignKey('User.id'), nullable=True)
    content = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime, default=func.now())
    kanji_id = db.Column(db.BigInteger, db.ForeignKey('Kanji.kanji_id'), nullable=True)

class Todo(db.Model):
    __tablename__ = 'Todo'
    todo_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(200), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('User.id'), nullable=False)
    completed = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, default=func.now())
    updated_at = db.Column(db.DateTime, default=func.now(), onupdate=func.now())