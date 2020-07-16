#include "api.h"

#include <QDebug>

API::API(QObject *parent) : QObject(parent) {}

QJSValue API::add(double second) {
    return QJSValue(m_first_value + second);
}

QJSValue API::minus(double second) {
    return QJSValue(m_first_value - second);
}

QJSValue API::mult(double second) {
    return QJSValue(m_first_value * second);
}

QJSValue API::del(double second) {
        return QJSValue(m_first_value / second);
}

QJSValue API::procent(double second) {
        return QJSValue((m_first_value /100) * second);
}

double API::getFirst() const {return m_first_value;}

void API::setFirst(double first_value) {
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_first_value, first_value))
        return;

    m_first_value = first_value;
    emit firstChanged(m_first_value);
}

