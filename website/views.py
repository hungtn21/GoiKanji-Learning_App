from flask import Blueprint, render_template, request, redirect, url_for
from .models import User, Lesson, Vocabulary, Question, Comment, Kanji
from flask_login import login_required, current_user
from . import db

views = Blueprint('views', __name__)

@views.route('/', methods=['GET', 'POST'])
@login_required
def home():
    return render_template("home.html", user=current_user)

@views.route('/tuvung-<level>', methods=['GET'])
@login_required
def vocabulary_by_level(level):
    level_map = {
        'n1': 1,
        'n2': 2,
        'n3': 3,
        'n4': 4,
        'n5': 5
    }
    level_id = level_map.get(level.lower())
    if level_id is None:
        return redirect(url_for('views.home'))
    lessons = Lesson.query.filter_by(level_id=level_id).all()
    return render_template('vocabulary_list.html', lessons=lessons, level=level)

@views.route('/kanji-<level>', methods=['GET'])
@login_required
def kanji_by_level(level):
    level_map = {
        'n1': 11,
        'n2': 12,
        'n3': 13,
        'n4': 14,
        'n5': 15
    }
    level_id = level_map.get(level.lower())
    if level_id is None:
        return redirect(url_for('views.home'))
    lessons = Lesson.query.filter_by(level_id=level_id).all()
    return render_template('kanji_list.html', lessons=lessons, level=level)


@views.route('/lesson/<int:lesson_id>/learn', methods=['GET', 'POST'])
@login_required
def lesson_vocabulary(lesson_id):
    lesson = Lesson.query.get_or_404(lesson_id)
    vocabulary_list = Vocabulary.query.filter_by(lesson_id=lesson_id).all()
    total_vocabularies = len(vocabulary_list)
    current_index = int(request.form.get('index', 0))

    def get_next_comment_id():
        last_comment = Comment.query.order_by(Comment.comment_id.desc()).first()
        if last_comment:
            return last_comment.comment_id + 1
        return 1

    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'next':
            if current_index < total_vocabularies - 1:
                current_index += 1
        elif action == 'prev':
            if current_index > 0:
                current_index -= 1
        elif action == 'add_comment':
            comment_content = request.form.get('comment_content')
            if comment_content:
                next_comment_id = get_next_comment_id()
                new_comment = Comment(
                    comment_id=next_comment_id,
                    word_id=vocabulary_list[current_index].vocab_id,
                    id=current_user.id,
                    content=comment_content
                )
                db.session.add(new_comment)
                db.session.commit()
                return redirect(url_for('views.lesson_vocabulary', lesson_id=lesson_id, index=current_index))

    current_vocabulary = vocabulary_list[current_index] if total_vocabularies > 0 else None
    comments = Comment.query.filter_by(word_id=current_vocabulary.vocab_id).all() if current_vocabulary else []

    return render_template('lesson_vocabulary.html',
                           lesson=lesson,
                           current_vocabulary=current_vocabulary,
                           current_index=current_index,
                           total_vocabularies=total_vocabularies,
                           comments=comments)

@views.route('/kanjilesson/<int:lesson_id>/learn', methods=['GET', 'POST'])
@login_required
def lesson_kanji(lesson_id):
    lesson = Lesson.query.get_or_404(lesson_id)
    kanji_list = Kanji.query.filter_by(lesson_id=lesson_id).all()
    total_kanji = len(kanji_list)
    current_index = int(request.form.get('index', 0))

    def get_next_comment_id():
        last_comment = Comment.query.order_by(Comment.comment_id.desc()).first()
        if last_comment:
            return last_comment.comment_id + 1
        return 1

    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'next':
            if current_index < total_kanji - 1:
                current_index += 1
        elif action == 'prev':
            if current_index > 0:
                current_index -= 1
        elif action == 'add_comment':
            comment_content = request.form.get('comment_content')
            if comment_content:
                next_comment_id = get_next_comment_id()
                new_comment = Comment(
                    comment_id=next_comment_id,
                    kanji_id=kanji_list[current_index].kanji_id,
                    id=current_user.id,
                    content=comment_content
                )
                db.session.add(new_comment)
                db.session.commit()
                return redirect(url_for('views.lesson_kanji', lesson_id=lesson_id, index=current_index))

    current_kanji = kanji_list[current_index] if total_kanji > 0 else None
    comments = Comment.query.filter_by(kanji_id=current_kanji.kanji_id).all() if current_kanji else []

    return render_template('lesson_kanji.html',
                           lesson=lesson,
                           current_kanji=current_kanji,
                           current_index=current_index,
                           total_kanji=total_kanji,
                           comments=comments)

@views.route('/lesson/<int:lesson_id>/test', methods=['GET'])
@login_required
def take_test(lesson_id):
    print(lesson_id)
    questions = Question.query.filter_by(lesson_id=lesson_id).all()
    return render_template('test.html', questions=questions)

@views.route('/submit-test', methods=['POST'])
@login_required
def submit_test():
    return redirect(url_for('views.home'))
