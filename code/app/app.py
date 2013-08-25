# Le moteur de pap_siteweb

import web

render = web.template.render('templates/')
db = web.database(dbn='mysql', user='webpy', pw='webpy', db='pap_siteweb')

urls = (
    '/', 'index',
    '/(.+)',  'categorie'
)


class index:
    """page d'accueil montrant l'ensemble des categories"""
    def GET(self):
        return render.index()


class categorie:
    """page affichant les sites pour une categorie feuille"""
    def GET(self, categorie_nom):
        where_cond = "nom_url = '%s'" % (categorie_nom)
        categorie_dict = db.select('categories', where=where_cond)
        print categorie_dict
        return render.categorie(categorie_dict[0])


if __name__ == '__main__':
    app = web.application(urls, globals())
    app.run()
