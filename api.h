#ifndef API_H
#define API_H

#include <QObject>
#include <QJSValue>

/*
 * var a
 * getter
 *
 * var b = a;
 *
*/


class API : public QObject {
    Q_OBJECT

    Q_PROPERTY(double first_value READ getFirst WRITE setFirst NOTIFY firstChanged)
    double m_first_value = .0;

public:
    explicit API(QObject *parent = nullptr);

    Q_INVOKABLE QJSValue add(double second);
    Q_INVOKABLE QJSValue minus(double second);
    Q_INVOKABLE QJSValue mult(double second);
    Q_INVOKABLE QJSValue del(double second);
    Q_INVOKABLE QJSValue procent(double second);

    double getFirst() const;

public slots:
    void setFirst(double first_value);

signals:

    void firstChanged(double first_value);
};

#endif // API_H
