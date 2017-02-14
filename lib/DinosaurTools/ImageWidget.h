#ifndef IMAGEWIDGET_H
#define IMAGEWIDGET_H

#include <QWidget>
#include <QPixmap>
#include <QPainter>
#include <QSize>
#include <QString>

class ImageWidget : public QWidget
{
    Q_OBJECT
public:
    explicit ImageWidget(QWidget *parent = 0);

protected:
    void paintEvent(QPaintEvent *);

public:
    void setFileName( const QString &fileName);
    void setDisplayScale( const double &scale);
    void setWidgetSize( const int &w, const int &h);
    void setWidgetTitle( const QString &title);

private:
    QString m_fileName;
    QPixmap m_pix;
    double m_scale;
    int m_width;
    int m_height;
    QString m_title;

};

#endif // IMAGEWIDGET_H
