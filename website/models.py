from . import db
from flask_login import UserMixin
from sqlalchemy.sql import func
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

class User(db.Model, UserMixin):
    __tablename__ = 'User'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    created_at = db.Column(db.DateTime,default=func.now())
    last_login = db.Column(db.DateTime,default=func.now())

    progress = db.relationship('UserProgress', backref='user', lazy=True)
    community_posts = db.relationship('CommunityPost', backref='user', lazy=True)
    comments = db.relationship('Comment', backref='user', lazy=True) 

class Level(db.Model):
    __tablename__ = 'Level'
    level_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(10), nullable=False)

    lessons = db.relationship('Lesson', backref='level', lazy=True)

class Lesson(db.Model):
    __tablename__ = 'Lesson'
    lesson_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    level_id = db.Column(db.Integer, db.ForeignKey('Level.level_id'))
    title = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text)

    vocabulary = db.relationship('Vocabulary', backref='lesson', lazy=True)
    tests = db.relationship('Test', backref='lesson', lazy=True)
    progress = db.relationship('UserProgress', backref='lesson', lazy=True)

class Vocabulary(db.Model):
    __tablename__ = 'Vocabulary'
    vocab_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    lesson_id = db.Column(db.Integer, db.ForeignKey('Lesson.lesson_id'))
    word = db.Column(db.String(50), nullable=False)
    kanji = db.Column(db.String(50))
    meaning = db.Column(db.Text, nullable=False)
    example_sentence = db.Column(db.Text)

class Test(db.Model):
    __tablename__ = 'Test'
    test_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    lesson_id = db.Column(db.Integer, db.ForeignKey('Lesson.lesson_id'))
    created_at = db.Column(db.DateTime)

    questions = db.relationship('Question', backref='test', lazy=True)

class Question(db.Model):
    __tablename__ = 'Question'
    question_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    test_id = db.Column(db.Integer, db.ForeignKey('Test.test_id'))
    question_type = db.Column(db.Enum('multiple_choice', 'essay', name='question_type_enum'), nullable=False)
    content = db.Column(db.Text, nullable=False)

    choices = db.relationship('Choice', backref='question', lazy=True)

class Choice(db.Model):
    __tablename__ = 'Choice'
    choice_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    question_id = db.Column(db.Integer, db.ForeignKey('Question.question_id'))
    content = db.Column(db.Text, nullable=False)
    is_correct = db.Column(db.Boolean, nullable=False)

class UserProgress(db.Model):
    __tablename__ = 'UserProgress'
    progress_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id = db.Column(db.Integer, db.ForeignKey('User.id'))
    lesson_id = db.Column(db.Integer, db.ForeignKey('Lesson.lesson_id'))
    last_reviewed = db.Column(db.DateTime)
    next_review = db.Column(db.DateTime)

class CommunityPost(db.Model):
    __tablename__ = 'CommunityPost'
    post_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    id = db.Column(db.Integer, db.ForeignKey('User.id'))
    content = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime)

    comments = db.relationship('Comment', backref='post', lazy=True)

class Comment(db.Model):
    __tablename__ = 'Comment'
    comment_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    post_id = db.Column(db.Integer, db.ForeignKey('CommunityPost.post_id'))
    id = db.Column(db.Integer, db.ForeignKey('User.id'))
    content = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime)
    
# class User(db.Model, UserMixin):
#     id = db.Column(db.Integer, primary_key=True)
#     email = db.Column(db.String(150), unique=True)
#     password = db.Column(db.String(150))
#     first_name = db.Column(db.String(150))
#     notes = db.relationship('Note')

# class Note(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     data = db.Column(db.String(10000))
#     date = db.Column(db.DateTime(timezone=True), default=func.now())
#     user_id = db.Column(db.Integer, db.ForeignKey('user.id'))