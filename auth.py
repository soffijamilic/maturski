from flask import Blueprint, flash, redirect, render_template, request, session, url_for, g
import functools
from .db import get_db
bp = Blueprint("auth", __name__, url_prefix="/auth")

@bp.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        # uzimamo podatke iz forme
        username = request.form.get("username")
        lozinka = request.form.get("password")
        db = get_db()
        error = None
        print(username, lozinka)
        # proveravamo da li korisnik sa datim username-om postoji
        korisnik = db.execute(
            "SELECT * FROM korisnik WHERE username = ?", (username,)
        ).fetchone()

        if korisnik is None:
            error = "Netacan username i/ili lozinka."
        elif not korisnik['lozinka'] == lozinka:
            error = "Netacan username i/ili lozinka."

        if error is None:
            # ulogujemo korisnika
            return redirect(url_for("index"))

        flash(error)
    
    return render_template("auth/login.html")



@bp.route("/logout", methods=["GET"])
def logout():
    
    return redirect(url_for("index"))


def login_required(view):
    @functools.wraps(view)
    def wrapped_view(**kwargs):
        if g.user is None:
            return redirect(url_for('auth.login'))

        return view(**kwargs)

    return wrapped_view
