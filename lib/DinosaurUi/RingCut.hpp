//#ifndef RINGCUT_H
//#define RINGCUT_H

//#include <QQuickItem>
//#include <QSGGeometry>
//#include <QSGTexture>

////#include "Global.hpp"

//using namespace std;

//class QSGMaterial;

//class RingCut : public QQuickItem
//{
//    Q_OBJECT
//    Q_PROPERTY(qreal ro READ ro WRITE setRo NOTIFY roChanged)
//    Q_PROPERTY(qreal ri READ ri WRITE setRi NOTIFY riChanged)
//    Q_PROPERTY(qreal startAngle READ startAngle WRITE setStartAngle NOTIFY startAngleChanged)
//    Q_PROPERTY(qreal endAngle READ endAngle WRITE setEndAngle NOTIFY endAngleChanged)
//    Q_PROPERTY(qreal angle READ angle WRITE setAngle NOTIFY angleChanged)
//    Q_PROPERTY(int div READ div WRITE setDiv NOTIFY divChanged)
//    Q_PROPERTY(QUrl tex READ tex WRITE setTex NOTIFY texChanged)
//    Q_PROPERTY(bool clockwise READ clockwise WRITE setClockwise NOTIFY clockwiseChanged)
//public:
//    /*!
//     * \brief RingCut
//     * \param parent
//     */
//    explicit RingCut(QQuickItem *parent = 0);

//    /*!
//     * \brief updatePaintNode
//     */
//    QSGNode *updatePaintNode(QSGNode *, UpdatePaintNodeData *);

//    /*!
//     * \brief ro
//     */
//    qreal ro() const { return mRo; }

//    /*!
//     * \brief ri
//     */
//    qreal ri() const { return mRi; }

//    /*!
//     * \brief startAngle
//     */
//    qreal startAngle() const { return mStartAngle; }

//    /*!
//     * \brief endAngle
//     */
//    qreal endAngle() const { return mEndAngle; }

//    /*!
//     * \brief angle
//     */
//    qreal angle() const { return mAngle; }

//    /*!
//     * \brief div
//     */
//    int div() const { return mDiv; }

//    /*!
//     * \brief tex
//     */
//    QUrl tex() const { return mTex; }

//    /*!
//     * \brief clockwise
//     */
//    bool clockwise() const { return mClockwise; }

//    void setRo(qreal);
//    void setRi(qreal);
//    void setStartAngle(qreal);
//    void setEndAngle(qreal);
//    void setAngle(qreal);
//    void setDiv(int);
//    void setTex(const QUrl &);
//    void setClockwise(bool);

//signals:
//    void roChanged();
//    void riChanged();
//    void startAngleChanged();
//    void endAngleChanged();
//    void angleChanged();
//    void divChanged();
//    void texChanged();
//    void clockwiseChanged();

//private:
//    qreal mRo;
//    qreal mRi;
//    qreal mStartAngle;
//    qreal mEndAngle;
//    qreal mAngle;
//    int mDiv;
//    QUrl mTex;
//    bool mClockwise;
//    bool mUpdateVertex;
//    std::shared_ptr<QSGTexture> mTexture;

//    QSGMaterial *createMaterial(const QUrl &);
//    void setVertex(QSGGeometry::TexturedPoint2D *vertex, qreal a);
//    bool urlToPath(const QUrl &url, QString &path);
//};


//#endif // RINGCUT_H
