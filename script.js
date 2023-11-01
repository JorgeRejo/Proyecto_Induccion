/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function generateCalendar(year, month) {
    const firstDay = new Date(year, month - 1, 1);
    const lastDay = new Date(year, month, 0);
    const table = document.querySelector(".calendar table");
    const header = document.querySelector("#month-year");
    header.textContent = `${getMonthName(month)} ${year}`;
    table.innerHTML = "";

    // Crear los encabezados de la semana
    const weekHeader = document.createElement("tr");
    for (let i = 0; i < 7; i++) {
        const th = document.createElement("th");
        th.textContent = getDayName(i);
        weekHeader.appendChild(th);
    }
    table.appendChild(weekHeader);

    // Calcular y llenar los días del mes
    let currentDate = new Date(firstDay);
    let currentRow = document.createElement("tr");

    while (currentDate <= lastDay) {
        if (currentDate.getDay() === 0 && currentRow.childNodes.length > 0) {
            table.appendChild(currentRow);
            currentRow = document.createElement("tr");
        }

        const td = document.createElement("td");
        td.textContent = currentDate.getDate();
        currentRow.appendChild(td);
        currentDate.setDate(currentDate.getDate() + 1);
    }

    if (currentRow.childNodes.length > 0) {
        table.appendChild(currentRow);
    }
}

function getMonthName(month) {
    const months = [
        "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
    ];
    return months[month - 1];
}

function getDayName(day) {
    const days = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
    return days[day];
}

// Generar el calendario para octubre de 2023 al cargar la página
generateCalendar(2023, 10);
