from flask import Blueprint, flash, g, redirect, render_template, request, url_for
from .db import get_db
bp = Blueprint("oglas", __name__, url_prefix="/oglas")


@bp.route('/search', methods=['GET'])
def search():
    marka=request.args.get('marka')
    model=request.args.get('model')
    gorivo=request.args.get('gorivo')
    tip_vozila=request.args.get('tip_vozila')
    menjac=request.args.get('menjac')
    
    upit='SELECT * FROM oglas'