const mongoose = require("mongoose");


mongoose
    .connect(process.env.DATABASE, {})
    .then(() => console.log("DB Connected..."))
    .catch((err) => console.log(`DB Connection Error : ${err}`));
///
///////