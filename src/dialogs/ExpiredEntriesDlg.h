/***************************************************************************
 *   Copyright (C) 2007 by Tarek Saidi                                     *
 *   tarek.saidi@arcor.de                                                  *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; version 2 of the License.               *

 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/
  
#ifndef _EXP_ENTRIES_DLG_
#define _EXP_ENTRIES_DLG_

#include "keepassx.h"
#include "ui_ExpiredEntriesDlg.h"


class ExpiredEntriesDialog:public QDialog, private Ui_ExpiredEntriesDialog{
	Q_OBJECT
	public:
		ExpiredEntriesDialog(QWidget* parent,IDatabase* database,const QList<IEntryHandle*>& Entries);
		IEntryHandle* SelectedEntry;		
	private:
		QList<IEntryHandle*> Entries;
		QPixmap BannerPixmap;
		virtual void paintEvent(QPaintEvent*);
		virtual void resizeEvent(QResizeEvent *);
	
	private slots:
		void OnItemDoubleClicked(QTreeWidgetItem*);
	
	
};


#endif
