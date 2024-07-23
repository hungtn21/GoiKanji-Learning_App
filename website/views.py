from flask import Blueprint, render_template, request, flash, jsonify, redirect, url_for
from .models import User,Lesson,Vocabulary,Question,Comment
from flask_login import login_required, current_user
# from .models import Note
from . import db
import json

views = Blueprint('views', __name__)


@views.route('/', methods=['GET', 'POST'])
@login_required
def home():
    return render_template("home.html", user=current_user)

@views.route('/tuvung-<level>', methods=['GET'])
@login_required
def vocabulary_by_level(level):
    # Map level to level_id (you might need to adjust this mapping based on your actual implementation)
    level_map = {
        'n1': 1,
        'n2': 2,
        'n3': 3,
        'n4': 4,
        'n5': 5
    }
    level_id = level_map.get(level.lower())

    if level_id is None:
        return redirect(url_for('home'))
    print (level_id)
    lessons = Lesson.query.filter_by(level_id=level_id).all()
    return render_template('vocabulary_list.html', lessons=lessons, level=level)

# @views.route('/lesson/<int:lesson_id>/learn', methods=['GET'])
# @login_required
# def learn_vocabulary(lesson_id):
#     vocabularies = Vocabulary.query.filter_by(lesson_id=lesson_id).all()
#     return render_template('learn_vocabulary.html', vocabularies=vocabularies)

@views.route('/lesson/<int:lesson_id>/learn', methods=['GET','POST'])
@login_required
def lesson_vocabulary(lesson_id):
    # Lấy bài học từ cơ sở dữ liệu
    lesson = Lesson.query.get_or_404(lesson_id)
    vocabulary_list = Vocabulary.query.filter_by(lesson_id=lesson_id).all()
    
    # Số lượng từ vựng
    total_vocabularies = len(vocabulary_list)
    
    # Lấy index hiện tại từ request form
    current_index = int(request.form.get('index', 0))
    
    # Xử lý điều hướng
    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'next':
            if current_index < total_vocabularies - 1:
                current_index += 1
        elif action == 'prev':
            if current_index > 0:
                current_index -= 1

    # Lấy từ vựng hiện tại
    current_vocabulary = vocabulary_list[current_index] if total_vocabularies > 0 else None
    
    return render_template('lesson_vocabulary.html',
                           lesson=lesson,
                           current_vocabulary=current_vocabulary,
                           current_index=current_index,
                           total_vocabularies=total_vocabularies)

@views.route('/lesson/<int:lesson_id>/test', methods=['GET'])
@login_required
def take_test(lesson_id):
    questions = Question.query.filter_by(lesson_id=lesson_id).all()
    return render_template('test.html', questions=questions)

@views.route('/submit-test', methods=['POST'])
@login_required
def submit_test():
    # Xử lý dữ liệu kiểm tra gửi lên
    # Bạn cần viết mã để lưu kết quả kiểm tra của người dùng vào cơ sở dữ liệu
    return redirect(url_for('home'))
