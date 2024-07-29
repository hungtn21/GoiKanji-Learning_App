This project is developed by the HUST - SIT student team as part of the online session of gPBL (global Project-Based Learning) 2024. Our project is designed to help you learn vocabulary and Kanji effectively through three main solutions:

**1. Structured Learning Materials:** We provide a systematized library of materials categorized by proficiency levels, making it easy to find content that matches your current level.
**2. Spaced Repetition Method:** To ensure long-term retention, we employ the Spaced Repetition method combined with quizzes. This approach helps you review vocabulary more effectively.
**3. Community Interaction: **You can share your mnemonic techniques through comments and receive assistance from fellow learners.

**Instruction**

Make sure that the Python version you are using is the latest version.

Please install the following frameworks and packages in the `requirements.txt` before you test the program:

```
    pip install Flask

    pip install Flask-SQLAlchemy

    pip install psycopg2-binary

    pip install flask_login
```

We're using PosgreSQL for this web app, you can download this at:

```
    https://www.postgresql.org/download/.
```

After installing PostgreSQL, please create a database and run the code in the file `data_vocab_v2.sql` .

You need to edit the following line of code in the `__init__.py` file:

```
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:Ngochung%402004@localhost/NewNihongoapp'
```

with the following syntax:

```
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:your password@localhost/your database name'
```

Finally, try running the `main.py` file to use the program.

Demo Video:
[Demo Video of GoiKanji-Learning-App](https://drive.google.com/file/d/1KFPHlBEIqW6jflmphGkkFVQXISulyADR/view?usp=sharing)

Many thanks to: **Sun Asterisk**, **Hanoi University of Science and Technology (HUST)**, **Shibaura Institute of Technology (SIT)** on supporting us on this project.
