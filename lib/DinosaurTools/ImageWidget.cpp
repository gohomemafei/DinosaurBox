#include "ImageWidget.h"

ImageWidget::ImageWidget(QWidget *parent) : QWidget(parent)
    ,m_fileName("")
    ,m_scale(0.7)
    ,m_width(200)
    ,m_height(200)
    ,m_title("ImageWidget")
{
    this->setWindowTitle( m_title);
    this->setMaximumSize( QSize( m_width, m_height));
    this->setMinimumSize( QSize( m_width, m_height));
}

void ImageWidget::paintEvent(QPaintEvent *)
{
    QPainter painter(this);
    m_pix.load(m_fileName);
    painter.setClipRect( 0, 0, m_width, m_height*m_scale);
    painter.drawPixmap(0, 0, m_width, m_height, m_pix);
}

void ImageWidget::setFileName(const QString &fileName)
{
    m_fileName = fileName;
    this->update();
}

void ImageWidget::setDisplayScale(const double &scale)
{
    m_scale = scale;
    this->update();
}

void ImageWidget::setWidgetSize(const int &w, const int &h)
{
    m_width = w;
    m_height = h;
    this->setMaximumSize( QSize( w, h));
    this->setMinimumSize( QSize( w, h));
}

void ImageWidget::setWidgetTitle(const QString &title)
{
    this->setWindowTitle(title);
}

