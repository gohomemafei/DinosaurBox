//#include "RingCut.hpp"

//#include <QDebug>
//#include <QtMath>
//#include <QSGNode>
//#include <QQuickWindow>
//#include <QSGTextureMaterial>

//FUSION_BEGIN_NAMESPACE

//RingCut::RingCut(QQuickItem *parent)
//    : QQuickItem(parent), mRo(100), mRi(50),
//      mStartAngle(0), mEndAngle(360), mAngle(0), mDiv(8),
//      mClockwise(false), mUpdateVertex(false)
//{
//    setWidth(mRo * 2);
//    setHeight(mRo * 2);
//    setFlag(ItemHasContents, true);
//}

//void RingCut::setRo(qreal v)
//{
//    if (v == mRo)
//        return;

//    mRo = v;
//    setWidth(mRo * 2);
//    setHeight(mRo * 2);
//    mUpdateVertex = true;
//    emit roChanged();
//    update();
//}

//void RingCut::setRi(qreal v)
//{
//    if (v == mRi)
//        return;

//    mRi = v;
//    mUpdateVertex = true;
//    emit riChanged();
//    update();
//}

//void RingCut::setStartAngle(qreal v)
//{
//    if (v == mStartAngle)
//        return;

//    mStartAngle = v;
//    mUpdateVertex = true;
//    emit startAngleChanged();
//    update();
//}

//void RingCut::setEndAngle(qreal v)
//{
//    if (v == mEndAngle)
//        return;

//    mEndAngle = v;
//    mUpdateVertex = true;
//    emit endAngleChanged();
//    update();
//}

//void RingCut::setAngle(qreal v)
//{
//    if (v == mAngle)
//        return;

//    mAngle = v;
//    mUpdateVertex = true;
//    emit angleChanged();
//    update();
//}

//void RingCut::setDiv(int v)
//{
//    if (v == mDiv)
//        return;

//    mDiv = v;
//    emit divChanged();
//    update();
//}

//void RingCut::setTex(const QUrl &v)
//{
//    if (v == mTex)
//        return;

//    mTex = v;
//    emit texChanged();
//    update();
//}

//void RingCut::setClockwise(bool v)
//{
//    if (v == mClockwise)
//        return;

//    mClockwise = v;
//    emit clockwiseChanged();
//    update();
//}

//QSGNode *RingCut::updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *)
//{
//    QSGGeometryNode *node;
//    QSGGeometry *geometry;

//    if (!oldNode) {
//        node = new QSGGeometryNode;
//        geometry = new QSGGeometry(QSGGeometry::defaultAttributes_TexturedPoint2D(), 0);
//        geometry->setDrawingMode(GL_TRIANGLE_STRIP);
//        geometry->setVertexDataPattern(QSGGeometry::StreamPattern);
//        node->setGeometry(geometry);
//        node->setFlag(QSGNode::OwnsGeometry);
//        node->setMaterial(createMaterial(mTex));
//        node->setFlag(QSGNode::OwnsMaterial);
//    }
//    else {
//        node = static_cast<QSGGeometryNode *>(oldNode);
//        geometry = node->geometry();
//    }

//    if (mUpdateVertex) {
//        int ai;
//        qreal a, da = (mEndAngle - mStartAngle) / mDiv;

//        if (mClockwise) {
//            a = mEndAngle;
//            ai = (mEndAngle - mAngle) / da;
//        }
//        else {
//            a = mStartAngle;
//            ai = (mAngle - mStartAngle) / da;
//        }

//        geometry->allocate(2 * (ai + 2));
//        QSGGeometry::TexturedPoint2D *vertices = geometry->vertexDataAsTexturedPoint2D();

//        for (int i = 0; i <= ai; i++) {
//            setVertex(&vertices[2 * i], a);
//            a += mClockwise ? -da : da;
//        }
//        setVertex(&vertices[2 * (ai + 1)], mAngle);

//        node->markDirty(QSGNode::DirtyGeometry);
//        mUpdateVertex = false;
//    }

//    return node;
//}

//QSGMaterial *RingCut::createMaterial(const QUrl &url)
//{
//    QString path;
//    if (!urlToPath(url, path))
//        return NULL;

//    QSGTextureMaterial *material = new QSGTextureMaterial;
//    mTexture.reset(window()->createTextureFromImage(QImage(path)));
//    mTexture->setFiltering(QSGTexture::None);
//    mTexture->setHorizontalWrapMode(QSGTexture::ClampToEdge);
//    mTexture->setVerticalWrapMode(QSGTexture::ClampToEdge);
//    material->setTexture(mTexture.get());
//    return material;
//}

//void RingCut::setVertex(QSGGeometry::TexturedPoint2D *vertex, qreal a)
//{
//    qreal alpha = a * M_PI / 180;
//    qreal cosAlpha = qCos(alpha);
//    qreal sinAlpha = qSin(alpha);

//    qreal f = 1.02 / qCos((mEndAngle - mStartAngle) / mDiv / 2 * M_PI / 180);

//    vertex[0].x = mRo + mRo * f * cosAlpha;
//    vertex[0].y = mRo - mRo * f * sinAlpha;
//    vertex[0].tx = 0.5 + 0.5 * f * cosAlpha;
//    vertex[0].ty = 0.5 - 0.5 * f * sinAlpha;

//    vertex[1].x = mRo + mRi * cosAlpha;
//    vertex[1].y = mRo - mRi * sinAlpha;
//    vertex[1].tx = 0.5 + 0.5 * mRi / mRo * cosAlpha;
//    vertex[1].ty = 0.5 - 0.5 * mRi / mRo * sinAlpha;
//}

//bool RingCut::urlToPath(const QUrl &url, QString &path)
//{
//    if (url.scheme() == "file")
//        path = url.toLocalFile();
//    else if (url.scheme() == "qrc")
//        path = ':' + url.path();
//    else {
//        qWarning() << "invalide path: " << url;
//        return false;
//    }
//    return true;
//}

