from flask import Blueprint, flash, g, redirect, render_template, request, url_for
from .db import get_db
bp = Blueprint("oglas", __name__)


@bp.route("/search", methods=['GET'])
def search():
    upit = "SELECT * FROM oglas WHERE 1 = 1"
    marka=request.args.get('marka')
    if marka not in [None, ""]:
        upit+= f' AND id_marke = {marka}'

    model=request.args.get('model')
    if model not in [None, ""]:
        upit+= f' AND id_modela = {model}'

    gorivo=request.args.get('gorivo')
    if gorivo not in [None, ""]:
        upit+= f' AND id_goriva = {gorivo}'

<<<<<<< HEAD

    tip_vozila=request.args.get('tip_vozila')
    if tip_vozila not in [None, ""]:
        upit+= f' AND id_tipa = {tip_vozila}'

=======
>>>>>>> main
    menjac=request.args.get('menjac')
    if menjac not in [None, ""]:
        upit+= f' AND id_menjaca = {menjac}'

    cena_od=request.args.get('cena_od')
    if cena_od not in [None, ""]:
        upit+=f' AND cena>={cena_od}'

    cena_do = request.args.get('cena_do')
    if cena_do not in [None, ""]:
        upit += f' AND cena <= {cena_do}'

<<<<<<< HEAD
    godiste_od = request.args.get('godiste_od')
    if godiste_od not in [None, ""]:
        upit += f' AND godiste >= {godiste_od}'

    godiste_do = request.args.get('godiste_do')
    if godiste_do not in [None, ""]:
        upit += f' AND godiste <= {godiste_do}'

    kilometraza = request.args.get('kilometraza')
    if kilometraza not in [None, ""]:
        upit += f' AND kilometraza <= {kilometraza}'
=======
    godiste= request.args.get('godiste')
    if godiste:
        upit += f' AND godiste >= {godiste}'

    ''' godiste_do = request.args.get('godiste_do')
    if godiste_do:
        upit += f' AND godiste <= {godiste_do}'''

>>>>>>> main

    print(upit)
    db = get_db()
    results = db.execute(upit).fetchall()
    return results

@bp.route("/get_models/<int:id>", methods=['GET'])
def get_models(id):
    models = get_db().execute(
        "SELECT mo.id as id, mo.naziv as naziv FROM model mo JOIN marka ma ON ma.id = mo.id_marke WHERE ma.id = ?", (id,)
    ).fetchall()
    for m in models:
        print(m)
    return models

@bp.route('/view<int:id>')
def view(id):
    db=get_db()
    oglas=db.execute('SELECT * FROM oglas WHERE id=?',(id,)).fetchone()
    return render_template('oglas/view.html',oglas=oglas)