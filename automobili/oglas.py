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


    tip_vozila=request.args.get('tip_vozila')
    menjac=request.args.get('menjac')
    cena_od=request.args.get('cena_od')
    if cena_od is not "":
        upit+=f' AND cena>={cena_od}'
    print (upit)
    results=get_db().execute(upit).fetchall()
    return render_template('home.html',oglasi=results)