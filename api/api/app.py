from flask import Flask, request, jsonify
import pyodbc

app = Flask(__name__)


CONNECTION_STRING = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost\\SQLEXPRESS;"
    "DATABASE=FinanzasPersonales;"
    "Trusted_Connection=yes;"
)


@app.route("/guardar", methods=["POST"])
def guardar():

    data = request.get_json()

    conexion = pyodbc.connect(CONNECTION_STRING)

    cursor = conexion.cursor()

    cursor.execute(
        """
        INSERT INTO movimientos
        (fecha, id_categoria, descripcion, monto)
        VALUES (?, ?, ?, ?)
        """,
        data["fecha"],
        data["categoria"],
        data["descripcion"],
        data["monto"]
    )

    conexion.commit()

    cursor.close()

    conexion.close()

    return jsonify({
        "ok": True
    })


if __name__ == "__main__":
    app.run(port=5000)