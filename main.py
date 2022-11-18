from locale import currency
from turtle import onclick
from pywebio.input import *
from pywebio.output import *
from pywebio.pin import *
from pywebio.session import *
from pywebio import start_server
import database
from datetime import datetime
import time

db = None

def app():
	add_more = True

	while add_more:
		db = database.koneksi()
		cursor = db.cursor()
		query = """SELECT name_equip FROM equip"""
		cursor = db.cursor()
		cursor.execute(query)
		dataequ = cursor.fetchall()
		dataequ = [i for sub in dataequ for i in sub]
		cursor.close()

		query = """SELECT nama_tipe FROM tipe_equip"""
		cursor = db.cursor()
		cursor.execute(query)
		datatipe = cursor.fetchall()
		datatipe = [i for sub in datatipe for i in sub]
		cursor.close()

		data = input_group("Form Load Test Motor Electrical",[
			input('Tanggal', name='tgl', type=DATE, required=True),
			input('No. WO', name='wo', required=True),
			select("Equipment", [dataequ[0],dataequ[1],dataequ[2]], name='equ', required=True),
			select("Tipe Motor", [datatipe[0],datatipe[1]], name='tipe', required=True)
		])

		query="""SELECT id_equip FROM equip WHERE name_equip='%s'""" % (data['equ'])
		cursor = db.cursor()
		cursor.execute(query)
		equ2 = cursor.fetchall()
		equ2 = [i for sub in equ2 for i in sub]
		cursor.close()

		query="""SELECT id_tipeq FROM tipe_equip WHERE nama_tipe='%s'""" % (data['tipe'])
		cursor = db.cursor()
		cursor.execute(query)
		tipe2 = cursor.fetchall()
		tipe2 = [i for sub in tipe2 for i in sub]
		cursor.close()
		
		data2=input_group(f"{data['equ']} {data['tipe']}",[
		input('No load i1', name='nl1', required=True),
		input('No load i2', name='nl2', required=True),
		input('No load i3', name='nl3', required=True),
		input('Loaded i1', name='lo1', required=True),
		input('Loaded i2', name='lo2', required=True),
		input('Loaded i3', name='lo3', required=True),
		])

		query = """INSERT INTO test (tgl, no_wo, id_equip, id_tipeq, nli1, nli2, nli3, loi1, loi2, loi3) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"""
		val = data['tgl'], data['wo'], equ2[0], tipe2[0], data2['nl1'], data2['nl2'], data2['nl3'], data2['lo1'], data2['lo2'], data2['lo3']
		cursor = db.cursor()
		cursor.execute(query,val)
		db.commit()
		cursor.close()

		popup(title='SUCCESS..!!', content='Data Berhasil Tersimpan')

		add_more = actions(label="Input Data Baru?",
							buttons=[{'label': 'Yes', 'value': True}, 
                                 	{'label':'No', 'value': False}])
	put_markdown("# RESULT")

	query="""SELECT DISTINCT no_wo FROM test"""
	cursor = db.cursor()
	cursor.execute(query)
	datawo = cursor.fetchall()
	datawo = [i for sub in datawo for i in sub]
	cursor.close()
	db.close()
	
	put_select('nowo', label='No. WO', options=datawo)
	put_input('tgldari', type=DATE, label='From)')
	put_input('tglsampai', type=DATE, label='To')

	def convert(kapan):
		date_string = kapan
		date_time = datetime.strptime(date_string, '%Y-%m-%d')
		
		unix = time.mktime(date_time.timetuple())
		unix = str(unix)
		return f"{unix.split('.')[0]}000"

	def submit():
		with use_scope('res', clear=True):
			a=convert(pin.tgldari)
			b=convert(pin.tglsampai)

			c22emd = f'<center><iframe src="http://202.50.203.104:3000/d-solo/p70WmA7Vk/new-dashboard?orgId=1&var-wo={pin.nowo}&from={a}&to={b}&theme=light&panelId=10" width="900" height="400" frameborder="0"></iframe></center>'
			put_html(c22emd)

	put_buttons(['Submit'], onclick=[submit])

	hold()

if __name__ == '__main__':
	start_server(app, port=5454, debug=True)