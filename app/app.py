# Le moteur de pap_siteweb

import web


render = web.template.render('templates/', base='layout')
db = web.database(dbn='mysql', user='webpy', pw='webpy', db='pap_siteweb')
app = web.application(urls, globals())

# URLS
urls = (
    '/', 'Index',
    '/(.+)',  'Categorie'
)

class Index:
    """page d'accueil montrant l'ensemble des categories"""
    def GET(self):
        return render.index()


class Categorie:
    """page affichant les sites pour une categorie feuille"""
    def GET(self, categorie_nom):
        # categorie_dict
        where_cond = "nom_url = '%s'" % (categorie_nom)
        categorie_dicts = db.select('categories', where=where_cond)
        if not categorie_dicts:
          raise web.notfound() 
        categorie_dict = categorie_dicts[0]
        # sites
        where_cond = "categorie = '%d'" % (categorie_dict.id)
        sites = db.select('sites', where=where_cond)
        # etiquettes
        sites_list = list(sites)
        for site in sites_list:
          sql_query = """
            select etiquettes.nom, etiquettes.description from
            etiquettes inner join site_etiquettes 
            where 
              site_etiquettes.etiquette = etiquettes.id and 
              site_etiquettes.site = 2
          """ 
          etiquettes = db.query(sql_query)
          site.update( {'etiquettes': etiquettes} )
        return render.categorie(categorie_dict, sites_list)


if __name__ == '__main__':
    app.run()

# TODO: customize not found
