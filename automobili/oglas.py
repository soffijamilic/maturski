from flask import Blueprint, flash, g, redirect, render_template, request, url_for
from .db import get_db
bp = Blueprint("oglas", __name__)


@bp.route('/search', methods=['GET'])
def search():
    upit = "SELECT * FROM oglas WHERE 1 = 1"
    marka=request.args.get('marka')
    if marka is not None:
        upit+= f' AND id_marke = {marka}'

    model=request.args.get('model')
    if model is not None:
        upit+= f' AND id_modela = {model}'

    gorivo=request.args.get('gorivo')
    if gorivo is not None:
        upit+= f' AND id_goriva = {gorivo}'

    menjac=request.args.get('menjac')
    if menjac is not None:
        upit+= f' AND id_menjaca = {menjac}'

    cena_od=request.args.get('cena_od')
    if cena_od is not "":
        upit+=f' AND cena>={cena_od}'

    cena_do = request.args.get('cena_do')
    if cena_do:
        upit += f' AND cena <= {cena_do}'

    godiste_od = request.args.get('godiste_od')
    if godiste_od:
        upit += f' AND godiste >= {godiste_od}'

    godiste_do = request.args.get('godiste_do')
    if godiste_do:
        upit += f' AND godiste <= {godiste_do}'


    print(upit)
    db = get_db()
    results = db.execute(upit).fetchall()
    return render_template('home.html', oglasi=results)